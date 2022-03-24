from ariadne import gql

type_defs= gql("""

type AdressQuery{
    address_by_producer(producerId:ID!): [Address]
    address(addressId:String!):Address
}

type Point { 
    x: Float!
    y: Float! 
}
type Address {
    id: String!
    label: String!
    zipcode: String!
    municipality: Municipality!
    district: District
    is_spatial: Boolean!
    latlong: Point

}

input AddressInput {
    id: String!
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