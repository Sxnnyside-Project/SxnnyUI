//
//  Color.swift
//  SxnnyUI
//
//  Created by Sxnnyside Proyect on 21/01/25.
//

import SwiftUI

public extension Color {
    // MARK: - Initializers

    /// Creates a `Color` from a hexadecimal string (e.g., "#FF5733" or "FF5733").
    /// Supports optional leading "#" and requires a 6-character RGB hex.
    init(hex: String) {
        let cleaned = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var rgb: UInt64 = 0
        Scanner(string: cleaned).scanHexInt64(&rgb)
        
        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgb & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }

    /// Creates a `Color` from RGB values (0–255).
    init(rgb: (red: Double, green: Double, blue: Double)) {
        self.init(
            red: rgb.red / 255.0,
            green: rgb.green / 255.0,
            blue: rgb.blue / 255.0
        )
    }

    /// Creates a `Color` from RGBA values. RGB are in 0–255, alpha in 0–1.
    init(rgba: (red: Double, green: Double, blue: Double, alpha: Double)) {
        self.init(
            red: rgba.red / 255.0,
            green: rgba.green / 255.0,
            blue: rgba.blue / 255.0,
            opacity: rgba.alpha
        )
    }

    /// Creates a `Color` from CMYK values (0–1).
    init(cmyk: (cyan: Double, magenta: Double, yellow: Double, black: Double)) {
        let red = (1.0 - cmyk.cyan) * (1.0 - cmyk.black)
        let green = (1.0 - cmyk.magenta) * (1.0 - cmyk.black)
        let blue = (1.0 - cmyk.yellow) * (1.0 - cmyk.black)
        
        self.init(red: red, green: green, blue: blue)
    }

    // MARK: - Modifiers

    /// Returns a lighter version of the color by the given percentage (default: 30%).
    func lighter(by percentage: Double = 0.3) -> Color {
        return adjustBrightness(by: abs(percentage))
    }

    /// Returns a darker version of the color by the given percentage (default: 30%).
    func darker(by percentage: Double = 0.3) -> Color {
        return adjustBrightness(by: -abs(percentage))
    }

    /// Adjusts brightness up or down by the given percentage.
    private func adjustBrightness(by percentage: Double) -> Color {
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        UIColor(self).getRed(&r, green: &g, blue: &b, alpha: &a)

        let adjust = { (component: CGFloat) -> CGFloat in
            max(min(component + CGFloat(percentage), 1.0), 0.0)
        }

        return Color(
            red: Double(adjust(r)),
            green: Double(adjust(g)),
            blue: Double(adjust(b)),
            opacity: Double(a)
        )
    }
}
