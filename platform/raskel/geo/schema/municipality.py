from ariadne import gql

type_defs= gql("""

type Municipality {
    id: ID
    code: String!
    name: String!
    name_ar: String!
    shape: String!
    state: State!

}

""")