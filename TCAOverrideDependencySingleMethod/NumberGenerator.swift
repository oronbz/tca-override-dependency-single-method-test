//
//  NumberGenerator.swift
//  TCAOverrideDependencySingleMethod
//
//  Created by Oron Ben Zvi on 03/03/2023.
//

import Foundation
import Dependencies

struct NumberGenerator {
    var ten: () async throws -> Int
    var one: () async throws -> Int
}

extension NumberGenerator: DependencyKey {
    static var liveValue: NumberGenerator {
        Self(
            ten: {
                10
            },
            one: {
                1
            }
        )
    }
}

extension DependencyValues {
    var numberGenerator: NumberGenerator {
        get { self[NumberGenerator.self] }
        set { self[NumberGenerator.self] = newValue }
    }
}
