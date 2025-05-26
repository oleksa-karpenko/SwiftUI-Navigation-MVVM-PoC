@testable import MVVMC
import Testing

@MainActor
@Suite
struct TasksViewModelTests {
  var viewModel: TasksViewModel
  var sampleTask: TaskItem

  init() {
    viewModel = TasksViewModel()
    sampleTask = viewModel.tasks.first!
  }

  @Test("Initial task count is correct")
  func initialTaskCount() {
    #expect(viewModel.tasks.count == 8)
  }

  @Test("Toggles isCompleted on valid task")
  func toggleTask() {
    let task = sampleTask
    let before = task.isCompleted

    viewModel.toggle(task)

    let updated = viewModel.tasks.first { $0.id == task.id }
    #expect(updated?.isCompleted == !before)
  }

  @Test("Toggling twice restores original value")
  func toggleTwice() {
    let task = sampleTask
    let before = task.isCompleted

    viewModel.toggle(task)
    viewModel.toggle(task)

    let updated = viewModel.tasks.first { $0.id == task.id }
    #expect(updated?.isCompleted == before)
  }

  @Test("Toggling non-existent task does nothing")
  func toggleUnknownTask() {
    let unknown = TaskItem(title: "Ghost task", isCompleted: true)

    viewModel.toggle(unknown)

    // None of the existing tasks should be modified
    let unchanged = viewModel.tasks.allSatisfy { task in
      task.id != unknown.id
    }

    #expect(unchanged)
  }
}
