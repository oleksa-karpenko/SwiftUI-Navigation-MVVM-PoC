import SwiftUI

enum DashboardScreen: Hashable {
  case profile
  case tasks
  case notifications
}

class DashboardCoordinator: ObservableObject {
  @Published var path = NavigationPath()
  private(set) var stack: [DashboardScreen] = []

  var viewModel = DashboardViewModel()

  init() {
    viewModel.onTapProfile = { [weak self] in self?.push(DashboardScreen.profile) }
    viewModel.onTapTasks = { [weak self] in self?.push(DashboardScreen.tasks) }
    viewModel.onTapNotifications = { [weak self] in self?.push(DashboardScreen.notifications) }
  }

  private func push(_ screen: DashboardScreen) {
    path.append(screen)
    stack.append(screen)
  }
}
