//
//  Util.swift
//  RockPaperScissorsAPI
//
//  Created by Justin Reusch on 12/29/22.
//

/// Determines how the computer should play based on the play type and player's choice.
/// - Parameter myChoice: The choice of the player for whose perspective we consider the result.
/// - Parameter type: The way the computer should play.
/// - Returns: Whether the computer should play rock, paper or scissors based on the play type and player's choice.
public func getComputerPlay(
    vs myChoice: RockPaperScissors,
    type: RockPaperScissors.ComputerPlayType = .random
) -> RockPaperScissors {
    switch type {
    case .random:
        return .random
    case .computerAlwaysWins:
        return RockPaperScissors.GameResult.win.howToGet(vs: myChoice)
    case .computerAlwaysLoses:
        return RockPaperScissors.GameResult.loss.howToGet(vs: myChoice)
    case .computerAlwaysMatches:
        return RockPaperScissors.GameResult.tie.howToGet(vs: myChoice)
    }
}

/// Gets a result describing a game of Rock, Paper, Scissors between two players.
/// - Parameter result: The result (win, loss or tie) of a game of Rock, Paper, Scissors.
/// - Parameter myChoice: The choice of the player for whose perspective we consider the result.
/// - Parameter opponent: The choice of the player we consider to be the opponent.
/// - Returns: A non-localized string describing the result of a game of Rock, Paper, Scissors
func getResultString(
    from result: RockPaperScissors.GameResult,
    _ myChoice: RockPaperScissors,
    vs opponent: RockPaperScissors
) -> String {
    let description = myChoice.description(vs: opponent)
    switch result {
    case .win: return "\(description)... You win!!! 🎉"
    case .tie: return "Call it a draw! 🤷"
    case .loss: return "\(description)... You lose! 😢"
    }
}
