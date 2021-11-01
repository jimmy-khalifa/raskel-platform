type_defs= """

type Query{
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


}
type Mutation{
    add_producer(input: ProducerInput): ProducerResults

}
input ProducerInput {
    first_name: String
    last_name: String
    date_of_birth: String
    age: Int
    phone_number: String
    email: String
    cin: String
    cin_delivery: String
    is_principal: Boolean
}
  type ProducerResults {
        created: Boolean!
        producer: Producer
        err: String
}

"""