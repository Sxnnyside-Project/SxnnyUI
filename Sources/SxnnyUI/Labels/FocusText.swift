//
//  FocusText.swift
//  SxnnyUI
//
//  Created by Sxnnyside Proyect on 15/01/25.
//

import SwiftUI

@available(iOS 13.0, *)
public struct FocusText<Content: View>: View {
    let content: Content
    var backgroundColor: Color = .accentColor
    var cornerRadius: CGFloat = 10
    var shadowColor: Color = .gray
    var shadowRadius: CGFloat = 5
    var padding: CGFloat = 8

    public init(_ text: String) where Content == Text {
        self.content = Text(text)
    }
    
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    public var body: some View {
        content
            .padding(padding)
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
            .shadow(color: shadowColor, radius: shadowRadius, x: 0, y: 5)
    }
}

extension FocusText {
    public func backgroundColor(_ color: Color) -> FocusText {
        var copy = self
        copy.backgroundColor = color
        return copy
    }

    public func cornerRadius(_ radius: CGFloat) -> FocusText {
        var copy = self
        copy.cornerRadius = radius
        return copy
    }

    public func shadowColor(_ color: Color) -> FocusText {
        var copy = self
        copy.shadowColor = color
        return copy
    }

    public func shadowRadius(_ radius: CGFloat) -> FocusText {
        var copy = self
        copy.shadowRadius = radius
        return copy
    }

    public func padding(_ value: CGFloat) -> FocusText {
        var copy = self
        copy.padding = value
        return copy
    }
}
