from email.mime import image
from ariadne import QueryType, MutationType
from ariadne_jwt.decorators import login_required
from ..models import Producer

prod_query = QueryType()

@prod_query.field('all_producers')
def resolve_producers(*_):
    return Producer.objects.all()

@prod_query.field('producer')
def resolve_producer(_, info, producerId):
    prod = Producer.objects.get(pk=producerId)
    if prod:
        return prod
    else:
        return None


@prod_query.field('producer_by_user')
@login_required
def resolve_producer_by_user(_, info):
    producer_queryset = Producer.objects.filter(user=info.context.get('request').user)
    return producer_queryset[0]

prod_mutation = MutationType()
 

@prod_mutation.field('modify_producer')
def resolve_modify_producer(_,info, input):

    producer = Producer.objects.get(pk=input['id']);
    
    if('date_of_birth' in input) : producer.date_of_birth = input['date_of_birth']
    if('age' in input) : producer.age = input['age']
    if('cin' in input) : producer.cin = input['cin']
    if('cin_delivery' in input) : producer.cin_delivery = input['cin_delivery']

    producer.save()

    return {'modified': True, 'producer': producer, 'err': None}

upload_mutation = MutationType() 


@upload_mutation.field('uploadUserImage')
def resolve_modify_producer(_, info, image):
    producer_queryset = Producer.objects.filter(user=info.context.get('request').user)
    prod = producer_queryset[0]
    prod.image = image

    prod.save()
    return True

upload_mutation_cin_front = MutationType()

@upload_mutation_cin_front.field('uploadCinFront')
def resolve_modify_producer(_, info, cin_pic_front):
    producer_queryset = Producer.objects.filter(user=info.context.get('request').user)
    prod = producer_queryset[0]
    prod.cin_pic_front = cin_pic_front

    prod.save()
    return True

upload_mutation_cin_back = MutationType()

@upload_mutation_cin_back.field('uploadCinBack')
def resolve_modify_producer(_, info, cin_pic_back):
    producer_queryset = Producer.objects.filter(user=info.context.get('request').user)
    prod = producer_queryset[0]
    prod.cin_pic_back = cin_pic_back

    prod.save()
    return True