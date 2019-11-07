
struct WikiEntity: Decodable {
    let query: Query?
}
 
struct Query: Decodable {
    let search: [Search]
}
 
struct Search: Decodable {
    let title: String
    let pageid: Int
}
