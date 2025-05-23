//
//  ChartData.swift
//  SxnnyUI
//
//  Created by Sxnnyside Proyect on 21/01/25.
//

import Foundation

/// A data model representing a single data point in a chart.
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
