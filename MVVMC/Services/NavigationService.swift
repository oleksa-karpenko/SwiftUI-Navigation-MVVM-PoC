import SwiftUI

protocol NavigationServicing {
  var path: NavigationPath { get set }
  var currentTab: AppRoute { get set }
  var showLoginModal: Bool { get set }

  func navigate(to route: AppRoute)
  func contains(_ route: AppRoute) -> Bool
  func popLast()
  func resetNavigation()
  func showLoginScreen()
  func dismissLoginScreen()
}

class NavigationService: NavigationServicing, ObservableObject {
  @Published var path = NavigationPath()
  @Published var currentTab: AppRoute = .dashboard
  @Published var showLoginModal: Bool = false

  private var routeStack: [AppRoute] = []

  func navigate(to route: AppRoute) {
    path.append(route)
    routeStack.append(route)
  }

  func contains(_ route: AppRoute) -> Bool {
    routeStack.contains(route)
  }

  func popLast() {
    if !routeStack.isEmpty {
      routeStack.removeLast()
      path.removeLast()
    }
  }

  func resetNavigation() {
    routeStack.removeAll()
    path = NavigationPath()
  }

  func showLoginScreen() {
    guard !showLoginModal else { return }
    DispatchQueue.main.async {
      self.showLoginModal = true
    }
  }

  func dismissLoginScreen() {
    DispatchQueue.main.async {
      self.showLoginModal = false
    }
  }
}

enum NavigationServiceHolder {
  static var service: NavigationService?
}
