@testable import MVVMC
import SnapshotTesting
import SwiftUI
import Testing

@MainActor @Suite
struct TasksViewSnapshotTests {
  @Test("Renders TasksView correctly on iPhone 16")
  func snapshotDefaultState() throws {
    let view = TasksView(viewModel: TasksViewModel())
    let host = UIHostingController(rootView: NavigationView { view })

    assertSnapshot(
      of: host,
      as: .image(on: .iPhone13),
      named: "TasksView_Default",
    )
  }
}
