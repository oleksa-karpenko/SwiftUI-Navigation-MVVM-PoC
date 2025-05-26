import Foundation
@testable import MVVMC
import Testing

@MainActor
@Suite
struct NotificationsViewModelTests {
  var viewModel: NotificationsViewModel

  init() {
    viewModel = NotificationsViewModel()
  }

  @Test("Initial notification count is correct")
  func initialCount() {
    #expect(viewModel.notifications.count == 13)
  }

  @Test("Toggle isRead flag works for unread notification")
  func toggleUnreadToRead() {
    let unread = viewModel.notifications.first { !$0.isRead }!
    let id = unread.id

    viewModel.toggleIsRead(id)

    let updated = viewModel.notifications.first { $0.id == id }!
    #expect(updated.isRead == true)
  }

  @Test("Toggle isRead flag works for read notification")
  func toggleReadToUnread() {
    let read = viewModel.notifications.first { $0.isRead }!
    let id = read.id

    viewModel.toggleIsRead(id)

    let updated = viewModel.notifications.first { $0.id == id }!
    #expect(updated.isRead == false)
  }

  @Test("Toggling with non-existing ID does nothing")
  func toggleInvalidId() {
    let original = viewModel.notifications
    let invalidId = UUID()

    viewModel.toggleIsRead(invalidId)

    #expect(viewModel.notifications == original)
  }
}
