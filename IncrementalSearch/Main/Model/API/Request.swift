
import Foundation
import Combine
import APIKit

extension APIKit.Request where Self.Response: Decodable {
    
    var publisher: APIPublisher<Self> {
        return APIPublisher(request: self)
    }
    
    var dataParser: APIKit.DataParser {
        return EntityDataParser<Response>()
    }
    
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        guard let entity = object as? Response else {
            throw ResponseError.unexpectedObject(object)
        }
        return entity
    }
}

