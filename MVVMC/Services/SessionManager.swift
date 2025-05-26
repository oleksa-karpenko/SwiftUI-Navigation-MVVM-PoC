import Foundation

@MainActor
protocol SessionManaging: AnyObject {
  func startTimer()
  func resetSession()
  func expireSession()
}

@MainActor
final class SessionManager: SessionManaging {
  private var timer: Timer?
  private let navigationService: NavigationServicing
  private let authService: AuthServicing

  init(
    navigationService: NavigationServicing,
    authService: AuthServicing
  ) {
    self.navigationService = navigationService
    self.authService = authService
    expireSession()
    startTimer()
  }

  func startTimer() {
    timer = Timer.scheduledTimer(withTimeInterval: 30, repeats: true) { [weak self] _ in
      Task {
        await self?.expireSession()
      }
    }
  }

  func expireSession() {
    authService.resetSession()
    navigationService.showLoginScreen()
  }

  func resetSession() {
    authService.resetSession()
  }
}
