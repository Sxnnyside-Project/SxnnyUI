//
//  LabelSwipeable.swift
//  SxnnyUI
//
//  Created by Sxnnyside Proyect on 21/01/25.
//


import SwiftUI

public struct LabelSwipeable: View {
    public let icon: String
    public let text: String
    public let action: () -> Void
    
    public init(icon: String, text: String, action: @escaping () -> Void) {
        self.icon = icon
        self.text = text
        self.action = action
    }
    
    public var body: some View {
        Label(text, systemImage: icon)
            .swipeActions(
                edge: .leading,
                allowsFullSwipe: true,
                content: {
                    Button(action: action) {
                        Image(systemName: "plus.circle.fill").tint(.green)
                    }
                }
            )
    }
}
