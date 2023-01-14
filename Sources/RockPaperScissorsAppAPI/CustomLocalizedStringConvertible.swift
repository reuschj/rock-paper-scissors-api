//
//  CustomLocalizedStringConvertible.swift
//  RockPaperScissorsAppAPI
//
//  Created by Justin Reusch on 1/8/23.
//

import Foundation

/// A type that has a `localizedDescription` property which gets a string set in a localized strings file.
public protocol CustomLocalizedStringConvertible {
    /// A localized string representation (when you use the correct keys in your localized strings file).
    var localizedDescription: String { get }
}
