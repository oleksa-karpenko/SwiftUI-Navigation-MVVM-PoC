@testable import MVVMC

// import XCTest
import Testing

@Suite
struct LoginViewModelTests {
  var navigationService: MockNavigationService!
  var sessionManager: MockSessionManager!
  var authService: MockAuthService!
  var viewModel: LoginViewModel!

  @MainActor init() {
    navigationService = MockNavigationService()
    sessionManager = MockSessionManager()
    authService = MockAuthService()
    viewModel = LoginViewModel(
      navigationService: navigationService,
      sessionManager: sessionManager,
      authService: authService,
    )
  }

  @Test("Login fails when fields are empty")
  func loginFailsWhenFieldsAreEmpty() async {
    viewModel.username = ""
    viewModel.password = ""
    await viewModel.login()
    #expect(viewModel.errorMessage == "Please enter all fields")
  }

  @MainActor
  @Test("Login fails with invalid credentials")
  func loginFailsWithInvalidCredentials() async {
    viewModel.username = "user"
    viewModel.password = "wrong"
    authService.loginResult = false
    viewModel.login()
    #expect(viewModel.errorMessage == "Invalid credentials")
  }

  @MainActor
  @Test("Login succeeds and performs actions")
  func loginSucceedsAndPerformsActions() async {
    viewModel.username = "Admin"
    viewModel.password = "1234"
    authService.loginResult = true
    viewModel.login()
    #expect(viewModel.errorMessage == nil)
    #expect(sessionManager.resetSessionCalled)
    #expect(navigationService.didDismissLogin)
  }
}

// final class LoginViewModelTests: XCTestCase {
//  var navigationService: MockNavigationService!
//  var sessionManager: MockSessionManager!
//  var authService: MockAuthService!
//  var viewModel: LoginViewModel!
//
//  @MainActor override func setUp() {
//    super.setUp()
//    navigationService = MockNavigationService()
//    sessionManager = MockSessionManager()
//    authService = MockAuthService()
//    viewModel = LoginViewModel(
//      navigationService: navigationService,
//      sessionManager: sessionManager,
//      authService: authService
//    )
//  }
//
//  func testLoginFailsWhenFieldsAreEmpty() async {
//    viewModel.username = ""
//    viewModel.password = ""
//    await viewModel.login()
//    XCTAssertEqual(viewModel.errorMessage, "Please enter all fields")
//  }
//
//  func testLoginFailsWithInvalidCredentials() async {
//    viewModel.username = "user"
//    viewModel.password = "wrong"
//    authService.loginResult = false
//    await viewModel.login()
//    XCTAssertEqual(viewModel.errorMessage, "Invalid credentials")
//  }
//
//  @MainActor func testLoginSucceedsAndPerformsActions() async {
//    viewModel.username = "Admin"
//    viewModel.password = "1234"
//    authService.loginResult = true
//    viewModel.login()
//    XCTAssertNil(viewModel.errorMessage)
//    XCTAssertTrue(sessionManager.resetSessionCalled)
//    XCTAssertTrue(navigationService.didDismissLogin)
//  }
// }
