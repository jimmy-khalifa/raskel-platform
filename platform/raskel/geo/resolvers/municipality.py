from ariadne import QueryType

from ..models import Municipality, State

municipality_query = QueryType()

@municipality_query.field('all_municipalities')
def resolve_municipalities(*_):
    return Municipality.objects.all()

@municipality_query.field('municipality_by_state')
def resolve_municipality_by_state(_, info, stateId):
    if stateId == '' :
        return Municipality.objects.all()
    state = State.objects.get(pk=stateId)
    state_municipalities = Municipality.objects.filter(state=state)
    return list(state_municipalities)

