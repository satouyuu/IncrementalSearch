
import Foundation
import APIKit

final class EntityDataParser<T: Decodable>: APIKit.DataParser {
    var contentType: String? {
        return "application/json"
    }
 
    func parse(data: Data) throws -> Any {
        return try JSONDecoder().decode(T.self, from: data)
    }
}
