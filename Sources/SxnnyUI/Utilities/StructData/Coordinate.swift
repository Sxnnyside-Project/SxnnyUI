//
//  Coordinate.swift
//  SxnnyUI
//
//  Created by Sxnnyside Proyect on 21/01/25.
//

import Foundation

/// A data model representing a geographical coordinate with latitude and longitude.
/// This struct is generic to support different numeric types for latitude and longitude.
public struct Coordinate<T: Numeric & Comparable & Hashable>: Equatable, Hashable {
    /// The latitude of the coordinate.
    public let latitude: T
    /// The longitude of the coordinate.
    public let longitude: T

    /// Initializes a new instance of `Coordinate`.
    /// - Parameters:
    ///   - latitude: The latitude of the coordinate.
    ///   - longitude: The longitude of the coordinate.
    public init(latitude: T, longitude: T) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(latitude)
        hasher.combine(longitude)
    }
}
