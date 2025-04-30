//
//  StringProtocol.swift
//  SxnnyUI
//
//  Created by Sxnnyide Proyesct on 31/01/25.
//

/// An extension to provide additional functionality for types conforming to `StringProtocol`.
extension StringProtocol {
    /// Returns a new string with the first character uppercased and the rest of the string unchanged.
    public var firstUppercased: String { 
        prefix(1).uppercased() + dropFirst() 
    }

    /// Returns a new string with the first character capitalized (localized) and the rest of the string unchanged.
    public var firstCapitalized: String { 
        prefix(1).capitalized + dropFirst() 
    }

    /// Returns a new string with the first character lowercased and the rest of the string unchanged.
    public var firstLowercased: String { 
        prefix(1).lowercased() + dropFirst() 
    }
}
