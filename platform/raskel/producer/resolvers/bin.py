from ..models import Bin, BinType, BinBrand, Producer
from ariadne import QueryType, MutationType
from ariadne_jwt.decorators import login_required

bin_query = QueryType()
@bin_query.field('bins_by_producer')
def resolve_bins_by_producer(_,info,producerId):
    prod = Producer.objects.get(pk=producerId)
    bins_queryset = Bin.objects.filter(producer= prod)
    return list(bins_queryset)

@bin_query.field('bin')
def resolve_bin(_,info,binId):
    bin = Bin.objects.get(pk= binId)
    if bin : return bin
    return None

@bin_query.field('all_bin_types')
def resolve_all_bin_types(*_):
    return BinType.objects.all()

@bin_query.field('all_bin_brands')
def resolve_all_bin_brands(*_):
    return BinBrand.objects.all()

bin_mutation = MutationType()

@bin_mutation.field('create_bin')
def resolve_create_bin(_,info,input):
    producer = Producer.objects.get(pk= input["producerId"])
    type = BinType.objects.get(pk= input["typeId"])
    brand = BinBrand.objects.get(pk= input["brandId"])
    bin = Bin.objects.create(size= input["size"],volume=input["volume"],color=input["color"],producer=producer,type=type,brand=brand)
    bin.save()
    return {"created":True, "bin": bin, "err": ""}


@bin_mutation.field('create_bintype')
def resolve_create_bintype(_,info,input):
    bin_type= BinType.objects.create(code=input["code"], name=input["name"])
    bin_type.save()
    return {'created': True, 'binType': bin_type, 'err': ''}

@bin_mutation.field('create_binbrand')
def resolve_create_bin_brand(_,info,input):
   # address = Address.objects.get(pk=input["address"])
    bin_brand= BinBrand.objects.create(code=input["code"], name=input["name"],company=input["company"],phone_one=input["phone_one"],phone_two=input["phone_two"],email= input["email"],website=input["website"])
    bin_brand.save()
    return {'created': True, 'binBrand': bin_brand, 'err': ''}

@bin_mutation.field('modify_bin') 
def resolve_modify_bin(_,info,input):
    #we get the property with it's id
   

    type= None 
    brand=None

    if(input['typeId']!= None) : type = BinType.objects.get(pk= input['typeId'])
    if(input['brandId']!= None) : brand = BinBrand.objects.get(pk= input['brandId'])
    if (input['producerId'] !=None) : producer = Producer.objects.get(pk= input['producerId'])
    bin = Bin.objects.get(pk=input['id'])

    #to modify property
    if (input['size'] !=None) : bin.size = input['size']
    if(input['volume'] !=None) :bin.volume= input['volume']
    if (input['color']!=None) : bin.color = input['color']
    if(type!= None) : bin.type = type
    if(brand != None) : bin.brand = brand
    if (producer != None): bin.producer = producer
    bin.save()
    return {'modified': True, 'bin': bin, 'err': None}
