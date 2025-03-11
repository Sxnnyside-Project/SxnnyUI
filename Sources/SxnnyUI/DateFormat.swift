//
//  DateFormat.swift
//  SxnnyUI
//
//  Created by Sxnnyside Proyect on 21/01/25.
//

import Foundation

public struct DateFormat {
    public static func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: date)
    }

    public static func formatDateAlt(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        return formatter.string(from: date)
    }
    
    public static func formatDateHour(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        return formatter.string(from: date)
    }
    
    public static func formatHour(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        return formatter.string(from: date)
    }
    
    public static func formatDateMonth(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.locale = Locale(identifier: "es_ES")
        
        let formattedDate = formatter.string(from: date)
        
        var components = formattedDate.components(separatedBy: " ")
        if components.count > 2 {
            components[2] = components[2].prefix(1).capitalized + components[2].dropFirst().lowercased()
        }
        
        return components.joined(separator: " ")
    }
}

public struct PhoneFormat {
    public static func formatPhoneNumber(_ phoneNumber: String) -> String {
        let phoneNumberRegex = "[2-9]\\d{2}\\d{3}\\d{4}|860\\d{9}"
        guard phoneNumber.range(of: phoneNumberRegex, options: .regularExpression, range: nil, locale: nil) != nil else {
            return phoneNumber
        }
        
        var formattedPhoneNumber = ""
        var index = phoneNumber.startIndex

        // Append the area code in parentheses
        formattedPhoneNumber.append("(")
        formattedPhoneNumber.append(contentsOf: phoneNumber[index...phoneNumber.index(index, offsetBy: 2)])
        formattedPhoneNumber.append(") ")
        index = phoneNumber.index(index, offsetBy: 3)

        // Append the first three digits with a space
        formattedPhoneNumber.append(contentsOf: phoneNumber[index...phoneNumber.index(index, offsetBy: 2)])
        formattedPhoneNumber.append(" ")
        index = phoneNumber.index(index, offsetBy: 3)

        // Append the last four digits with a dash
        formattedPhoneNumber.append(contentsOf: phoneNumber[index...phoneNumber.index(index, offsetBy: 3)])
        index = phoneNumber.index(index, offsetBy: 4)

        // Append the final part of the number
        formattedPhoneNumber.append(contentsOf: phoneNumber[index...])
        return formattedPhoneNumber
    }
}
