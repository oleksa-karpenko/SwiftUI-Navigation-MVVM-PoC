# SwiftUI Navigation PoC

This is a simple **Proof of Concept (PoC)** iOS app built with **SwiftUI** to explore:

- Declarative navigation patterns (iOS 16+)
- MVVM + Coordinator pattern in SwiftUI
- Session expiration logic
- Tab navigation
- High code test coverage (unit + snapshot)

---

## 🧭 Navigation Patterns

The app uses **SwiftUI's `NavigationStack` and `NavigationPath`** introduced in iOS 16+.  
This allows navigation to be managed by **data-driven paths**, not just view transitions.

See:
```
Services/NavigationService.swift
```

You can push and pop screens by manipulating the `path` property, which simplifies flow control and state restoration.

---

## 🧩 MVVM + Coordinator Pattern

While the MVVM + Coordinator pattern is widely used in UIKit, this project demonstrates how it can be adapted to SwiftUI.

Examples:
- App-level coordinator: `App/AppCoordinator.swift`
- Feature-specific coordinator: `Features/Dashboard/DashboardCoordinator.swift`

Note: In SwiftUI, the **Coordinator pattern is less necessary** because navigation and state can be more declarative, but it still provides useful separation of concerns.

---

## 🔒 Session Expiration Scenario

This PoC simulates a **30-second user session timeout**.  
When the session expires:

- The login screen is presented modally (`.fullScreenCover`)
- The user **cannot bypass the login** without renewing the session

This mimics security behavior seen in enterprise or financial applications.

---

## ✅ Testing & Coverage

This project aims for **95%+ code coverage** using:

- **Unit tests**: testing view models, coordinators, and services
- **Snapshot tests**: for all SwiftUI views (using [SnapshotTesting](https://github.com/pointfreeco/swift-snapshot-testing))

The architecture supports testing via:
- MVVM structure
- Protocols and dependency injection
- Mocks and fakes

---

## 🧪 Tools & Technologies

- SwiftUI
- Xcode 15+
- Swift 5.9+
- SnapshotTesting
- Swift Testing (Swift 5.9 native test suite)
- MVVM + Coordinator
- Declarative `NavigationPath`

---

## 📂 Project Structure

```
App/
  AppCoordinator.swift
Features/
  Dashboard/
    DashboardCoordinator.swift
    DashboardView.swift
Services/
  NavigationService.swift
  SessionManager.swift
Tests/
  Unit/
  Snapshot/
```

---

## 🚀 Getting Started

1. Clone the repo
2. Open `MVVMC.xcodeproj` in Xcode
3. Build & run (iOS 16+)
4. Run tests: `Cmd+U`

---

## 🧼 Notes

- SwiftLint is configured (check `.swiftlint.yml`)
- Tests are written using Swift's native testing syntax (not XCTest)
- Login session resets every 30s for simulation
