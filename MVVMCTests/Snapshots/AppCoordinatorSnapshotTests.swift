@testable import MVVMC
import SnapshotTesting
import SwiftUI
import Testing

@MainActor
@Suite
struct AppCoordinatorSnapshotTests {
  @Test("AppCoordinator renders default tab (Dashboard)")
  func coordinatorDefault() throws {
    let view = AppCoordinator(
      navigationService: NavigationService(),
      sessionManager: MockSessionManager(),
      authService: MockAuthService(),
    )

    let host = UIHostingController(rootView: view)
    assertSnapshot(of: host, as: .image(on: .iPhone13), named: "Coordinator_Default")
  }

  @Test("AppCoordinator renders login screen when showLoginModal = true")
  func coordinatorLoginVisible() throws {
    let nav = NavigationService()
    nav.showLoginModal = true

    let view = AppCoordinator(
      navigationService: nav,
      sessionManager: MockSessionManager(),
      authService: MockAuthService(),
    )

    let host = UIHostingController(rootView: view)
    assertSnapshot(of: host, as: .image(on: .iPhone13), named: "Coordinator_Login")
  }

  @Test("Navigates to Notifications screen via path")
  func route_Notifications() throws {
    runSnapshot(for: AppRoute.notifications, named: "Route_Notifications")
    runSnapshot(for: AppRoute.profile, named: "Route_Profile")
    runSnapshot(for: AppRoute.tasks, named: "Route_Tasks")
  }

  private func runSnapshot(for route: AppRoute, named name: String) {
    let nav = NavigationService()
    nav.path.append(route)

    let view = AppCoordinator(
      navigationService: nav,
      sessionManager: MockSessionManager(),
      authService: MockAuthService(),
    )

    let host = UIHostingController(rootView: view)
    SnapshotTesting.assertSnapshot(of: host, as: .image(on: .iPhone13), named: name)
  }
}
