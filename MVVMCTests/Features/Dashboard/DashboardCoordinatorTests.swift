@testable import MVVMC
import Testing

@Suite
struct DashboardCoordinatorTests {
  var coordinator: DashboardCoordinator

  init() {
    coordinator = DashboardCoordinator()
  }

  @Test("Navigates to Profile on profile tap")
  func profileNavigation() {
    coordinator.viewModel.onTapProfile?()
    #expect(coordinator.stack.last == .profile)
  }

  @Test("Navigates to Tasks on tasks tap")
  func tasksNavigation() {
    coordinator.viewModel.onTapTasks?()
    #expect(coordinator.stack.last == .tasks)
  }

  @Test("Navigates to Notifications on notifications tap")
  func notificationsNavigation() {
    coordinator.viewModel.onTapNotifications?()
    #expect(coordinator.stack.last == .notifications)
  }

  @Test("Multiple screens pushed")
  func multipleNavigation() {
    coordinator.viewModel.onTapTasks?()
    coordinator.viewModel.onTapNotifications?()
    coordinator.viewModel.onTapProfile?()

    #expect(coordinator.stack == [.tasks, .notifications, .profile])
  }
}
