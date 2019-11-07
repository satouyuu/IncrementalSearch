
import Foundation
import APIKit

struct WikiRequest: APIKit.Request {
    
    typealias Response = WikiEntity
    
    let query: String
    
    var baseURL: URL {
        let urlStr = "https://ja.wikipedia.org/w/api.php?format=json&action=query&list=search&srlimit=30&srsearch=\(self.query)"
        return URL(string: urlStr.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!
    }
    
    let method: HTTPMethod = .post
    
    let path: String = ""
}
