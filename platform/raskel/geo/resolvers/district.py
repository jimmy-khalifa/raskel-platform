from ariadne import QueryType
from ..models import District

district_query = QueryType()

@district_query.field('all_districts')
def resolve_districts(*_):
    return District.objects.all()