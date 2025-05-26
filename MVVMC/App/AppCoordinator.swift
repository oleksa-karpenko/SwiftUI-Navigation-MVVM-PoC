import SwiftUI

struct AppCoordinator: View {
  @ObservedObject private var navigationService: NavigationService
  private var sessionManager: SessionManaging
  private let authService: AuthServicing

  init(
    navigationService: NavigationService,
    sessionManager: SessionManaging,
    authService: AuthServicing
  ) {
    self.navigationService = navigationService
    self.authService = authService
    self.sessionManager = sessionManager
  }

  var body: some View {
    NavigationStack(path: $navigationService.path) {
      tabBar
        .navigationDestination(for: AppRoute.self, destination: view(for:))
    }
    .fullScreenCover(isPresented: $navigationService.showLoginModal) {
      LoginView(
        viewModel: LoginViewModel(
          navigationService: navigationService,
          sessionManager: sessionManager, authService: authService,
        ),
      )
    }
    .environmentObject(navigationService)
  }

  private var tabBar: some View {
    TabView(selection: $navigationService.currentTab) {
      DashboardView()
        .tabItem { Label("Dashboard", systemImage: "house") }
        .tag(AppRoute.dashboard)

      TasksView(viewModel: TasksViewModel())
        .tabItem { Label("Tasks", systemImage: "checkmark.circle") }
        .tag(AppRoute.tasks)

      ProfileView()
        .tabItem { Label("Profile", systemImage: "person.circle") }
        .tag(AppRoute.profile)
    }
  }

  @ViewBuilder
  private func view(for route: AppRoute) -> some View {
    switch route {
    case .dashboard:
      DashboardView()
    case .tasks:
      TasksView(viewModel: TasksViewModel())
    case .profile:
      ProfileView()
    case .notifications:
      NotificationsView()
    }
  }
}
