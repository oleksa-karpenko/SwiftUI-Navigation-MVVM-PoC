import Foundation
@testable import MVVMC
import Testing

@Suite
struct TaskItemTests {
  @Test("Two tasks with same ID and content are equal")
  func equalitySameContentSameID() {
    let id = UUID()
    let a = TaskItem(id: id, title: "Test", isCompleted: false)
    let b = TaskItem(id: id, title: "Test", isCompleted: false)

    #expect(a == b)
  }

  @Test("Two tasks with different IDs are not equal")
  func inequalityDueToID() {
    let a = TaskItem(title: "Task", isCompleted: false)
    let b = TaskItem(title: "Task", isCompleted: false)

    #expect(a != b)
  }

  @Test("Modifying title changes equality")
  func differentTitle() {
    let id = UUID()
    let a = TaskItem(id: id, title: "A", isCompleted: false)
    let b = TaskItem(id: id, title: "B", isCompleted: false)

    #expect(a != b)
  }

  @Test("Modifying isCompleted changes equality")
  func differentCompletionState() {
    let id = UUID()
    let a = TaskItem(id: id, title: "Same", isCompleted: false)
    let b = TaskItem(id: id, title: "Same", isCompleted: true)

    #expect(a != b)
  }
}
