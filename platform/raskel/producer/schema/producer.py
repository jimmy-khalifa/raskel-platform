from ariadne import gql



type_defs = gql("""

scalar Upload


type ProducerQuery{
    all_producers: [Producer]
}

type Producer {
    id: String
    first_name: String!
    last_name: String!
    date_of_birth: String
    age: String
    phone_number: String!
    email: String!
    cin: String
    cin_delivery: String
    is_principal: Boolean!
    properties: [Property] 
    image: Upload
    cin_pic_front: Upload
    cin_pic_back: Upload
    user: User!
}


input ProducerInput {
    id: String!
    date_of_birth: String
    age: String
    cin: String
    cin_delivery: String
}

type ProducerResults {
    modified: Boolean!
    producer: Producer
    err: String
}

""")
