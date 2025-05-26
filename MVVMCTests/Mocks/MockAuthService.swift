@testable import MVVMC

class MockAuthService: AuthServicing {
  var isSessionValidCalled = false
  var isSessionValidResult = false
  func isSessionValid() -> Bool {
    isSessionValidCalled = true
    return isSessionValidResult
  }

  var resetSessionCalled = false
  func resetSession() {
    resetSessionCalled = true
  }

  var loginCalled = false
  var loginResult = false
  func login(username: String, password: String) -> Bool {
    loginCalled = true
    return loginResult
  }
}
