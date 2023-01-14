//
//  ComputerPlayType.swift
//  RockPaperScissorsAPI
//
//  Created by Justin Reusch on 12/29/22.
//

// swiftlint:disable identifier_name nesting

import Foundation

extension RockPaperScissors {
    /// An enum of different play modes a computer opponent can make.
    public enum ComputerPlayType: String, RawRepresentable, CustomStringConvertible {
        /// The normal mode in which the computer just makes a random choice.
        case random
        /// The computer always cheats by playing the exact play the beat the player's choice.
        case computerAlwaysWins
        /// The computer always allow the player to cheat by playing the exact play to lose to the player's choice.
        case computerAlwaysLoses
        /// The computer always copies the player's choice.
        case computerAlwaysMatches

        /// Init with a fuzzy string representation.
        /// - Parameter string: A fuzzy string representation.
        public init?(string: String) {
            if let type: ComputerPlayType = .init(rawValue: string) {
                self = type
            } else {
                switch string.lowercased() {
                case "0", "r", "rand", "rndm", "random": self = .random
                case "1", "win", "alwayswin": self = .computerAlwaysWins
                case "2", "lose", "alwayslose": self = .computerAlwaysLoses
                case "3", "match", "alwaysmatch": self = .computerAlwaysMatches
                default: return nil
                }
            }
        }

        /// A non-localized string representation.
        public var description: String {
            switch self {
            case .random:
                return "Random"
            case .computerAlwaysWins:
                return "Computer always wins"
            case .computerAlwaysLoses:
                return "Computer always loses"
            case .computerAlwaysMatches:
                return "Computer always matches"
            }
        }

        // 🎁 Wrapper -------------------------------- /

        /// A box wrapping a computer play type value with a unique ID.
        public struct Wrapper: Identifiable, Hashable {
            public let type: ComputerPlayType
            public let id: UUID = .init()

            public init(around type: ComputerPlayType = .random) {
                self.type = type
            }

            public static let all: [Wrapper] = [
                .init(around: .random),
                .init(around: .computerAlwaysWins),
                .init(around: .computerAlwaysLoses),
                .init(around: .computerAlwaysMatches)
            ]
        }
    }
}
