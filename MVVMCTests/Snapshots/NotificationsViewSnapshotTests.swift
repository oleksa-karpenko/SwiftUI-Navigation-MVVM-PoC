@testable import MVVMC
import SnapshotTesting
import SwiftUI
import Testing

@MainActor @Suite
struct NotificationsViewSnapshotTests {
  @Test("Renders NotificationsView correctly on iPhone 16")
  func snapshotDefaultState() throws {
    let view = NotificationsView()
    let host = UIHostingController(rootView: NavigationView { view })
    assertSnapshot(
      of: host,
      as: .image(on: .iPhone13),
      named: "NotificationsView_Default",
    )
  }
}
