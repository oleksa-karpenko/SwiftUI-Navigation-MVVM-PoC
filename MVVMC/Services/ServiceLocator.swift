import Foundation

/// A simple Service Locator for dependency resolution.
final class ServiceLocator {
  static let shared = ServiceLocator()

  private var services: [ObjectIdentifier: Any] = [:]

  private init() {}

  func register<T>(_ service: T, for type: T.Type = T.self) {
    let key = ObjectIdentifier(type)
    services[key] = service
  }

  func resolveOptional<T>(_ type: T.Type = T.self) -> T? {
    let key = ObjectIdentifier(type)
    return services[key] as? T
  }

  func resolve<T>(_ type: T.Type = T.self) -> T {
    guard let resolved: T = resolveOptional(type) else {
      fatalError("No registered service for type \(type)")
    }
    return resolved
  }

  // Reset (for tests or reinitialization)
  func reset() {
    services.removeAll()
  }
}
