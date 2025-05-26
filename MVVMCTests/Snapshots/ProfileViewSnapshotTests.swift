@testable import MVVMC
import SnapshotTesting
import SwiftUI
import Testing

@MainActor @Suite
struct ProfileViewSnapshotTests {
  @Test("Renders ProfileView correctly on iPhone 16")
  func snapshotDefaultState() throws {
    let view = ProfileView()
    let host = UIHostingController(rootView: NavigationView { view })

    assertSnapshot(
      of: host,
      as: .image(on: .iPhone13),
      named: "ProfileView_Default",
    )
  }
}
