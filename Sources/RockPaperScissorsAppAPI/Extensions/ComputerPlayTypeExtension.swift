//
//  ComputerPlayTypeExtension.swift
//  RockPaperScissorsAppAPI
//
//  Created by Justin Reusch on 1/8/23.
//

import Foundation
import RockPaperScissorsAPI

extension RockPaperScissors.ComputerPlayType: CustomLocalizedStringConvertible {
    public var localizedDescription: String {
        switch self {
        case .random:
            return t("rps_cpt_random")
        case .computerAlwaysWins:
            return t("rps_cpt_cawins")
        case .computerAlwaysLoses:
            return t("rps_cpt_caloses")
        case .computerAlwaysMatches:
            return t("rps_cpt_camatches")
        }
    }

    // 👁️ Private ----------------------------------- /

    private func t(_ key: String) -> String {
        NSLocalizedString(key, comment: "")
    }
}
