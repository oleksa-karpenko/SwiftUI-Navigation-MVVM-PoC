@testable import MVVMC

@MainActor
class MockSessionManager: SessionManaging {
  var startTimerCalled = false
  func startTimer() {
    startTimerCalled = true
  }

  var expireSessionCalled = false
  func expireSession() {
    expireSessionCalled = true
  }

  var resetSessionCalled = false
  func resetSession() {
    resetSessionCalled = true
  }
}
