import Foundation

public class NavigationRouter<T: NavigationRoute>: Routable {
    private let routable: NavigationRoutable
    var root: AnyCoordinatable?
    var _popToRoot: () -> Void
    var _popTo: (_ index: Int) -> Void
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
    
    open func popTo(index: Int) {
        _popTo(index)
    }
    
    open func dismiss(onFinished: @escaping (() -> Void) = {}) {
        guard let root = root else { return onFinished() }
        routable.dismiss(withRootCoordinator: root, onFinished: onFinished)
    }
    
    public init<U: NavigationCoordinatable>(id: Int?, coordinator: U) {
        self.id = id
        self.routable = NavigationRoutable(coordinator: coordinator)
        
        _popToRoot = {
            coordinator.navigationStack.popToRoot()
        }
        
        _popTo = { index in
            coordinator.navigationStack.popTo(index)
        }
    }
}
