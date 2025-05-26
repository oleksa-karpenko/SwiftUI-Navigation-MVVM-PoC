import SwiftUI

struct TasksView: View {
  @ObservedObject var viewModel: TasksViewModel

  var body: some View {
    List {
      ForEach(viewModel.tasks) { task in
        HStack {
          Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
            .onTapGesture {
              viewModel.toggle(task)
            }
          Text(task.title)
        }
      }
    }
    .navigationTitle("My Tasks")
  }
}
