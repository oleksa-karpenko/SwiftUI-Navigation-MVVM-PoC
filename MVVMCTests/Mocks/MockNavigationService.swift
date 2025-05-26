import Combine
@testable import MVVMC
import SwiftUI

class MockNavigationService: NavigationServicing {
  @Published var path = NavigationPath()
  @Published var currentTab: AppRoute = .dashboard
  @Published var showLoginModal: Bool = false

  var didDismissLogin = false
  var didShowLogin = false

  func navigate(to route: AppRoute) {}
  func contains(_ route: AppRoute) -> Bool { false }
  func popLast() {}
  func resetNavigation() {}
  func showLoginScreen() {
    didShowLogin = true
  }

  func dismissLoginScreen() {
    didDismissLogin = true
  }
}
