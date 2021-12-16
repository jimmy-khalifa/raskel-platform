from ariadne import gql

type_defs = gql("""

type PropertyQuery{
    properties_by_producer: [Property]
    property(propertyId: ID!): Property
    all_property_types: [PropertyType]
}

type Property {
    id: ID
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
