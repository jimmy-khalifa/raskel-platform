from ariadne import QueryType, MutationType
from django.contrib.gis.geos import Point
from ..models import Address, District
from producer.models import Producer

#The querytype that defines the address queries
address_query = QueryType()


@address_query.field('all_addresses')
def all_addresses(*_):
    return Address.objects.all()


@address_query.field('address')
def address(_, info, addressId):
    address = Address.objects.get(pk=addressId)
    if address : 
        return address
    else:
        return None

@address_query.field('address_by_producer')
def resolve_address_by_producer(_, info, producerId):
    prod = Producer.objects.get(pk=producerId)
    adress_query_set = Address.objects.filter(producer= prod)
    return list(adress_query_set)
    



# mutationtype defining all address mutations
address_mutation = MutationType()


@address_mutation.field('modify_address')
def resolve_modify_address(_, info, input):
    # we define first the district
    district = None

    # if it is set in the input we try to get it
    if(input['district_id'] != None): district = District.objects.get(pk=input['district_id'])

    # we get the address with its id
    address = Address.objects.get(pk=input['id'])

    # we modify the address
    if(input['label'] != None): address.label = input['label']
    if(input['zipcode'] != None): address.zipcode = input['zipcode']
    if(input['latitude'] != None and input['longitude'] != None): address.latlong = Point(x=input['longitude'], y=input['latitude'])

    if(input['is_spatial'] != None): address.is_spatial = input['is_spatial']
    if(district != None): address.district = district

    # we save it
    address.save()
    return {'modified': True, 'address': address, 'err': None}