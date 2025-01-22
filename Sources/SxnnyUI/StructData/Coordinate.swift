//
//  Coordinate.swift
//  SxnnyUI
//
//  Created by Sxnnyside Proyect on 21/01/25.
//


import Foundation

public struct Coordinate: Equatable, Hashable {
    public let latitude: Float
    public let longitude: Float

    public init(latitude: Float, longitude: Float) {
        self.latitude = latitude
        self.longitude = longitude
    }
}
