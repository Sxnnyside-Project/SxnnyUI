//
//  TimeFormat.swift
//  SxnnyUI
//
//  Created by TI on 31/03/25.
//

import Foundation

/// A utility struct for formatting time intervals into various string representations.
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
