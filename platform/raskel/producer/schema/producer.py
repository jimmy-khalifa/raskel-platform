from ariadne import gql,make_executable_schema, upload_scalar



type_defs = gql("""

scalar Upload


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
    image: Upload
    cin_pic_front: Upload
    cin_pic_back: Upload

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
