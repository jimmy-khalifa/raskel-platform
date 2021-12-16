from ariadne import gql

type_defs= gql("""

type District {
    id: ID
    code: String!
    name: String!

}
input DistrictInput {
    code: String
    name: String
}
type DistrictResults {
        created: Boolean!
        district: District
        err: String
}


""")