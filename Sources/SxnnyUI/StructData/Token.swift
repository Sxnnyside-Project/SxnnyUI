//
//  Token.swift
//  SxnnyUI
//
//  Created by Sxnnyside Proyect on 21/01/25.
//

import Foundation

/// Modelo de datos que representa un token.
public struct Token: Identifiable, Hashable {
    public let id = UUID()
    public var text: String

    public init(text: String) {
        self.text = text
    }
}
