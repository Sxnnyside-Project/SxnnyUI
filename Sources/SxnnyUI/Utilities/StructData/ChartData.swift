//
//  ChartData.swift
//  SxnnyUI
//
//  Created by Sxnnyside Project on 21/01/25.
//

import Foundation

/// A data model representing a single data point in a chart.
///
/// The `ChartData` struct encapsulates the essential components of a chart entry,
/// including a label that describes the data point and a value representing its magnitude.
/// Each instance is uniquely identified by a generated UUID, enabling use in
/// collections that require identity, such as SwiftUI lists or charts.
///
/// Typical use cases include presenting chart information in user interfaces,
/// analytics dashboards, or any context where labeled numerical data is visualized.
public struct ChartData: Identifiable {
    /// A unique identifier for the chart data.
    public let id = UUID()
    /// The label associated with the data point.
    public let label: String
    /// The value of the data point.
    public let value: Int

    /// Initializes a new instance of `ChartData`.
    /// - Parameters:
    ///   - label: The label associated with the data point.
    ///   - value: The value of the data point.
    public init(label: String, value: Int) {
        self.label = label
        self.value = value
    }
}
