//
//  DateFormat.swift
//  SxnnyUI
//
//  Created by Sxnnyside Proyect on 21/01/25.
//

import Foundation

public struct DateFormat {
    public static func formatDateWithSlash(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: date)
    }

    public static func formatDateWithDash(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        return formatter.string(from: date)
    }
    
    public static func formatDateWithDashAndHour(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        return formatter.string(from: date)
    }
    
    public static func formatDateWithSlashAndHour(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        return formatter.string(from: date)
    }
    
    public static func formatHour(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        return formatter.string(from: date)
    }
    
    public static func formatDateYear(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        return formatter.string(from: date)
    }
    
    public static func formatDateDay(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd"
        return formatter.string(from: date)
    }
    
    public static func formatDateMonthNumber(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM"
        return formatter.string(from: date)
    }
    
    public static func formatDateMonthShort(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM"
        return formatter.string(from: date)
    }
    
    public static func formatDateMonthLarge(date: Date, locale: Locale? = nil) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.locale = locale
        
        let formattedDate = formatter.string(from: date)
        
        var components = formattedDate.components(separatedBy: " ")
        if components.count > 2 {
            components[2] = components[2].prefix(1).capitalized + components[2].dropFirst().lowercased()
        }
        
        return components.joined(separator: " ")
    }
}
