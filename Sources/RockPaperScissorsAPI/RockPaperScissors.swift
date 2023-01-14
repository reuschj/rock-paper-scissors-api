//
//  RockPaperScissors.swift
//  RockPaperScissorsAPI
//
//  Created by Justin Reusch on 12/29/22.
//

// swiftlint:disable cyclomatic_complexity

import Foundation

/// An enum value and API for the game "Rock, Paper, Scissors".
public enum RockPaperScissors: Int, RawRepresentable, Hashable, CaseIterable {
    /// 🪨 Rock smashes scissors, but is covered by paper.
    case rock = 1
    /// 📄 Paper covers rock, but is cut by scissors.
    case paper = 2
    /// ✂️ Scissors cut paper, but are smashed by rock.
    case scissors = 3

    /// A random case that is either Rock, Paper or Scissors.
    public static var random: RockPaperScissors {
        let random: Int = .random(in: 1...3)
        return .init(rawValue: random)!
    }

    // 🏗️ Initializers -------------------------------- /

    /// Init with a integer value.
    /// - Parameter rawValue: A raw integer representing the choice: 1 = rock, 2 = paper, 3 = scissors
    public init?(rawValue: Int) {
        switch rawValue {
        case 1: self = .rock
        case 2: self = .paper
        case 3: self = .scissors
        default: return nil
        }
    }

    /// Init with a fuzzy string description.
    /// - Parameter string: A string description that may be an abbreviated version.
    public init?(string: String) {
        switch string.lowercased() {
        case "r", "rk", "rck", "rock", "a": self = .rock
        case "p", "pp", "pr", "ppr", "paper", "b": self = .paper
        case "s", "sc", "ss", "sr", "ssr", "scr", "scissors", "c": self = .scissors
        case "rand", "rnd", "rndm", "random": self = .random
        default: return nil
        }
    }
}

// Can be described as a string

extension RockPaperScissors: CustomStringConvertible {
    /// A non-localized string representation of the type.
    public var description: String {
        "\(emoji) \(text.uppercased())"
    }

    /// An emoji representation of the type.
    public var emoji: Character {
        switch self {
        case .rock:
            return "🪨"
        case .paper:
            return "📄"
        case .scissors:
            return "✂️"
        }
    }

    /// A non-localized purely textual representation of the type.
    public var text: String {
        switch self {
        case .rock:
            return "rock"
        case .paper:
            return "paper"
        case .scissors:
            return "scissors"
        }
    }
}

// Can be compared with another instance

extension RockPaperScissors: Comparable, Equatable {
    public static func < (lhs: RockPaperScissors, rhs: RockPaperScissors) -> Bool {
        switch lhs {
        case .rock:
            switch rhs {
            case .rock, .scissors: return false
            case .paper: return true
            }
        case .paper:
            switch rhs {
            case .paper, .rock: return false
            case .scissors: return true
            }
        case .scissors:
            switch rhs {
            case .scissors, .paper: return false
            case .rock: return true
            }
        }
    }

    /// Gets a non-localized string description of a case compared to another case.
    /// - Parameter other: Another instance of Rock Paper Scissors enum.
    /// - Returns: A non-localized string description of a case compared to another case.
    public func description(vs other: RockPaperScissors) -> String {
        "\(self.text.capitalized) \(descriptionMiddle(vs: other)) \(other.text)."
    }

    private func descriptionMiddle(vs other: RockPaperScissors) -> String {
        let match = "is the same as"
        switch self {
        case .rock:
            switch other {
            case .rock: return match
            case .paper: return "was covered by"
            case .scissors: return "smashed"
            }
        case .paper:
            switch other {
            case .rock: return "covered"
            case .paper: return match
            case .scissors: return "was cut by"
            }
        case .scissors:
            switch other {
            case .rock: return "was smashed by"
            case .paper: return "cut"
            case .scissors: return match
            }
        }
    }
}
