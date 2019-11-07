
import Combine
import APIKit

struct APISubscription: Subscription {
    
    let combineIdentifier: CombineIdentifier
    
    let task: APIKit.SessionTask?
    
    func request(_ demand: Subscribers.Demand) {}
    
    func cancel() {
        self.task?.cancel()
    }
}
