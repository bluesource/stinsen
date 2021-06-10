import Foundation
import Resolver

open class ViewRouter<T: ViewRoute>: ObservableObject {
    private let routable: ViewRoutable
    
    open func route(to route: T) {
        routable.anyRoute(to: route)
    }
    
    public init<U: ViewCoordinatable>(_ coordinator: U) {
        self.routable = ViewRoutable(coordinator: coordinator)
        Resolver.main.register{ self }
    }
}
