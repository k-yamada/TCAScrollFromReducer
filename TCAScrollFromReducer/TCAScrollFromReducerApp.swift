import SwiftUI
import ComposableArchitecture

@main
struct TCAScrollFromReducerApp: App {
    var body: some Scene {

        WindowGroup {
            AppView(
                store: Store(
                    initialState: AppState(),
                    reducer: appReducer,
                    environment: AppEnvironment(
                        mainQueue: .main
                    )
                )
            )
        }
    }
}
