@testable import MVVMC
import SnapshotTesting
import SwiftUI
import Testing

@MainActor
@Suite
struct LoginViewSnapshotTests {
  @Test("Login view renders default state")
  func loginViewDefault() throws {
    let viewModel = LoginViewModel(
      navigationService: MockNavigationService(),
      sessionManager: MockSessionManager(),
      authService: MockAuthService(),
    )
    let view = LoginView(viewModel: viewModel)
    let host = UIHostingController(rootView: view)

    assertSnapshot(
      of: host,
      as: .image(on: .iPhone13),
      named: "LoginView_Default",
    )
  }

  @Test("Login view renders with error")
  func loginViewWithError() throws {
    let viewModel = LoginViewModel(
      navigationService: MockNavigationService(),
      sessionManager: MockSessionManager(),
      authService: MockAuthService(),
    )
    viewModel.username = "user"
    viewModel.password = "wrong"
    viewModel.errorMessage = "Invalid username or password"

    let view = LoginView(viewModel: viewModel)
    let host = UIHostingController(rootView: view)

    assertSnapshot(
      of: host,
      as: .image(on: .iPhone13),
      named: "LoginView_Error",
    )
  }
}
