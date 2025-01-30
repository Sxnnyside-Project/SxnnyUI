//
//  StringProtocol.swift
//  SxnnyUI
//
//  Created by Sxnnyide Proyesct on 31/01/25.
//

extension StringProtocol {
    public var firstUppercased: String { prefix(1).uppercased() + dropFirst() }
    public var firstCapitalized: String { prefix(1).capitalized + dropFirst() }
    public var firstLowercased: String { prefix(1).lowercased() + dropFirst() }
}
