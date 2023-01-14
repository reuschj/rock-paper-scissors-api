//
//  GameResultExtension.swift
//  RockPaperScissorsAppAPI
//
//  Created by Justin Reusch on 1/8/23.
//

// swiftlint:disable colon

import Foundation
import RockPaperScissorsAPI

extension RockPaperScissors.GameResult : CustomLocalizedStringConvertible {
    public var localizedDescription: String {
        switch self {
        case .win:
            return t("rps_win")
        case .tie:
            return t("rps_tie")
        case .loss:
            return t("rps_loss")
        }
    }

    // 👁️ Private ----------------------------------- /

    private func t(_ key: String) -> String {
        NSLocalizedString(key, comment: "")
    }
}
