from ariadne import QueryType
from ..models import Country

country_query = QueryType()

@country_query.field('all_countries')
def resolve_countries(*_):
    return Country.objects.all()