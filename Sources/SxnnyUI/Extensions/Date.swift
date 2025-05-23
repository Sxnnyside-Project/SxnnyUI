//
//  Date.swift
//  SxnnyUI
//
//  Created by TI on 23/05/25.
//

import Foundation

public extension Date {
    // MARK: - Static DateFormatter

    /// A cached formatter for the default format to improve performance.
    private static let defaultFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()

    // MARK: - Formatting

    /// Returns the date formatted as a string using the provided format.
    ///
    /// - Parameter format: A custom date format string. Defaults to `"yyyy-MM-dd HH:mm:ss"`.
    /// - Returns: A formatted date string.
    func formatted(_ format: String = "yyyy-MM-dd HH:mm:ss") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter.string(from: self)
    }

    /// Returns the date formatted using the default cached formatter (`"yyyy-MM-dd HH:mm:ss"`).
    func formattedWithDefault() -> String {
        return Self.defaultFormatter.string(from: self)
    }

    // MARK: - Date Comparisons

    /// Returns `true` if the date is today.
    var isToday: Bool {
        Calendar.current.isDateInToday(self)
    }

    /// Returns `true` if the date is yesterday.
    var isYesterday: Bool {
        Calendar.current.isDateInYesterday(self)
    }

    /// Returns `true` if the date is tomorrow.
    var isTomorrow: Bool {
        Calendar.current.isDateInTomorrow(self)
    }
    
    /// Returns if the date is in the past.
    var isInPast: Bool {
        self < Date()
    }
        
    /// Returns if the date is in the future.
    var isInFuture: Bool {
        self > Date()
    }

    // MARK: - Start & End of Day

    /// Returns the date representing the start of the day (00:00:00).
    var startOfDay: Date {
        Calendar.current.startOfDay(for: self)
    }

    /// Returns the date representing the end of the day (23:59:59.999).
    var endOfDay: Date {
        guard let end = Calendar.current.date(byAdding: DateComponents(day: 1, second: -1), to: startOfDay) else {
            return self
        }
        return end
    }

    // MARK: - Difference Calculations

    /// Returns the number of full days between another date and this one.
    ///
    /// - Parameter date: The date to compare to.
    /// - Returns: The number of full days between the two dates.
    func days(from date: Date) -> Int {
        Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
    }
}


