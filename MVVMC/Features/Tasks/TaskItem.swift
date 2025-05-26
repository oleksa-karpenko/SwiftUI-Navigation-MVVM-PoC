import Foundation

struct TaskItem: Identifiable, Equatable {
  let id: UUID
  var title: String
  var isCompleted: Bool

  init(id: UUID = UUID(), title: String, isCompleted: Bool) {
    self.id = id
    self.title = title
    self.isCompleted = isCompleted
  }
}
