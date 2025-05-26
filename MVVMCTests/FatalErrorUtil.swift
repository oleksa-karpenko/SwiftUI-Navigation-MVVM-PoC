import Foundation

enum FatalErrorUtil {
  typealias FatalErrorClosure = (String, StaticString, UInt) -> Never

  private static var _fatalError: FatalErrorClosure = defaultFatalError

  static func replaceFatalError(_ closure: @escaping FatalErrorClosure) -> FatalErrorClosure {
    let original = _fatalError
    _fatalError = closure
    return original
  }

  static func restoreFatalError(_ original: @escaping FatalErrorClosure) {
    _fatalError = original
  }

  static func fatalError(_ message: String, file: StaticString = #file, line: UInt = #line) -> Never {
    _fatalError(message, file, line)
  }

  private static let defaultFatalError: FatalErrorClosure = { Swift.fatalError($0, file: $1, line: $2) }
}

func unreachable() -> Never {
  repeat {
    RunLoop.current.run()
  } while true
}

final class FatalErrorExpectation {
  private var fulfilled = false

  func fulfill() {
    fulfilled = true
  }

  func wait(timeout: TimeInterval) -> Bool {
    let start = Date()
    while !fulfilled, Date().timeIntervalSince(start) < timeout {
      RunLoop.current.run(mode: .default, before: .distantFuture)
    }
    return fulfilled
  }
}
