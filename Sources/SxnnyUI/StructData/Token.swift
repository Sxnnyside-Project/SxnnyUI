//
//  Token.swift
//  SxnnyUI
//
//  Created by Sxnnyside Proyect on 21/01/25.
//

import Foundation

/// A data model representing a token.
/// This struct conforms to the `Identifiable` and `Hashable` protocols, making it suitable for use in collections and identifiable contexts.
public struct Token: Identifiable, Hashable {
    /// A unique identifier for the token.
    public let id = UUID()
    /// The text content of the token.
    public var text: String

    /// Initializes a new instance of `Token`.
    /// - Parameter text: The text content of the token.
    public init(text: String) {
        self.text = text
    }
}
