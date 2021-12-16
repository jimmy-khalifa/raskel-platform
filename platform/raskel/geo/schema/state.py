from ariadne import gql

type_defs= gql("""

type State {
    id: ID
    code: String!
    name: String!
    name_ar: String!
    shape: String!
    country: Country!

}

""")