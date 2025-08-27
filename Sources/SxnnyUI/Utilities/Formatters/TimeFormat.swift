//
//  TimeFormat.swift
//  SxnnyUI
//
//  Created by Sxnnyside Project on 31/03/25.
//

import Foundation

/// `TimeFormat` is a utility struct for converting time intervals into user-friendly string representations.
/// 
/// This struct provides a set of static formatting functions that convert time values—
/// represented as integers or floating-point types—into formatted strings. These utilities
/// support common formats such as "mm:ss", "hh:mm:ss", "mm:ss.SSS", and "mm:ss.SSSnnnnnnnnn",
/// and accept times in seconds, milliseconds, or nanoseconds depending on the method used.
///
/// The supported formatting methods include:
/// - `formatTime`: Converts seconds to "mm:ss" format.
/// - `formatHourMinuteSecond`: Converts seconds to "hh:mm:ss" format.
/// - `formatTimeMillisecond`: Converts milliseconds to "mm:ss.SSS" format.
/// - `formatTimeNanosecond`: Converts nanoseconds to "mm:ss.SSSnnnnnnnnn" format.
///
/// Overloads are provided for both `BinaryInteger` and `BinaryFloatingPoint` types.
/// The resulting strings always pad numeric components to maintain a consistent width (e.g., zero-padded minutes and seconds).
///
/// Usage examples:
/// ```swift
/// let simple = TimeFormat.formatTime(125) // "02:05"
/// let detailed = TimeFormat.formatHourMinuteSecond(3661) // "01:01:01"
/// let ms = TimeFormat.formatTimeMillisecond(75432) // "01:15.432"
/// let ns = TimeFormat.formatTimeNanosecond(7543212345678) // "02:05.212345678"
/// ```
///
/// This utility is useful for displaying time intervals in UI components, logs, or any feature requiring human-readable time strings.
public struct TimeFormat {
    /// Formats a time interval into a string in "mm:ss" format.
    /// - Parameter timeInterval: The time interval to format, in seconds.
    /// - Returns: A string representation of the time in "mm:ss" format.
    public static func formatTime(_ timeInterval: TimeInterval) -> String {
        let totalSeconds = Int(timeInterval)
        let minutes = totalSeconds / 60
        let seconds = totalSeconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    /// Formats a time interval into a string in "mm:ss" format for integer types.
    /// - Parameter timeRemaining: The time interval to format, in seconds.
    /// - Returns: A string representation of the time in "mm:ss" format.
    public static func formatTime<T: BinaryInteger>(_ timeRemaining: T) -> String {
        let minutes = Int(timeRemaining) / 60
        let seconds = Int(timeRemaining) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
        
    /// Formats a time interval into a string in "mm:ss" format for floating-point types.
    /// - Parameter timeRemaining: The time interval to format, in seconds.
    /// - Returns: A string representation of the time in "mm:ss" format.
    public static func formatTime<T: BinaryFloatingPoint>(_ timeRemaining: T) -> String {
        let minutes = Int(timeRemaining) / 60
        let seconds = Int(timeRemaining) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    /// Formats a time interval into a string in "hh:mm:ss" format for integer types.
    /// - Parameter timeRemaining: The time interval to format, in seconds.
    /// - Returns: A string representation of the time in "hh:mm:ss" format.
    public static func formatHourMinuteSecond<T: BinaryInteger>(_ timeRemaining: T) -> String {
        let hours = Int(timeRemaining) / 3600
        let minutes = Int((Int(timeRemaining) % 3600) / 60)
        let seconds = Int((Int(timeRemaining) % 3600) % 60)
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    
    /// Formats a time interval into a string in "hh:mm:ss" format for floating-point types.
    /// - Parameter timeRemaining: The time interval to format, in seconds.
    /// - Returns: A string representation of the time in "hh:mm:ss" format.
    public static func formatHourMinuteSecond<T: BinaryFloatingPoint>(_ timeRemaining: T) -> String {
        let hours = Int(timeRemaining) / 3600
        let minutes = Int((Int(timeRemaining) % 3600) / 60)
        let seconds = Int((Int(timeRemaining) % 3600) % 60)
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    
    /// Formats a time interval into a string in "mm:ss.SSS" format for integer types.
    /// - Parameter timeRemaining: The time interval to format, in milliseconds.
    /// - Returns: A string representation of the time in "mm:ss.SSS" format.
    public static func formatTimeMillisecond<T: BinaryInteger>(_ timeRemaining: T) -> String {
        let minutes = Int(timeRemaining) / 60000
        let seconds = Int((Int(timeRemaining) % 60000) / 1000)
        let milliseconds = Int((Int(timeRemaining) % 60000) % 1000)
        return String(format: "%02d:%02d.%03d", minutes, seconds, milliseconds)
    }
    
    /// Formats a time interval into a string in "mm:ss.SSS" format for floating-point types.
    /// - Parameter timeRemaining: The time interval to format, in milliseconds.
    /// - Returns: A string representation of the time in "mm:ss.SSS" format.
    public static func formatTimeMillisecond<T: BinaryFloatingPoint>(_ timeRemaining: T) -> String {
        let minutes = Int(timeRemaining) / 60000
        let seconds = Int((Int(timeRemaining) % 60000) / 1000)
        let milliseconds = Int((Int(timeRemaining) % 60000) % 1000)
        return String(format: "%02d:%02d.%03d", minutes, seconds, milliseconds)
    }

    /// Formats a time interval into a string in "mm:ss.SSSnnnnnnnnn" format for integer types.
    /// - Parameter timeRemaining: The time interval to format, in nanoseconds.
    /// - Returns: A string representation of the time in "mm:ss.SSSnnnnnnnnn" format.
    public static func formatTimeNanosecond<T: BinaryInteger>(_ timeRemaining: T) -> String {
        let minutes = Int(timeRemaining) / 60000000000
        let seconds = Int((Int(timeRemaining) % 60000000000) / 1000000000)
        let milliseconds = Int((Int(timeRemaining) % 60000000000) % 1000000000)
        let nanoseconds = Int((Int(timeRemaining) % 60000000000) % 1000000000) % 1000
        return String(format: "%02d:%02d.%03d%09d", minutes, seconds, milliseconds, nanoseconds)
    }
    
    /// Formats a time interval into a string in "mm:ss.SSSnnnnnnnnn" format for floating-point types.
    /// - Parameter timeRemaining: The time interval to format, in nanoseconds.
    /// - Returns: A string representation of the time in "mm:ss.SSSnnnnnnnnn" format.
    public static func formatTimeNanosecond<T: BinaryFloatingPoint>(_ timeRemaining: T) -> String {
        let minutes = Int(timeRemaining) / 60000000000
        let seconds = Int((Int(timeRemaining) % 60000000000) / 1000000000)
        let milliseconds = Int((Int(timeRemaining) % 60000000000) % 1000000000)
        let nanoseconds = Int((Int(timeRemaining) % 60000000000) % 1000000000) % 1000
        return String(format: "%02d:%02d.%03d%09d", minutes, seconds, milliseconds, nanoseconds)
    }
}
