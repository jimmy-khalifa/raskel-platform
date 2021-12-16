from ariadne import QueryType
from ..models import State, Country

state_query = QueryType()

@state_query.field('all_states')
def resolve_states(*_):
    return State.objects.all()

@state_query.field('states_by_country')
def resolve_states_by_country(_, info, countryId):
    country = Country.objects.get(pk=countryId)
    country_states = State.objects.filter(country=country)
    return list(country_states)