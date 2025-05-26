import SwiftUI

@main
struct MVVMCApp: App {
  private let navService: NavigationService
  private let sessManager: SessionManager
  private let authService: AuthService
  init() {
    navService = NavigationService()
    authService = AuthService()
    sessManager = SessionManager(navigationService: navService, authService: authService)
  }

  var body: some Scene {
    WindowGroup {
      AppCoordinator(
        navigationService: navService,
        sessionManager: sessManager,
        authService: authService,
      )
    }
  }
}
