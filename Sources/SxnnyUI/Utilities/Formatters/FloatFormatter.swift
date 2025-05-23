//
//  FloatFormatter.swift
//  SxnnyUI
//
//  Created by Sxnnyside Proyect on 21/01/25.
//

import Foundation

/// A custom formatter for formatting and parsing floating-point numbers.
public class FloatFormatter: Formatter {
    /// The underlying `NumberFormatter` used for formatting and parsing numbers.
    private let numberFormatter: NumberFormatter

    /// Initializes a new instance of `FloatFormatter` with default settings.
    public override init() {
        numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 2
        super.init()
    }

    /// Initializes a new instance of `FloatFormatter` from a decoder.
    /// - Parameter coder: The decoder to use for initialization.
    /// - Note: This initializer is not implemented and will throw a runtime error if called.
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /// Returns a formatted string representation of the given object.
    /// - Parameter obj: The object to format, expected to be an `NSNumber`.
    /// - Returns: A formatted string if the object is an `NSNumber`, or `nil` otherwise.
    public override func string(for obj: Any?) -> String? {
        guard let number = obj as? NSNumber else { return nil }
        return numberFormatter.string(from: number)
    }

    /// Parses a string into an object value.
    /// - Parameters:
    ///   - obj: A pointer to the object that will hold the parsed value.
    ///   - string: The string to parse.
    ///   - errorDescription: A pointer to an error description if parsing fails.
    /// - Returns: `true` if the string was successfully parsed into a number, or `false` otherwise.
    public override func getObjectValue(_ obj: AutoreleasingUnsafeMutablePointer<AnyObject?>?, for string: String, errorDescription: AutoreleasingUnsafeMutablePointer<NSString?>?) -> Bool {
        if let number = numberFormatter.number(from: string) {
            obj?.pointee = number
            return true
        }
        return false
    }
}
