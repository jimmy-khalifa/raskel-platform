from ariadne import gql

type_defs= gql("""

type Country {
    id: ID
    code: String!
    name: String!
    shape: String!

}

""")