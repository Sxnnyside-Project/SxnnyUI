//
//  IdentifiableImage.swift
//  SxnnyUI
//
//  Created by TI on 24/02/25.
//

import Foundation
import UIKit

public struct IdentifiableImage: Identifiable {
    public let id = UUID()
    public let image: UIImage
    
    public init(image: UIImage) {
        self.image = image
    }
}
