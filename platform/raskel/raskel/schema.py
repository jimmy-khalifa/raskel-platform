from ariadne import MutationType, make_executable_schema, upload_scalar
from ariadne_jwt import resolve_verify, resolve_refresh, resolve_token_auth, jwt_schema, GenericScalar

from security.schema import user_type_defs
from security.resolvers import user_query, user_mutation
from geo.schema import country_type_defs, municipality_type_defs, district_type_defs, state_type_defs, address_type_defs
from geo.resolvers import country_query, state_query, district_query, municipality_query, address_query, address_mutation
from producer.schema import prod_type_defs, property_type_defs
from producer.resolvers import prod_query, prod_mutation, property_query, property_mutation, upload_mutation, upload_mutation_cin_front,upload_mutation_cin_back
from company.schema import company_type_defs
from company.resolvers import company_mutation, company_query
from ariadne import gql

type_defs= gql("""
type Query{
    all_states: [State]
    states_by_country(countryId: ID!): [State]
    all_municipalities: [Municipality]
    municipality_by_state(stateId: ID!): [Municipality]
    all_countries: [Country]
    all_districts: [District]
    all_addresses: [Address]
    all_producers: [Producer]
    all_companies: [Company]
    address(addressId: ID!): Address
    producer(producerId: ID!): Producer
    producer_by_user: Producer!
    properties_by_producer(producerId: ID!): [Property]
    property(propertyId: ID!): Property
    all_property_types: [PropertyType]
    company_by_id(companyId: ID!): Company
    companies_by_municipality(municipalityId: ID!): [Company]
    me: User
}

type Mutation{
    uploadUserImage(image: Upload!): Boolean!
    uploadCinFront(cin_pic_front: Upload!): Boolean!
    uploadCinBack(cin_pic_back: Upload!): Boolean!
    create_user(input: UserInput): UserResults
    verify_phone_number(input: CodeInput): CodeResult
    resend_verification_code(input: String): String
    verifyToken(token: String!): VerifyToken
    refreshToken(token: String!): RefreshToken
    tokenAuth(phone_number: String!, password:String!): TokenAuth
    modify_address(input: AddressInput!): AddressResults
    modify_producer(input: ProducerInput!): ProducerResults
    create_property(input: PropertyInput!): PropertyResults
    create_property_type(input: PropertyTypeInput): PropertyTypeResults
    create_company(input: CompanyInput): CompanyResults
    modify_company(input: CompanyUpdateInput): CompanyUpdateResult
    user_phone(input:PhoneInput): UserResults
}
""")

jwt_mutation = MutationType()

jwt_mutation.set_field('verifyToken', resolve_verify)
jwt_mutation.set_field('refreshToken', resolve_refresh)
jwt_mutation.set_field('tokenAuth', resolve_token_auth)

schema = make_executable_schema([user_type_defs, jwt_schema, country_type_defs, state_type_defs, 
municipality_type_defs, district_type_defs, address_type_defs, prod_type_defs, property_type_defs, company_type_defs, type_defs], 
[user_query, user_mutation, jwt_mutation, country_query, state_query, municipality_query, company_query, company_mutation,
district_query, address_query, address_mutation, prod_query, prod_mutation, property_query, property_mutation,upload_mutation,upload_mutation_cin_front,upload_mutation_cin_back], 
[GenericScalar,upload_scalar])