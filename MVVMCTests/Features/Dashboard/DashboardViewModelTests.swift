import Foundation
@testable import MVVMC
import Testing

@Suite
struct DashboardViewModelTests {
  var viewModel: DashboardViewModel

  init() {
    viewModel = DashboardViewModel()
  }

  @Test("Initial values are correct")
  func initialValues() {
    #expect(viewModel.username == "Oleksandr")
    #expect(viewModel.avatarURL == nil)
    #expect(viewModel.todayTasks == 12)
    #expect(viewModel.completedTasks == 7)
    #expect(viewModel.unreadNotifications == 3)
  }

  @Test("Can update properties")
  func propertyUpdates() {
    let expectedURL = "https://example.com/avatar.png"
    viewModel.username = "Alice"
    viewModel.avatarURL = URL(string: expectedURL)
    viewModel.todayTasks = 5
    viewModel.completedTasks = 5
    viewModel.unreadNotifications = 0

    #expect(viewModel.username == "Alice")
    #expect(viewModel.avatarURL?.absoluteString == expectedURL)
    #expect(viewModel.todayTasks == 5)
    #expect(viewModel.completedTasks == 5)
    #expect(viewModel.unreadNotifications == 0)
  }

  @Test("onTapProfile executes")
  func testOnTapProfile() {
    var wasCalled = false
    viewModel.onTapProfile = { wasCalled = true }
    viewModel.onTapProfile?()
    #expect(wasCalled)
  }

  @Test("onTapTasks executes")
  func testOnTapTasks() {
    var wasCalled = false
    viewModel.onTapTasks = { wasCalled = true }
    viewModel.onTapTasks?()
    #expect(wasCalled)
  }

  @Test("onTapNotifications executes")
  func testOnTapNotifications() {
    var wasCalled = false
    viewModel.onTapNotifications = { wasCalled = true }
    viewModel.onTapNotifications?()
    #expect(wasCalled)
  }
}
