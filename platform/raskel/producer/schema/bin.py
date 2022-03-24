from ariadne import gql

type_defs = gql("""

type BinQuery{
    bins_by_producer: [Bin]
    bin(binId:ID!) : Bin
    all_bin_types: [BinType]
    all_bin_brands: [BinBrand]


}
type Bin{
    id:ID!
    size: String
    volume: Float
    color: String
    type: BinType
    brand: BinBrand
    producer: Producer!


}
type BinType{
    id:ID
    code: String
    name: String

}

type BinBrand{
    id:ID
    code: String
    name: String
    company:String
    address: Address
    phone_one: String
    phone_two: String
    email: String 
    website: String


}

input BinInput{
    id: ID!
    producerId: ID!
    typeId: ID
    brandId: ID!
    size: String
    volume: Float
    color: String

}
type BinResults{
    modified: Boolean!
    bin: Bin
    err: String

}
input BinTypeInput {
    code: String
    name: String
}
type BinTypeResult{
    created: Boolean!
    binType: BinType
    err: String
}
input BinBrandInput{
    code: String
    name: String
    company: String
    phone_one:String
    phone_two:String
    email:String
    website:String

}
type BinBrandResult{
    created: Boolean!
    binBrand: BinBrand
    err: String

}


"""

)