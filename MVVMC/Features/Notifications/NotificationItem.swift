import Foundation

struct NotificationItem: Identifiable, Equatable {
  var id = UUID()
  var message: String
  var isRead: Bool
}
