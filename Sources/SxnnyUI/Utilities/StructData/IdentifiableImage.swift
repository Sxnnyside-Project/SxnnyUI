//
//  IdentifiableImage.swift
//  SxnnyUI
//
//  Created by Sxnnyside Project on 24/02/25.
//

import Foundation
import UIKit

/// A data model that encapsulates a `UIImage` with a unique identifier.
///
/// `IdentifiableImage` conforms to the `Identifiable` protocol, making it suitable for use in SwiftUI lists and other contexts that require uniquely identifiable items.
/// 
/// - Properties:
///   - `id`: A unique identifier (`UUID`) automatically generated for each image instance.
///   - `image`: The `UIImage` associated with this item.
///
/// - Usage:
///     Use `IdentifiableImage` to wrap images for use in collections or lists that require `Identifiable` conformance. This is especially helpful in SwiftUI views such as `List` or `ForEach`, where each image must have a unique identifier.
///
/// - Example:
///     ```swift
///     let img = UIImage(systemName: "star")!
///     let identifiable = IdentifiableImage(image: img)
///     print(identifiable.id) // Unique UUID
///     ```
public struct IdentifiableImage: Identifiable {
    /// A unique identifier for the image.
    public let id = UUID()
    /// The image associated with this instance.
    public let image: UIImage

    /// Initializes a new instance of `IdentifiableImage`.
    /// - Parameter image: The `UIImage` to associate with this instance.
    public init(image: UIImage) {
        self.image = image
    }
}
