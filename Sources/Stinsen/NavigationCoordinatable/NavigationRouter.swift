import Foundation
import Resolver

open class NavigationRouter<T: NavigationRoute>: ObservableObject {
    private let routable: NavigationRoutable
    var root: AnyCoordinatable?
    var _popToRoot: () -> Void
    public let id: Int?
    
    open func route(to route: T) {
        routable.anyRoute(to: route)
    }
    
    open func pop() {
        routable.pop()
    }
    
    open func popToRoot() {
        _popToRoot()
    }
    
    open func dismiss(onFinished: @escaping (() -> Void) = {}) {
        routable.dismiss(withRootCoordinator: root!, onFinished: onFinished)
    }
    
    public init<U: NavigationCoordinatable>(id: Int?, coordinator: U) {
        self.id = id
        self.routable = NavigationRoutable(coordinator: coordinator)
        
        _popToRoot = {
            coordinator.navigationStack.popTo(-1)
        }
        
        Resolver.main.register{ self }
    }
}
