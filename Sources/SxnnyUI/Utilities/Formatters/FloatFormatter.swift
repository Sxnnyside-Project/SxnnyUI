//
//  FloatFormatter.swift
//  SxnnyUI
//
//  Created by Sxnnyside Proyect on 21/01/25.
//

import Foundation

/// `FloatFormatter` is a custom formatter subclass of `Formatter`, designed for formatting and parsing floating-point numbers using an underlying `NumberFormatter`.
///
/// - The formatter is configured to use decimal style and limits the maximum number of fraction digits to two.
/// - Use this formatter to present and interpret floating-point numbers consistently in user interfaces and data exchanges.
///
/// ### Initialization
/// - `init()`: Initializes the formatter with decimal style and two maximum fraction digits.
/// - `init?(coder:)`: Required initializer for decoding, which is not implemented and will trigger a runtime error if called.
///
/// ### Formatting
/// - `string(for:)`: Returns a formatted string representation of an `NSNumber` object, or `nil` if the input is not an `NSNumber`.
///
/// ### Parsing
/// - `getObjectValue(_:for:errorDescription:)`: Parses a string into a number. Returns `true` if successful and updates the referenced object; returns `false` otherwise.
///
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
