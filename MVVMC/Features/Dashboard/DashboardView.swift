import SwiftUI

struct DashboardView: View {
  @EnvironmentObject private var navigation: NavigationService
  @StateObject var viewModel = DashboardViewModel()

  var body: some View {
    VStack(alignment: .leading, spacing: 24) {
      headerSection
      todaySummarySection
      navigationTilesSection
      Spacer()
    }
    .padding()
    .navigationTitle("Dashboard")
  }

  var headerSection: some View {
    HStack {
      VStack(alignment: .leading) {
        Text("Welcome back,")
          .font(.subheadline)
          .foregroundColor(.gray)
        Text(viewModel.username)
          .font(.title)
          .bold()
      }
      Spacer()
      Button(
        action: {
          navigation.navigate(to: .profile)
        },
        label: {
          if let url = viewModel.avatarURL {
            AsyncImage(url: url) { image in
              image.resizable().scaledToFill()
            } placeholder: {
              Color.gray.opacity(0.3)
            }
            .frame(width: 40, height: 40)
            .clipShape(Circle())
          } else {
            Image(systemName: "person.crop.circle.fill")
              .resizable()
              .frame(width: 40, height: 40)
              .foregroundColor(.blue)
          }
        },
      )
    }
  }

  var todaySummarySection: some View {
    HStack(spacing: 16) {
      summaryCard(title: "Today", value: "\(viewModel.todayTasks)", color: .orange)
      summaryCard(title: "Completed", value: "\(viewModel.completedTasks)", color: .green)
      summaryCard(title: "Unread", value: "\(viewModel.unreadNotifications)", color: .red)
    }
  }

  func summaryCard(title: String, value: String, color: Color) -> some View {
    VStack {
      Text(value)
        .font(.title)
        .bold()
        .foregroundColor(color)
      Text(title)
        .font(.caption)
        .foregroundColor(.secondary)
    }
    .frame(maxWidth: .infinity)
    .padding()
    .background(Color(UIColor.secondarySystemBackground))
    .cornerRadius(12)
  }

  var navigationTilesSection: some View {
    VStack(spacing: 16) {
      tile(label: "My Tasks", icon: "checkmark.circle") {
        navigation.navigate(to: .tasks)
      }
      tile(label: "Notifications", icon: "bell") {
        navigation.navigate(to: .notifications)
      }
    }
  }

  func tile(label: String, icon: String, action: @escaping () -> Void) -> some View {
    Button(action: action) {
      HStack {
        Image(systemName: icon)
          .font(.title2)
          .foregroundColor(.blue)
        Text(label)
          .font(.body)
          .foregroundColor(.primary)
        Spacer()
        Image(systemName: "chevron.right")
          .foregroundColor(.gray)
      }
      .padding()
      .background(Color(UIColor.systemBackground))
      .cornerRadius(10)
      .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 2)
    }
  }
}
