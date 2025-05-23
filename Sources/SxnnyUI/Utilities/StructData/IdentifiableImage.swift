//
//  IdentifiableImage.swift
//  SxnnyUI
//
//  Created by TI on 24/02/25.
//

import Foundation
import UIKit

/// A data model representing an image with a unique identifier.
/// This struct conforms to the `Identifiable` protocol, making it suitable for use in SwiftUI lists and other identifiable contexts.
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
