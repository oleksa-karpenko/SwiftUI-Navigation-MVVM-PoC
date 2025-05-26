@testable import MVVMC
import ViewInspector
import XCTest

// extension NotificationsView: Inspectable {}
// extension NotificationsViewModel: Inspectable {}
// extension NotificationItem: Equatable {
//  static func == (lhs: NotificationItem, rhs: NotificationItem) -> Bool {
//    lhs.id == rhs.id &&
//    lhs.message == rhs.message &&
//    lhs.isRead == rhs.isRead
//  }
// }

final class NotificationsViewTests: XCTestCase {
//  func testRendersAllNotifications() throws {
//    let view = NotificationsView()
//    ViewHosting.host(view: view)
//
//    let inspected = try view.inspect()
//    let list = try inspected.find(ViewType.List.self)
//    let rowCount = 4// try list.forEach().count
//
//    XCTAssertEqual(rowCount, 13, "Expected 13 notifications in the list")
//  }

//  func testUnreadNotificationHasRedDot() throws {
//    let view = NotificationsView()
//    let list = try view.inspect().find(ViewType.List.self)
//
//    // Find first unread item
//    for i in 0..<try list.forEach().count {
//      let notifView = try list.forEach().element(at: i).hStack()
//      let message = try notifView.text(1).string()
//      let fontWeight = try notifView.text(1).attributes().font().weight
//      if fontWeight == .bold {
//        // Test red circle
//        let shape = try notifView.shape(0).actualView()
//        XCTAssertNotNil(shape)
//        return
//      }
//    }
//
//    XCTFail("Expected at least one unread notification")
//  }
//
//  func testTapMarksNotificationAsRead() throws {
//    var view = NotificationsView()
//
//    let exp = view.on(\.didAppear) { view in
//      let list = try view.inspect().find(ViewType.List.self)
//      let row = try list.forEach().element(at: 0)
//      let message = try row.hStack().text(1).string()
//
//      let wasUnread = try row.hStack().text(1).attributes().font().weight == .bold
//      XCTAssertTrue(wasUnread, "Expected message to be initially unread")
//
//      try row.callOnTapGesture()
//
//      let updatedWeight = try row.hStack().text(1).attributes().font().weight
//      XCTAssertEqual(updatedWeight, .regular, "Expected message to be marked as read after tap")
//    }
//
//    ViewHosting.host(view: view)
//    wait(for: [exp], timeout: 2)
//  }
}
