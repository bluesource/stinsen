import Foundation
import Resolver

public class NavigationRouter<T: NavigationRoute>: ObservableObject {
    private let routable: NavigationRoutable
    var root: AnyCoordinatable?
    var _popToRoot: () -> Void
    public let id: Int?
    
    public func route(to route: T) {
        routable.anyRoute(to: route)
    }
    
    public func pop() {
        routable.pop()
    }
    
    public func popToRoot() {
        _popToRoot()
    }
    
    public func dismiss(onFinished: @escaping (() -> Void) = {}) {
        routable.dismiss(withRootCoordinator: root!, onFinished: onFinished)
    }
    
    init<U: NavigationCoordinatable>(id: Int?, coordinator: U) {
        self.id = id
        self.routable = NavigationRoutable(coordinator: coordinator)
        
        _popToRoot = {
            coordinator.navigationStack.popTo(-1)
        }
        
        Resolver.main.register{ self }
    }
}
