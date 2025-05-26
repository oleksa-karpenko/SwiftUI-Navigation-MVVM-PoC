import Foundation
@testable import MVVMC
import Testing

@Suite
struct AuthServiceTests {
  var authService: AuthService

  init() {
    authService = AuthService()
  }

  @Test("Login succeeds with correct credentials")
  func successfulLogin() {
    let result = authService.login(username: "Admin", password: "1234")
    #expect(result == true)
  }

  @Test("Login fails with incorrect credentials")
  func failedLogin() {
    let result = authService.login(username: "admin", password: "wrong")
    #expect(result == false)
  }

  @Test("Session is valid after login")
  func sessionValidAfterLogin() {
    _ = authService.login(username: "Admin", password: "1234")
    let valid = authService.isSessionValid()
    #expect(valid == true)
  }

  @Test("Session becomes invalid after timeout")
  func sessionExpires() {
    _ = authService.login(username: "Admin", password: "1234")

    // simulate timeout manually
    authService.testExpireSession()

    let valid = authService.isSessionValid()
    #expect(valid == false) // This will fail unless time simulation is supported
  }

  @Test("Reset session invalidates it")
  func testResetSession() {
    _ = authService.login(username: "Admin", password: "1234")
    authService.resetSession()
    let valid = authService.isSessionValid()
    #expect(valid == false)
  }
}
