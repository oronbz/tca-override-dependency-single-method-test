//
//  TCAOverrideDependencySingleMethodApp.swift
//  TCAOverrideDependencySingleMethod
//
//  Created by Oron Ben Zvi on 03/03/2023.
//

import SwiftUI
import XCTestDynamicOverlay


@main
struct TCAOverrideDependencySingleMethodApp: App {
    var body: some Scene {
        WindowGroup {
            if !_XCTIsTesting {
                MainView(store: .init(initialState: .init(), reducer: Main()))
            }
        }
    }
}
