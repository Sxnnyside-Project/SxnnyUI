//
//  Logger.swift
//  SxnnyUI
//
//  Created by Sxnnyside Proyect on 21/01/25.
//

import UIKit

/// Logger class to manage log generation with specific time intervals and group-based identifiers.
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
