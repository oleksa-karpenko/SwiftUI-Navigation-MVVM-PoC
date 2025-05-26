@testable import MVVMC
import Testing

@Suite
struct NavigationServiceTests {
  var service: NavigationService

  init() {
    service = NavigationService()
  }

  @Test("navigate(to:) appends to path and stack")
  func testNavigate() {
    service.navigate(to: .profile)
    #expect(service.contains(.profile))
  }

  @Test("contains returns true if route is in stack")
  func testContains() {
    service.navigate(to: .tasks)
    #expect(service.contains(.tasks))
    #expect(!service.contains(.dashboard))
  }

  @Test("popLast removes last route from path and stack")
  func testPopLast() {
    service.navigate(to: .dashboard)
    service.navigate(to: .profile)
    service.popLast()
    #expect(service.contains(.dashboard))
    #expect(!service.contains(.profile))
  }

  @Test("resetNavigation clears path and stack")
  func testResetNavigation() {
    service.navigate(to: .dashboard)
    service.navigate(to: .tasks)
    service.resetNavigation()
    #expect(!service.contains(.dashboard))
    #expect(!service.contains(.tasks))
  }

  @Test("showLoginScreen sets showLoginModal true")
  func showLogin() async throws {
    service.showLoginScreen()
    try await Task.sleep(nanoseconds: 500_000_000) // allow DispatchQueue.main to run
    #expect(service.showLoginModal == true)
  }

  @Test("dismissLoginScreen sets showLoginModal false")
  func dismissLogin() async throws {
    service.showLoginModal = true
    service.dismissLoginScreen()
    try await Task.sleep(nanoseconds: 500_000_000)
    #expect(service.showLoginModal == false)
  }
}
