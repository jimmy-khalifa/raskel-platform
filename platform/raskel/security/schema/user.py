from ariadne import gql

type_defs= gql("""

type Error{
    code: String!
    message: String!
}

type User {
    username: String!
    phone_number: String!
    first_name: String!
    last_name: String!
    email: String!
    is_active: Boolean!
    is_confirmed: Boolean!
    is_verified: Boolean!

}

input UserInput {
    phone_number: String!
    first_name: String!
    last_name: String!
    municipality_id: String!
}

type UserResults {
        created: Boolean!
        user: User
        err: Error
}

input CodeInput {
    phone_number: String!
    code: String!
}

type CodeResult {
    success: Boolean!
    err: String!
}

""")