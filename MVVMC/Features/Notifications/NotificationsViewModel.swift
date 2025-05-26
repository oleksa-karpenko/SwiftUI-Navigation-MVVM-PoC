import Combine
import Foundation

@MainActor
class NotificationsViewModel: ObservableObject {
  @Published var notifications: [NotificationItem] = [
    NotificationItem(message: "New firmware available", isRead: false),
    NotificationItem(message: "Job #1234 completed", isRead: true),
    NotificationItem(message: "You have a new assignment", isRead: false),
    NotificationItem(message: "Installer app update is ready", isRead: false),
    NotificationItem(message: "Job #1235 assigned", isRead: false),
    NotificationItem(message: "System reboot required", isRead: true),
    NotificationItem(message: "Reminder: Safety training tomorrow", isRead: false),
    NotificationItem(message: "New customer feedback received", isRead: true),
    NotificationItem(message: "Job #1236 cancelled", isRead: true),
    NotificationItem(message: "Device #982 went offline", isRead: false),
    NotificationItem(message: "Firmware installation completed", isRead: true),
    NotificationItem(message: "Schedule updated for this week", isRead: false),
    NotificationItem(message: "You’ve earned a performance badge", isRead: true),
  ]

  func toggleIsRead(_ id: UUID) {
    guard let index = notifications.firstIndex(where: { $0.id == id }) else { return }
    notifications[index].isRead.toggle()
  }
}
