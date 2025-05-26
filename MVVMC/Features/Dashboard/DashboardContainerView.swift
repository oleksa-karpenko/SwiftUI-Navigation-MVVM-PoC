import SwiftUI

struct DashboardContainerView: View {
  @ObservedObject var coordinator: DashboardCoordinator

  var body: some View {
    NavigationStack(path: $coordinator.path) {
      DashboardView(viewModel: coordinator.viewModel)
        .navigationDestination(for: DashboardScreen.self) { screen in
          switch screen {
          case .profile:
            ProfileView()
          case .tasks:
            TasksView(viewModel: TasksViewModel())
          case .notifications:
            NotificationsView()
          }
        }
    }
  }
}
