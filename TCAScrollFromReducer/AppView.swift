import SwiftUI
import ComposableArchitecture

struct AppView: View {
    let store: Store<AppState, AppAction>
    let items = (1...100)

    var body: some View {
        WithViewStore(store) { viewStore in
            ScrollViewReader { scrollProxy in
                ZStack {
                    ScrollView {
                        ForEach(items, id: \.self) { Text("\($0)"); Divider() }
                    }
                    .onReceive(NotificationCenter.default.publisher(for: NSNotification.scrollUp)) { _ in
                        scrollProxy.scrollTo(items.first!)
                    }
                    .onReceive(NotificationCenter.default.publisher(for: NSNotification.scrollDown)) { _ in
                        scrollProxy.scrollTo(items.last!)
                    }
                    VStack {
                        Spacer()
                        HStack {
                            Button("Up") {
                                viewStore.send(.upButtonTapped)
                            }
                            Spacer()
                            Button("Down") {
                                viewStore.send(.downButtonTapped)
                            }
                        }
                    }.padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
                }
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
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
