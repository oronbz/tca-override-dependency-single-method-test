//
//  MainView.swift
//  TCAOverrideDependencySingleMethod
//
//  Created by Oron Ben Zvi on 03/03/2023.
//

import SwiftUI
import ComposableArchitecture
import Dependencies

struct Main: Reducer {
    @Dependency(\.numberGenerator.ten) var ten
    
    struct State: Equatable {
        var number: Int?
    }
    
    enum Action: Equatable {
        case onAppear
        case numberResult(Int)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .task {
                    .numberResult(await ten())
                }
            case .numberResult(let number):
                state.number = number
                return .none
            }
        }
    }
}

struct MainView: View {
    let store: StoreOf<Main>
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack {
                if let number = viewStore.number {
                    Text("Number: \(number)")
                } else {
                    Text("No number")
                }
            }
            .onAppear { viewStore.send(.onAppear) }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(store: .init(
            initialState: .init(),
            reducer: Main())
        )
            
    }
}
