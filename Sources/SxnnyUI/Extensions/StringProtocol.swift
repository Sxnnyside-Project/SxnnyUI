//
//  StringProtocol.swift
//  SxnnyUI
//
//  Created by Sxnnyide Proyesct on 31/01/25.
//

import Foundation

public extension StringProtocol {

    /// First letter in uppercase, rest the same.
    var firstUppercased: String {
        prefix(1).uppercased() + dropFirst()
    }

    /// First letter in uppercase, rest the same.
    var firstCapitalized: String {
        prefix(1).capitalized + dropFirst()
    }

    /// First letter in lowercase, rest the same.
    var firstLowercased: String {
        prefix(1).lowercased() + dropFirst()
    }

    /// Checks if the string is a valid email address.
    var isValidEmail: Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: self)
    }

    /// Converts the string to CamelCase.
    var camelCased: String {
        let parts = self.components(separatedBy: CharacterSet.alphanumerics.inverted)
        let first = parts.first?.lowercased() ?? ""
        let rest = parts.dropFirst().map { $0.capitalized }.joined()
        return first + rest
    }
    
    /// Converts the string to snake_case.
    var snakeCased: String {
        let pattern = "([a-z0-9])([A-Z])"
        let regex = try? NSRegularExpression(pattern: pattern, options: [])
        let range = NSRange(startIndex..., in: self)
        let modString = regex?.stringByReplacingMatches(in: String(self), options: [], range: range, withTemplate: "$1_$2") ?? String(self)
        return modString.lowercased()
    }

    /// Converts the string to kebab-case.
    var kebabCased: String {
        snakeCased.replacingOccurrences(of: "_", with: "-")
    }
        
    /// Extracts the numeric characters from the string.
    var onlyNumbers: String {
        String(filter { $0.isNumber })
    }

    /// Trim the string by removing leading and trailing whitespace and newlines.
    var trimmed: String {
        trimmingCharacters(in: .whitespacesAndNewlines)
    }

    /// Checks if the string is blank (empty or contains only whitespace).
    var isBlank: Bool {
        trimmed.isEmpty
    }

    /// Counts the number of characters in the string.
    var length: Int {
        count
    }

    /// Repeats the string a specified number of times.
    func repeated(_ times: Int) -> String {
        guard times > 0 else { return "" }
        return String(repeating: String(self), count: times)
    }
    /// Reverses the string.
    var reversedString: String {
        String(reversed())
    }

    /// Checks if the string contains only numeric characters.
    var isNumeric: Bool {
        Double(self) != nil
    }
    
    /// Checks if the string is a palindrome.
    var palindrome: Bool {
        self == self.reversedString
    }
}
