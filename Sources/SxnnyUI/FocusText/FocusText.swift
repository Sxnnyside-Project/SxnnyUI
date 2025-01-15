//
//  FocusText.swift
//  SxnnyUI
//
//  Created by TI on 15/01/25.
//

import SwiftUI

@available(iOS 15.0, *)
public struct FocusText: View {
    let text: String
    var font: Font
    var backgroundColor: Color
    var textColor: Color
    var cornerRadius: CGFloat
    var shadowColor: Color
    var shadowRadius: CGFloat
    var padding: Edge.Set

    public init(
        _ text: String,
        font: Font = .system(.body, design: .serif),
        backgroundColor: Color = .blue,
        textColor: Color = .white,
        cornerRadius: CGFloat = 10,
        shadowColor: Color = .gray,
        shadowRadius: CGFloat = 5,
        padding: Edge.Set = [.horizontal, .vertical]
    ) {
        self.text = text
        self.font = font
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.cornerRadius = cornerRadius
        self.shadowColor = shadowColor
        self.shadowRadius = shadowRadius
        self.padding = padding
    }

    public var body: some View {
        Text(text)
            .font(font)
            .foregroundColor(textColor)
            .padding(padding, 8)
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
            .multilineTextAlignment(.trailing)
            .shadow(color: shadowColor, radius: shadowRadius, x: 0, y: 5)
    }
    
    public func background(_ color: Color) -> FocusText {
        var copy = self
        copy.backgroundColor = color
        return copy
    }
    
    public func foreground(_ color: Color) -> FocusText {
        var copy = self
        copy.textColor = color
        return copy
    }
    
    public func cornerRadius(_ radius: CGFloat) -> FocusText {
        var copy = self
        copy.cornerRadius = radius
        return copy
    }
    
    public func shadow(color: Color, radius: CGFloat) -> FocusText {
        var copy = self
        copy.shadowColor = color
        copy.shadowRadius = radius
        return copy
    }
    
    public func padding(_ edge: Edge.Set) -> FocusText {
        var copy = self
        copy.padding = edge
        return copy
    }
}
