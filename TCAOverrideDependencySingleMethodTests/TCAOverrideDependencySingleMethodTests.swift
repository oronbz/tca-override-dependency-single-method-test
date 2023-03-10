//
//  TCAOverrideDependencySingleMethodTests.swift
//  TCAOverrideDependencySingleMethodTests
//
//  Created by Oron Ben Zvi on 03/03/2023.
//

import XCTest
import ComposableArchitecture
@testable import TCAOverrideDependencySingleMethod

@MainActor
class TCAOverrideDependencySingleMethodTests: XCTestCase {
    func testFailureOnAppear() async {
        let store = TestStore(initialState: Main.State(), reducer: Main()) {
            $0.numberGenerator.ten = {
                5
            }
        }
        
        await store.send(.onAppear)
        
        await store.receive(.numberResult(5)) {
            $0.number = 5
        }
    }
    
    func testSuccessOnAppear() async {
        let store = TestStore(initialState: Main.State(), reducer: Main()) {
            $0.numberGenerator = .init {
                5
            }
        }
        
        await store.send(.onAppear)
        
        await store.receive(.numberResult(5)) {
            $0.number = 5
        }
    }

}
