//
//  String.swift
//  RockPaperScissorsAPI
//
//  Created by Justin Reusch on 1/6/23.
//

import Foundation

extension String {
    /// Trims any whitespace at the end of a string.
    public func trimEnd() -> String {
        var trimmed = self
        while trimmed.last?.isWhitespace == true {
            trimmed = String(trimmed.dropLast())
        }
        return trimmed
    }
}
