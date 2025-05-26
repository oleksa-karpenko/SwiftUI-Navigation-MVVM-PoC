import SwiftUI

struct NotificationsView: View {
  @StateObject private var viewModel = NotificationsViewModel()

  var body: some View {
    List {
      ForEach(viewModel.notifications) { notif in
        HStack {
          Circle()
            .fill(notif.isRead ? Color.clear : Color.red)
            .frame(width: 10, height: 10)
          Text(notif.message)
            .fontWeight(notif.isRead ? .regular : .bold)
        }
        .contentShape(Rectangle())
        .onTapGesture {
          viewModel.toggleIsRead(notif.id)
        }
      }
    }
    .navigationTitle("Notifications")
  }
}
