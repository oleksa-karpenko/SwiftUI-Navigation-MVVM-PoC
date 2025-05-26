@testable import MVVMC
import Testing

@MainActor
@Suite
struct SessionManagerTests {
  var auth: MockAuthService
  var nav: MockNavigationService
  var session: SessionManager

  init() {
    auth = MockAuthService()
    nav = MockNavigationService()
    session = SessionManager(navigationService: nav, authService: auth)
  }

  @Test("resetSession calls authService.resetSession")
  func testResetSession() {
    session.resetSession()
    #expect(auth.resetSessionCalled)
  }

  @Test("expireSession shows login screen when session is invalid")
  func expireSessionInvalid() {
    auth.isSessionValidResult = false
    session.expireSession()
    #expect(nav.didShowLogin)
  }
}
