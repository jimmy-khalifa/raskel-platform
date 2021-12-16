from ariadne import gql

type_defs = gql("""

type ProducerQuery{
    all_producers: [Producer]
}

type Producer {
    id: ID
    first_name: String!
    last_name: String!
    date_of_birth: String!
    age: Int!
    phone_number: String!
    email: String!
    cin: String!
    cin_delivery: String!
    is_principal: Boolean!
    properties: [Property]

}

input ProducerInput {
    id: ID!
    date_of_birth: String
    age: Int
    cin: String
    cin_delivery: String
}

type ProducerResults {
    modified: Boolean!
    producer: Producer
    err: String
}

""")
