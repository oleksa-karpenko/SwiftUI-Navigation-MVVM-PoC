import Foundation

protocol AuthServicing {
  func login(username: String, password: String) -> Bool
  func isSessionValid() -> Bool
  func resetSession()
}

class AuthService: AuthServicing {
  private var lastLoginDate: Date?
  private let sessionTimeout: TimeInterval = 30

  func login(username: String, password: String) -> Bool {
    if username.lowercased() == "admin", password == "1234" {
      lastLoginDate = Date()
      return true
    }
    return false
  }

  func isSessionValid() -> Bool {
    guard let lastLoginDate else { return false }
    return Date().timeIntervalSince(lastLoginDate) < sessionTimeout
  }

  func resetSession() {
    lastLoginDate = nil
  }

  func testExpireSession() {
    lastLoginDate = lastLoginDate?.addingTimeInterval(-31)
  }
}
