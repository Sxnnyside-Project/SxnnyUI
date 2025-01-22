//
//  InspectionItem.swift
//  SxnnyUI
//
//  Created by Sxnnyside Proyect on 21/01/25.
//

import Foundation

public struct InspectionItem: Identifiable {
    public let id = UUID()
    public let title: String
    public var children: [InspectionItem]?

    public init(title: String, children: [InspectionItem]? = nil) {
        self.title = title
        self.children = children
    }
}
