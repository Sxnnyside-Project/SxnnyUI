//
//  Safe Index.swift
//  SxnnyUI
//
//  Created by Sxnnyside Proyect on 21/01/25.
//

// MARK: - Collection Extensions

public extension Collection {
    
    /// Accesses an element at the specified index safely.
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }

    /// Returns a new array containing non-nil elements from the collection.
    func compacted<T>() -> [T] where Element == T? {
        compactMap { $0 }
    }

    /// Checks if the collection is not empty.
    var isNotEmpty: Bool {
        !isEmpty
    }

    /// Groups elements of the collection by a specified key.
    func grouped<Key: Hashable>(by keyForValue: (Element) -> Key) -> [Key: [Element]] {
        Dictionary(grouping: self, by: keyForValue)
    }

    /// Chunks the collection into smaller arrays of a specified size.
    func chunked(into size: Int) -> [[Element]] {
        guard size > 0 else { return [] }
        var chunks: [[Element]] = []
        var currentIndex = startIndex
        
        while currentIndex != endIndex {
            let nextIndex = index(currentIndex, offsetBy: size, limitedBy: endIndex) ?? endIndex
            chunks.append(Array(self[currentIndex..<nextIndex]))
            currentIndex = nextIndex
        }
        
        return chunks
    }
}
