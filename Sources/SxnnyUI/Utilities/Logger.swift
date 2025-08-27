//
//  Logger.swift
//  SxnnyUI
//
//  Created by Sxnnyside Project on 21/01/25.
//

import UIKit

/// # Logger
/// 
/// The `Logger` class provides a simple mechanism for throttling repeated log messages by identifier and time interval. 
/// It enables rate-limited logging so that a given message (or group of messages, by identifier) will only be printed 
/// once per interval (default: 60 seconds) unless reset. This helps prevent flooding the console or log output with 
/// repetitive log entries.
///
/// ## Features
/// - Logs messages to the console with throttling, based on a custom or default interval.
/// - Supports group-based identifiers (such as `[debug]`, `[error]`) for controlling throttling of different log types.
/// - Thread-safe through a private serial queue.
/// - Provides utility methods for resetting or clearing log timers for identifiers.
///
/// ## Usage
/// - Use `Logger.log(_:identifier:interval:)` to log a message with throttling.
/// - Use `Logger.resetTimer(for:)` to manually reset the throttling timer for a specific identifier.
/// - Use `Logger.clearAllTimers()` to clear all throttling timers.
///
/// ## Example
/// ```swift
/// Logger.log("This is a debug message.", identifier: "[debug]", interval: 30)
/// Logger.log("This will only appear once every 30 seconds per identifier.")
/// ```
///
/// ## Deprecations
/// - `Logger.log(_:)` is deprecated. Use `Logger.log(_:identifier:interval:)` for more control.
///
/// ## Thread Safety
/// - All log operations are serialized on a dedicated queue to ensure thread-safe access to shared timers.
///
/// ## Platform
/// - This logger is designed for use on Apple platforms and prints messages using `print()`.
public class Logger {
    /// Default log interval in seconds.
    public static let defaultLogInterval: TimeInterval = 60

    /// A dictionary to store the last log time for each identifier.
    nonisolated(unsafe) private static var lastLogTimes: [String: Date] = [:]

    /// A serial queue to ensure thread safety.
    private static let queue = DispatchQueue(label: "com.example.LoggerQueue")

    /// Logs a message with a specific identifier and interval.
    ///
    /// - Parameters:
    ///   - message: The message to log.
    ///   - identifier: The group identifier for the log (e.g., `[debug]`, `[error]`).
    ///   - interval: The time interval in seconds to throttle logs for this identifier. Defaults to `defaultLogInterval`.
    public static func log(_ message: String, identifier: String, interval: TimeInterval = defaultLogInterval) {
        queue.sync {
            let now = Date()
            let lastLogTime = lastLogTimes[identifier] ?? Date.distantPast

            if now.timeIntervalSince(lastLogTime) > interval {
                print("\(identifier) \(message)")
                lastLogTimes[identifier] = now
            }
        }
    }

    /// Logs a message with the default interval. **Deprecated**: Use `log(_:identifier:interval:)` instead.
    ///
    /// - Parameter message: The message to log.
    @available(*, deprecated, message: "Use log(_:identifier:interval:) instead.")
    public static func log(_ message: String) {
        log(message, identifier: "[default]")
    }

    /// Resets the timer for a specific identifier.
    ///
    /// - Parameter identifier: The group identifier whose timer should be reset.
    public static func resetTimer(for identifier: String) {
        queue.sync {
            lastLogTimes[identifier] = Date.distantPast
        }
    }

    /// Clears all timers for all identifiers.
    public static func clearAllTimers() {
        queue.sync {
            lastLogTimes.removeAll()
        }
    }
}
