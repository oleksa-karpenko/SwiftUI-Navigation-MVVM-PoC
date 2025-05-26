import Foundation

@MainActor
final class TasksViewModel: ObservableObject {
  @Published var tasks: [TaskItem]

  init(tasks: [TaskItem] = [
    TaskItem(title: "Install device in Apt 401", isCompleted: false),
    TaskItem(title: "Verify sensor calibration", isCompleted: true),
    TaskItem(title: "Collect feedback from user", isCompleted: false),
    TaskItem(title: "Upload installation report", isCompleted: false),
    TaskItem(title: "Replace battery in sensor #22", isCompleted: true),
    TaskItem(title: "Contact customer for follow-up", isCompleted: false),
    TaskItem(title: "Update firmware on hub device", isCompleted: false),
    TaskItem(title: "Document wiring diagram", isCompleted: true),
  ]) {
    self.tasks = tasks
  }

  func toggle(_ task: TaskItem) {
    guard let index = tasks.firstIndex(where: { $0.id == task.id }) else { return }
    tasks[index].isCompleted.toggle()
  }
}
