from ariadne import gql

type_defs= gql("""

type Company {
    id: ID!
    legal_name: String!
    registration: String!
    code_tva: String!
    creation_date: String!
    phone_number_one: String!
    phone_number_two: String!
    fax: String!
    email: String!
    website: String!
    contact: String!
    is_municipality: Boolean!
    municipality: Municipality!

}

input CompanyInput {
    legal_name: String!
    registration: String!
    code_tva: String!
    creation_date: String
    phone_number_one: String
    phone_number_two: String
    fax: String
    email: String
    website: String
    contact: String
    municipalityId: ID
}

input CompanyUpdateInput {
    id: ID!
    creation_date: String
    phone_number_one: String
    phone_number_two: String
    fax: String
    email: String
    website: String
    contact: String
}

type CompanyResults {
    created: Boolean!
    company: Company
    err: String
}

type CompanyUpdateResult{
    modified: Boolean!
    company: Company!
    err: String
}

""")