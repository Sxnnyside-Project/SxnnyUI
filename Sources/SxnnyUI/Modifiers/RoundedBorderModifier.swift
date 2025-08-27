//
//  RoundedBorderModifier.swift
//  SxnnyUI
//
//  Created by Sxnnyside Project on 23/05/25.
//

import SwiftUI

/// A view modifier that adds a rounded rectangle border to the modified view.
///
/// The `RoundedBorderModifier` overlays the view with a `RoundedRectangle` stroke of the specified color, width, and corner radius,
/// and then applies the same corner radius to the content to ensure clipping and consistent appearance.
///
/// - Parameters:
///   - color: The color of the border. Defaults to `.blue`.
///   - width: The width of the border line. Defaults to `2`.
///   - radius: The corner radius of the border. Defaults to `8`.
///
/// - Example:
/// ```swift
/// Text("Example")
///     .modifier(RoundedBorderModifier(color: .red, width: 3, radius: 12))
///
///     // Or using the extension:
/// Text("Example")
///     .roundedBorder(color: .red, width: 3, radius: 12)
/// ```
///
/// This will display a `Text` view with a red border, 3 points wide, with 12-point corner radii.
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
