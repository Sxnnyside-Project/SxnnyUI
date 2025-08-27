//
//  InspectionItem.swift
//  SxnnyUI
//
//  Created by Sxnnyside Project on 21/01/25.
//

import Foundation

/// A data model representing an item to be inspected.
/// This struct conforms to the `Identifiable` protocol, making it suitable for use in SwiftUI lists and other identifiable contexts.
/// Each `InspectionItem` can optionally contain an array of child `InspectionItem` objects, allowing for hierarchical structures.
/// A data model representing an item to be inspected in a hierarchical structure.
///
/// `InspectionItem` is typically used in list or tree-based user interfaces to represent inspectable entities.
/// It conforms to `Identifiable`, making it well-suited for use in SwiftUI lists and other views requiring unique identification.
///
/// Each item has a title and can optionally contain an array of child `InspectionItem` instances,
/// enabling the creation of nested, expandable lists or outlines.
///
/// Example usage:
/// ```swift
/// let root = InspectionItem(title: "Root", children: [
///     InspectionItem(title: "Child 1"),
///     InspectionItem(title: "Child 2", children: [
///         InspectionItem(title: "Grandchild 1")
///     ])
/// ])
/// ```
///
/// - Parameters:
///   - title: The title or label for this inspection item.
///   - children: Optionally, an array of child inspection items to support nesting (default: `nil`).
/// - Note: The `id` property provides a unique identifier for each instance.
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
