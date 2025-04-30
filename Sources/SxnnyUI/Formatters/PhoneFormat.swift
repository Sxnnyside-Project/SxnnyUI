//
//  PhoneFormat.swift
//  SxnnyUI
//
//  Created by TI on 31/03/25.
//

import Foundation

/// A utility struct for formatting phone numbers into various string representations.
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
