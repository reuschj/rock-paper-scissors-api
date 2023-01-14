//
//  Wrapper.swift
//  RockPaperScissorsAPI
//
//  Created by Justin Reusch on 1/11/23.
//

// swiftlint:disable identifier_name

import Foundation

extension RockPaperScissors {
    // 🎁 Wrapper -------------------------------- /

    /// A box wrapping a Rock/Paper/Scissors value with a unique ID.
    public struct Wrapper: Identifiable, Hashable {
        public let type: RockPaperScissors
        public let id: UUID = .init()

        public init(around type: RockPaperScissors = .random) {
            self.type = type
        }

        public static let all: [Wrapper] = [
            .init(),
            .init(around: .rock),
            .init(around: .paper),
            .init(around: .scissors)
        ]
    }
}
