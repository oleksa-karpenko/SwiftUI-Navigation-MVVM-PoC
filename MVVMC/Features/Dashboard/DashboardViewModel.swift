import Combine
import Foundation

class DashboardViewModel: ObservableObject {
  @Published var username: String = "Oleksandr"
  @Published var avatarURL: URL?
  @Published var todayTasks: Int = 12
  @Published var completedTasks: Int = 7
  @Published var unreadNotifications: Int = 3

  // Actions
  var onTapProfile: (() -> Void)?
  var onTapTasks: (() -> Void)?
  var onTapNotifications: (() -> Void)?
}
