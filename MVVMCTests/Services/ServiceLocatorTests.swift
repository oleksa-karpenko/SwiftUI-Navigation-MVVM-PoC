@testable import MVVMC
import Testing

@Suite
struct ServiceLocatorTests {
  class MockService {
    let name: String
    init(name: String) {
      self.name = name
    }
  }

  @Test("Registers and resolves service correctly")
  func registerAndResolve() {
    let service = MockService(name: "Test")
    ServiceLocator.shared.register(service)

    let resolved: MockService = ServiceLocator.shared.resolve()
    #expect(resolved.name == "Test")

    // Clean up
    ServiceLocator.shared.reset()
  }

  @Test("resolveOptional returns nil if not registered")
  func resolveOptionalNil() {
    ServiceLocator.shared.reset()
    let result = ServiceLocator.shared.resolveOptional(MockService.self)
    #expect(result == nil)
  }

  @Test("resolveOptional returns registered service")
  func resolveOptionalSucceeds() {
    let mock = MockService(name: "UnitTest")
    ServiceLocator.shared.register(mock)

    let result: MockService? = ServiceLocator.shared.resolveOptional()
    #expect(result?.name == "UnitTest")
  }
}
