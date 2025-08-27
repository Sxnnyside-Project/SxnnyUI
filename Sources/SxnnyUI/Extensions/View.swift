//
//  View.swift
//  SxnnyUI
//
//  Created by TI on 23/05/25.
//

import SwiftUI

public extension View {
    /// Hides the view with an optional animation.
    func hidden(_ isHidden: Bool, animation: Animation? = .easeInOut(duration: 0.3)) -> some View {
        modifier(HideModifier(isHidden: isHidden, animation: animation))
    }
    
    /// Applies a card style to the view with a specified corner radius and shadow radius.
    func cardStyle(cornerRadius: CGFloat = 12, shadowRadius: CGFloat = 6) -> some View {
        self
            .background(Color(.systemBackground))
            .cornerRadius(cornerRadius)
            .shadow(color: Color.black.opacity(0.15), radius: shadowRadius, x: 0, y: 4)
    }
    
    /// Animates the view based on a condition.
    func animated(if condition: Bool, animation: Animation = .easeInOut(duration: 0.3)) -> some View {
        self.animation(condition ? animation : nil, value: UUID())
    }
    
    /// Conditional overlays another view.
    @inlinable
    nonisolated public func overlayIf<V>(
        _ condition: Bool,
        alignment: Alignment = .center,
        @ViewBuilder content: () -> V
    ) -> some View where V: View {
        self.overlay(
            Group {
                if condition {
                    content()
                } else {
                    EmptyView()
                }
            },
            alignment: alignment
        )
    }
}

private struct HideModifier: ViewModifier {
    let isHidden: Bool
    let animation: Animation?

    func body(content: Content) -> some View {
        content
            .opacity(isHidden ? 0 : 1)
            .animation(animation, value: isHidden)
            .allowsHitTesting(!isHidden)
    }
}
