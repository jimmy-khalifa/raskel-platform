from ariadne import QueryType, MutationType
from ..models import Producer, Property, PropertyType

property_query = QueryType()

@property_query.field('properties_by_producer')
def resolve_properties_by_producer(_, info, producerId):
    prod = Producer.objects.get(pk=producerId)
    properties_queryset = Property.objects.filter(producer=prod)

    return list(properties_queryset)

@property_query.field('property')
def resolve_property(_, info, propertyId):
    property = Property.objects.get(pk=propertyId)
    if property : return property
    return None

@property_query.field('all_property_types')
def resolve_all_property_types(*_):
    return PropertyType.objects.all()

property_mutation = MutationType()

@property_mutation.field('create_property')
def resolve_create_property(_, info, input):
    producer = Producer.objects.get(pk=input["producerId"])
    type = PropertyType.objects.get(pk=input["typeId"])
    property = Property.objects.create(area=input["area"], individuals=input["individuals"], has_garden=input["has_garden"], 
    has_garage=input["has_garage"], has_barn=input["has_barn"], producer=producer, type=type, address=producer.address)

    property.save()

    return {'created': True, 'property': property, 'err': ''}

@property_mutation.field('create_property_type')
def resolve_create_property_type(_, info, input):
    property_type = PropertyType.objects.create(code=input["code"], name=input["name"])
    property_type.save()
    return {'created': True, 'propertyType': property_type, 'err': ''}