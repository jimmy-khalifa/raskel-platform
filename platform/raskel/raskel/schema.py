from ariadne import make_executable_schema
from producers.schema import producer as sproducer
from producers.resolvers import producer as rproducer

schema = make_executable_schema(sproducer.type_defs, rproducer.query, rproducer.mutation)