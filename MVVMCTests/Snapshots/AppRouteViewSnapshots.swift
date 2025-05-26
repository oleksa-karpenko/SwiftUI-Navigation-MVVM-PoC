@testable import MVVMC
import SnapshotTesting
import SwiftUI
import Testing

@MainActor
@Suite
struct AppRouteViewSnapshots {
  @Test("Dashboard route view")
  func dashboardView() throws {
    let view = DashboardView()
    let host = UIHostingController(rootView: view)
    assertSnapshot(of: host, as: .image(on: .iPhone13), named: "DashboardView")
  }

  @Test("Notifications route view")
  func notificationsView() throws {
    let view = NotificationsView()
    let host = UIHostingController(rootView: view)
    assertSnapshot(of: host, as: .image(on: .iPhone13), named: "NotificationsView")
  }
}
