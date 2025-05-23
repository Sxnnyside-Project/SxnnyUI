//
//  InspectionItem.swift
//  SxnnyUI
//
//  Created by Sxnnyside Proyect on 21/01/25.
//

import Foundation

/// A data model representing an item to be inspected.
/// This struct conforms to the `Identifiable` protocol, making it suitable for use in SwiftUI lists and other identifiable contexts.
/// Each `InspectionItem` can optionally contain an array of child `InspectionItem` objects, allowing for hierarchical structures.
public struct InspectionItem: Identifiable {
    /// A unique identifier for the inspection item.
    public let id = UUID()
    /// The title of the inspection item.
    public let title: String
    /// An optional array of child inspection items, enabling nested structures.
    public var children: [InspectionItem]?

    /// Initializes a new instance of `InspectionItem`.
    /// - Parameters:
    ///   - title: The title of the inspection item.
    ///   - children: An optional array of child `InspectionItem` objects. Defaults to `nil`.
    public init(title: String, children: [InspectionItem]? = nil) {
        self.title = title
        self.children = children
    }
}
