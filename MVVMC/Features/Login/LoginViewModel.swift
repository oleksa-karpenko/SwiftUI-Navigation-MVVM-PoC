import Combine

class LoginViewModel: ObservableObject {
  @Published var username = ""
  @Published var password = ""
  @Published var errorMessage: String?

  private let navigationService: NavigationServicing
  private let sessionManager: SessionManaging
  private let authService: AuthServicing

  init(
    navigationService: NavigationServicing,
    sessionManager: SessionManaging,
    authService: AuthServicing
  ) {
    self.navigationService = navigationService
    self.sessionManager = sessionManager
    self.authService = authService

    username = "Admin"
    password = "1234"
  }

  @MainActor func login() {
    guard !username.isEmpty, !password.isEmpty else {
      errorMessage = "Please enter all fields"
      return
    }

    if authService.login(username: username, password: password) {
      sessionManager.resetSession()
      navigationService.dismissLoginScreen()
    } else {
      errorMessage = "Invalid credentials"
    }
  }
}
