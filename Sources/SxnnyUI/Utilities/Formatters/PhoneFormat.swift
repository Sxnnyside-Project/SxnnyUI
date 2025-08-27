//
//  PhoneFormat.swift
//  SxnnyUI
//
//  Created by Sxnnyside Project on 31/03/25.
//

import Foundation

/// `PhoneFormat` is a utility struct that provides static methods for formatting phone numbers into various string representations commonly used in North America.
///
/// The formatting utilities are designed to handle 10-digit North American phone numbers, as well as certain special prefixes (such as those starting with "860").
///
/// # Formatting Styles
/// - **With Brackets:** Formats the string as "(123) 456 7890" for standard visual clarity.
/// - **Without Brackets:** Formats the string as "123 456 7890", omitting any parentheses.
/// - **With Country Code:** Prepends a country code, producing formats like "+1 123 456 7890".
/// - **With Country Code and Brackets:** Combines both, producing "+1 (123) 456 7890".
///
/// If the input phone number does not match the expected format (a contiguous 10-digit North American number or a specific "860" prefix followed by 9 digits), the original string is returned unchanged.
///
/// # Example Usage
/// ```swift
/// let formatted = PhoneFormat.formatPhoneNumberWithBrackets("1234567890")
/// // formatted == "(123) 456 7890"
///
/// let formattedWithCountry = PhoneFormat.formatPhoneNumberWithCountryCode("1234567890", countryCode: "1")
/// // formattedWithCountry == "+1 123 456 7890"
/// ```
///
/// # Note
/// These methods perform no validation beyond pattern-matching and are not intended for complex international numbers or numbers including extensions.
public struct PhoneFormat {
    
    /// Formats a phone number into a string with brackets (e.g., "(123) 456 7890").
    /// - Parameter phoneNumber: The phone number to format.
    /// - Returns: A formatted phone number with brackets, or the original string if it doesn't match the expected format.
    public static func formatPhoneNumberWithBrackets(_ phoneNumber: String) -> String {
        let phoneNumberRegex = "[2-9]\\d{2}\\d{3}\\d{4}|860\\d{9}"
        guard phoneNumber.range(of: phoneNumberRegex, options: .regularExpression, range: nil, locale: nil) != nil else {
            return phoneNumber
        }
        
        var formattedPhoneNumber = ""
        var index = phoneNumber.startIndex

        formattedPhoneNumber.append("(")
        formattedPhoneNumber.append(contentsOf: phoneNumber[index...phoneNumber.index(index, offsetBy: 2)])
        formattedPhoneNumber.append(") ")
        index = phoneNumber.index(index, offsetBy: 3)

        formattedPhoneNumber.append(contentsOf: phoneNumber[index...phoneNumber.index(index, offsetBy: 2)])
        formattedPhoneNumber.append(" ")
        index = phoneNumber.index(index, offsetBy: 3)

        formattedPhoneNumber.append(contentsOf: phoneNumber[index...phoneNumber.index(index, offsetBy: 3)])
        index = phoneNumber.index(index, offsetBy: 4)

        formattedPhoneNumber.append(contentsOf: phoneNumber[index...])
        return formattedPhoneNumber
    }
    
    /// Formats a phone number into a string without brackets (e.g., "123 456 7890").
    /// - Parameter phoneNumber: The phone number to format.
    /// - Returns: A formatted phone number without brackets, or the original string if it doesn't match the expected format.
    public static func formatPhoneNumberWithoutBrackets(_ phoneNumber: String) -> String {
        let phoneNumberRegex = "[2-9]\\d{2}\\d{3}\\d{4}|860\\d{9}"
        guard phoneNumber.range(of: phoneNumberRegex, options: .regularExpression, range: nil, locale: nil) != nil else {
            return phoneNumber
        }
        
        var formattedPhoneNumber = ""
        var index = phoneNumber.startIndex
        
        formattedPhoneNumber.append(contentsOf: phoneNumber[index...phoneNumber.index(index, offsetBy: 2)])
        formattedPhoneNumber.append(" ")
        index = phoneNumber.index(index, offsetBy: 3)
        
        formattedPhoneNumber.append(contentsOf: phoneNumber[index...phoneNumber.index(index, offsetBy: 2)])
        formattedPhoneNumber.append(" ")
        index = phoneNumber.index(index, offsetBy: 3)
        
        formattedPhoneNumber.append(contentsOf: phoneNumber[index...])
        return formattedPhoneNumber
    }
    
    /// Formats a phone number into a string with a country code (e.g., "+1 123 456 7890").
    /// - Parameters:
    ///   - phoneNumber: The phone number to format.
    ///   - countryCode: The country code to prepend to the phone number.
    /// - Returns: A formatted phone number with the country code.
    public static func formatPhoneNumberWithCountryCode(_ phoneNumber: String, countryCode: String) -> String {
        return "+\(countryCode) \(formatPhoneNumberWithoutBrackets(phoneNumber))"
    }
    
    /// Formats a phone number into a string with a country code and brackets (e.g., "+1 (123) 456 7890").
    /// - Parameters:
    ///  - phoneNumber: The phone number to format.
    ///  - countryCode: The country code to prepend to the phone number.
    ///  - Returns: A formatted phone number with the country code and brackets.
    public static func formatPhoneNumberWithCountryCodeAndBrackets(_ phoneNumber: String, countryCode: String) -> String {
        return "+\(countryCode) \(formatPhoneNumberWithBrackets(phoneNumber))"
    }
}
