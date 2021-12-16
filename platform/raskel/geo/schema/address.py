from ariadne import gql

type_defs= gql("""

type Point {
    x: Float!
    y: Float!
}
type Address {
    id: ID!
    label: String!
    zipcode: String!
    municipality: Municipality!
    district: District
    is_spatial: Boolean!
    latlong: Point

}

input AddressInput {
    id: ID!
    label: String
    zipcode: String
    district_id: ID
    is_spatial: Boolean!
    longitude: Float!
    latitude: Float!
}

type AddressResults {
        modified: Boolean!
        address: Address
        err: String
}

""")