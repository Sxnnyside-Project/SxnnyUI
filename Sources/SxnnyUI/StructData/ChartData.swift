//
//  ChartData.swift
//  SxnnyUI
//
//  Created by Sxnnyside Proyect on 21/01/25.
//

import Foundation

public struct ChartData: Identifiable {
    public let id = UUID()
    public let label: String
    public let value: Int

    public init(label: String, value: Int) {
        self.label = label
        self.value = value
    }
}
