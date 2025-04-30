//
//  DateFormat.swift
//  SxnnyUI
//
//  Created by Sxnnyside Proyect on 21/01/25.
//

import Foundation

/// A utility struct for formatting dates into various string representations.
public struct DateFormat {
    /// Formats a date into a flat string representation (e.g., "ddMMyyyyHHmmss").
    /// - Parameter date: The date to format.
    /// - Returns: A string representation of the date in "ddMMyyyyHHmmss" format.
    public static func formatDateFlat(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "ddMMyyyyHHmmss"
        return formatter.string(from: date)
    }
    
    /// Formats a date into a string with slashes (e.g., "dd/MM/yyyy").
    /// - Parameter date: The date to format.
    /// - Returns: A string representation of the date in "dd/MM/yyyy" format.
    public static func formatDateWithSlash(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: date)
    }

    /// Formats a date into a string with dashes (e.g., "dd-MM-yyyy").
    /// - Parameter date: The date to format.
    /// - Returns: A string representation of the date in "dd-MM-yyyy" format.
    public static func formatDateWithDash(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        return formatter.string(from: date)
    }
    
    /// Formats a date into a string with dashes and time (e.g., "dd-MM-yyyy HH:mm:ss").
    /// - Parameter date: The date to format.
    /// - Returns: A string representation of the date in "dd-MM-yyyy HH:mm:ss" format.
    public static func formatDateWithDashAndHour(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        return formatter.string(from: date)
    }
    
    /// Formats a date into a string with slashes and time (e.g., "dd/MM/yyyy HH:mm:ss").
    /// - Parameter date: The date to format.
    /// - Returns: A string representation of the date in "dd/MM/yyyy HH:mm:ss" format.
    public static func formatDateWithSlashAndHour(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        return formatter.string(from: date)
    }
    
    /// Formats a date into a string representing only the time (e.g., "HH:mm:ss").
    /// - Parameter date: The date to format.
    /// - Returns: A string representation of the time in "HH:mm:ss" format.
    public static func formatHour(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        return formatter.string(from: date)
    }
    
    /// Formats a date into a string representing only the year (e.g., "yyyy").
    /// - Parameter date: The date to format.
    /// - Returns: A string representation of the year in "yyyy" format.
    public static func formatDateYear(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        return formatter.string(from: date)
    }
    
    /// Formats a date into a string representing only the day (e.g., "dd").
    /// - Parameter date: The date to format.
    /// - Returns: A string representation of the day in "dd" format.
    public static func formatDateDay(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd"
        return formatter.string(from: date)
    }
    
    /// Formats a date into a string representing the month as a number (e.g., "MM").
    /// - Parameter date: The date to format.
    /// - Returns: A string representation of the month in "MM" format.
    public static func formatDateMonthNumber(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM"
        return formatter.string(from: date)
    }
    
    /// Formats a date into a string representing the short name of the month (e.g., "MMM").
    /// - Parameter date: The date to format.
    /// - Returns: A string representation of the month in "MMM" format.
    public static func formatDateMonthShort(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM"
        return formatter.string(from: date)
    }
    
    /// Formats a date into a string representing the full name of the month (e.g., "January").
    /// - Parameters:
    ///   - date: The date to format.
    ///   - locale: An optional locale to use for formatting. Defaults to the current locale.
    /// - Returns: A string representation of the month in full name format.
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
