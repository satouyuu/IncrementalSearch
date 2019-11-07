
import Foundation
import Combine

final class WikiSearchModel: ObservableObject {
    
    @Published var itmes: [Search] = []
    
    var searchText = "" {
        didSet {
            self.searchWiki()
        }
    }
    
    var requestCancellable: Cancellable?
    
    func searchWiki() {
        
        self.requestCancellable = WikiRequest(query: self.searchText)
            .publisher
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .finished:
                    // 成功時に行いたい処理
                    break
                case .failure:
                    // 失敗時に行いたい処理
                    break
                }
                
            }) { (entity) in
                // 成功時のレスポンスはここにくる
                self.itmes = entity.query?.search ?? []
        }
    }
    
    func cancel() {
        self.requestCancellable?.cancel()
        self.requestCancellable = nil
    }
}
