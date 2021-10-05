import ComposableArchitecture
import SwiftUI

struct AppState: Equatable {
}

enum AppAction: Equatable {
    case upButtonTapped
    case downButtonTapped
}

struct AppEnvironment {
    var mainQueue: AnySchedulerOf<DispatchQueue>
}

let appReducer = Reducer<AppState, AppAction, AppEnvironment> { state, action, environment in
    switch action {
    case .upButtonTapped:
        NotificationCenter.default.post(name: NSNotification.scrollDown, object: nil, userInfo: nil)
        return .none
    case .downButtonTapped:
        NotificationCenter.default.post(name: NSNotification.scrollUp, object: nil, userInfo: nil)
        return .none
    }
}
