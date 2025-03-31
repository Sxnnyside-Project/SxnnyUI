//
//  PhoneFormat.swift
//  SxnnyUI
//
//  Created by TI on 31/03/25.
//

import Foundation

public struct PhoneFormat {
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
    
    public static func formatPhoneNumberWithCountryCode(_ phoneNumber: String, countryCode: String) -> String {
        return "+\(countryCode) \(formatPhoneNumberWithoutBrackets(phoneNumber))"
    }
}
