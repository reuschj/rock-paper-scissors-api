//
//  GameResult.swift
//  RockPaperScissorsAPI
//
//  Created by Justin Reusch on 12/29/22.
//

extension RockPaperScissors {
    /// An enum representing the result of an Rock, Paper, Scissors game
    public enum GameResult: Int, RawRepresentable, CustomStringConvertible, Comparable, Equatable {
        /// The player's choice beats the opponent's choice.
        case win = 1
        /// The player's choice and the opponent's choice are the same.
        case tie = 0
        /// The opponent's choice beats the players's choice.
        case loss = -1

        /// Determines a result based on two Rock, Paper, Scissors players.
        /// - Parameter ownChoice: The play made by the player from whose perspective we judge the result.
        /// - Parameter opponent: The play made by the player who we consider as the opponent.
        /// - Returns: A result (win, loss or tie).
        public static func from(_ ownChoice: RockPaperScissors, vs opponent: RockPaperScissors) -> GameResult {
            if ownChoice > opponent {
                return .win
            } else if opponent > ownChoice {
                return .loss
            } else {
                return .tie
            }
        }

        /// A non-localized string representation of the result.
        public var description: String {
            switch self {
            case .win:
                return "Win"
            case .tie:
                return "Tie"
            case .loss:
                return "Loss"
            }
        }

        /// Determines the play needed to make the desired result.
        /// - Parameter opponent: The play made by the player who we consider as the opponent.
        /// - Returns: The play the player would have to make to obtain the desired result vs. the opponent.
        public func howToGet(vs opponent: RockPaperScissors) -> RockPaperScissors {
            switch self {
            case .win:
                switch opponent {
                case .rock: return .paper
                case .paper: return .scissors
                case .scissors: return .rock
                }
            case .tie:
                return opponent
            case .loss:
                switch opponent {
                case .rock: return .scissors
                case .paper: return .rock
                case .scissors: return .paper
                }
            }
        }

        public static func < (lhs: GameResult, rhs: GameResult) -> Bool {
            lhs.rawValue < rhs.rawValue
        }
    }
}
