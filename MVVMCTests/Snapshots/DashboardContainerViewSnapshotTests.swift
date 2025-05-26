@testable import MVVMC
import SnapshotTesting
import SwiftUI
import Testing

@MainActor
@Suite
struct DashboardContainerViewSnapshotTests {
  @Test("DashboardContainerView renders default dashboard")
  func snapshotDashboardDefault() throws {
    let coordinator = DashboardCoordinator()
    let view = DashboardContainerView(coordinator: coordinator)
    let host = UIHostingController(rootView: view)

    assertSnapshot(
      of: host,
      as: .image(on: .iPhone13),
      named: "DashboardContainer_Default",
    )
  }

  @Test("DashboardContainerView navigates to Profile")
  func snapshotDashboardProfile() throws {
    let coordinator = DashboardCoordinator()
    coordinator.viewModel.onTapProfile?()

    let view = DashboardContainerView(coordinator: coordinator)
    let host = UIHostingController(rootView: view)

    try assertSnapshot(
      of: host,
      as: .image(on: .iPhone13),
      named: "DashboardContainer_Profile",
    )
  }
}
