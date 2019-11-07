
import Combine
import APIKit

struct APIPublisher<R: APIKit.Request>: Publisher where R.Response: Decodable {
    
    typealias Output = R.Response
    
    typealias Failure = Error
    
    let request: R
    
    func receive<S>(subscriber: S) where S : Subscriber, Failure == S.Failure, Output == S.Input {
        // 通信処理
        let task = Session
            .shared
            .send(request) { result in
                switch result {
                case .success(let res):
                    // 処理成功
                    let _ = subscriber.receive(res)
                    subscriber.receive(completion: .finished)
                case .failure(let error):
                    // 処理失敗
                    subscriber.receive(completion: .failure(error))
                }
        }
        
        // 登録完了を通知
        // 通信をキャンセルできるようにtaskを渡す
        let subscription = APISubscription(combineIdentifier: CombineIdentifier(), task: task)
        subscriber.receive(subscription: subscription)
    }
}
