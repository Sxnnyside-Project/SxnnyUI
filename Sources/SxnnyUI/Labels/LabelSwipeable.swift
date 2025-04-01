//
//  LabelSwipeable.swift
//  SxnnyUI
//
//  Created by Sxnnyside Proyect on 21/01/25.
//


import SwiftUI

public struct LabelSwipeable<Content: View>: View {
    private let content: Content
    private let action: () -> Void
    
    @available(*, deprecated, message: "Use init(_ title: String, systemImage: String, action: @escaping () -> Void)")
    public init(icon: String, text: String, action: @escaping () -> Void) where Content == Label<Text, Image> {
        self.content = Label(text, systemImage: icon)
        self.action = action
    }
    public init(_ title: String, systemImage: String, action: @escaping () -> Void) where Content == Label<Text, Image> {
        self.content = Label(title, systemImage: systemImage)
        self.action = action
    }

    public init(action: @escaping () -> Void, @ViewBuilder content: () -> Content) {
        self.content = content()
        self.action = action
    }

    public var body: some View {
        content
            .swipeActions(
                edge: .leading,
                allowsFullSwipe: true
            ) {
                Button(action: action) {
                    Image(systemName: "plus.circle.fill")
                        .tint(.green)
                }
            }
    }
}

