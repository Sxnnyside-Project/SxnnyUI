//
//  Token.swift
//  SxnnyUI
//
//  Created by Sxnnyside Proyect on 21/01/25.
//

import Foundation

/// A data model representing a token, typically used for tagging or segmenting text input.
/// 
/// `Token` is a value type that supports identification and hashing, making it suitable for use in SwiftUI lists
/// and collections. Each token contains a unique identifier and a text value, allowing it to be rendered,
/// selected, or manipulated individually.
/// 
/// - Conforms To:
///     - `Identifiable`: Enables the use of tokens in list-like UI components.
///     - `Hashable`: Allows tokens to serve as dictionary keys or be stored in sets.
/// 
/// - Properties:
///     - `id`: A unique identifier assigned at initialization time.
///     - `text`: The string content or label of the token.
/// 
/// - Initialization:
///     - `init(text:)`: Creates a new token with the specified text value.
/// 
/// Typical usage involves generating tokens from user input (e.g., in a tag entry field), displaying them,
/// and supporting efficient updates or deletions.
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
