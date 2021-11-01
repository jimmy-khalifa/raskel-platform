from ariadne import QueryType, make_executable_schema, MutationType
from ..models import Producer

query = QueryType()

@query.field('all_producers')
def resolve_producers(*_):
    return Producer.objects.all()

mutation = MutationType()

@mutation.field('add_producer')
def resolve_add_producer(_,info, input):

    producer = Producer.objects.create(first_name=input['first_name'], last_name=input['last_name'], date_of_birth=input['date_of_birth'], age=input['age'],
    phone_number=input['phone_number'], email=input['email'], cin=input['cin'], cin_delivery=input['cin_delivery'], is_principal=input['is_principal'])      
    return {'created': True, 'producer': producer, 'err': None}