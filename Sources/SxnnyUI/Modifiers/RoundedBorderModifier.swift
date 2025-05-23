//
//  RoundedBorderModifier.swift
//  SxnnyUI
//
//  Created by TI on 23/05/25.
//

import SwiftUI

public struct RoundedBorderModifier: ViewModifier {
    let color: Color
    let width: CGFloat
    let radius: CGFloat

    public func body(content: Content) -> some View {
        content
            .overlay(
                RoundedRectangle(cornerRadius: radius)
                    .stroke(color, lineWidth: width)
            )
            .cornerRadius(radius)
    }
}

public extension View {
    func roundedBorder(color: Color = .blue, width: CGFloat = 2, radius: CGFloat = 8) -> some View {
        modifier(RoundedBorderModifier(color: color, width: width, radius: radius))
    }
}
