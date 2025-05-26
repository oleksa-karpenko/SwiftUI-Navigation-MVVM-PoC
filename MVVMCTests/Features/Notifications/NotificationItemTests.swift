import Foundation
@testable import MVVMC
import Testing

@Suite
struct NotificationItemTests {
  @Test("Initialization sets properties correctly")
  func initialization() {
    let item = NotificationItem(message: "Test message", isRead: false)

    #expect(item.message == "Test message")
    #expect(item.isRead == false)
  }

  @Test("Two items with same data are not equal unless IDs match")
  func inequalityDueToUUID() {
    let item1 = NotificationItem(message: "Hello", isRead: false)
    let item2 = NotificationItem(message: "Hello", isRead: false)

    #expect(item1 != item2) // Because UUIDs differ
  }

  @Test("Equality works when IDs and fields match")
  func equalityWithSameID() {
    let id = UUID()
    let item1 = NotificationItem(id: id, message: "Same", isRead: true)
    let item2 = NotificationItem(id: id, message: "Same", isRead: true)

    #expect(item1 == item2)
  }

  @Test("Identifiable ID is unique for new instances")
  func iDUniqueness() {
    let item1 = NotificationItem(message: "A", isRead: false)
    let item2 = NotificationItem(message: "B", isRead: true)

    #expect(item1.id != item2.id)
  }
}
