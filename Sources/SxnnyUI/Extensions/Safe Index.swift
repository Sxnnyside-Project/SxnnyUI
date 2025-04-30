//
//  Safe Index.swift
//  SxnnyUI
//
//  Created by Sxnnyside Proyect on 21/01/25.
//

/// An extension to safely access elements in a collection by index.
extension Collection {
    /// Safely retrieves the element at the specified index if it is within bounds, otherwise returns `nil`.
    /// - Parameter index: The index of the element to access.
    /// - Returns: The element at the specified index if it exists, or `nil` if the index is out of bounds.
    public subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
