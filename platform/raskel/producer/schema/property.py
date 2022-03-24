from ariadne import gql
#"""properties_by_producer: [Property] """;
type_defs = gql("""
 
type PropertyQuery{
   
    property(propertyId: ID!): Property
    all_property_types: [PropertyType]
}

type Property {
    id: String
    area: Float
    individuals: Int
    has_garden: Boolean
    has_garage: Boolean
    has_barn: Boolean
    type: PropertyType!
    producer: Producer!
    address: Address
}

type PropertyType {
    id: ID
    code: String
    name: String
}

input PropertyInput { 
    id: String!
    area: Float
    individuals: Int
    has_garden: Boolean
    has_garage: Boolean
    has_barn: Boolean
    typeId: ID!
    producerId: ID!
    address: ID
}
input PropertyCreateInput { 
    
    area: Float
    individuals: Int
    has_garden: Boolean
    has_garage: Boolean
    has_barn: Boolean
    typeId: ID!
    producerId: ID!
    address: ID
}

input PropertyTypeInput {
    code: String
    name: String
}

type PropertyResults {
    modified: Boolean!
    property: Property
    err: String
}
type PropertyCreateResults{
    created: Boolean!
    property: Property
    err: String
    
}

type PropertyTypeResults {
    created: Boolean!
    propertyType: PropertyType
    err: String
}

""")
