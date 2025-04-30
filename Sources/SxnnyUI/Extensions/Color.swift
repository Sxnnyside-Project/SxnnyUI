//
//  Color.swift
//  SxnnyUI
//
//  Created by Sxnnyside Proyect on 21/01/25.
//

import SwiftUI

extension Color {
    /// Initializes a `Color` instance using a hexadecimal string.
    /// - Parameter hex: A string representing the hexadecimal color value (e.g., `"#FF5733"` or `"FF5733"`).
    public init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var rgbValue: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&rgbValue)
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        self.init(red: red, green: green, blue: blue)
    }

    /// Initializes a `Color` instance using RGB values.
    /// - Parameter rgb: A tuple containing red, green, and blue values (0-255).
    public init(rgb: (red: Double, green: Double, blue: Double)) {
        self.init(red: rgb.red / 255.0, green: rgb.green / 255.0, blue: rgb.blue / 255.0)
    }

    /// Initializes a `Color` instance using RGBA values.
    /// - Parameter rgba: A tuple containing red, green, blue (0-255), and alpha (0-1) values.
    public init(rgba: (red: Double, green: Double, blue: Double, alpha: Double)) {
        self.init(red: rgba.red / 255.0, green: rgba.green / 255.0, blue: rgba.blue / 255.0, opacity: rgba.alpha)
    }

    /// Initializes a `Color` instance using CMYK values.
    /// - Parameter cmyk: A tuple containing cyan, magenta, yellow, and black values (0-1).
    public init(cmyk: (cyan: Double, magenta: Double, yellow: Double, black: Double)) {
        let red = (1.0 - cmyk.cyan) * (1.0 - cmyk.black)
        let green = (1.0 - cmyk.magenta) * (1.0 - cmyk.black)
        let blue = (1.0 - cmyk.yellow) * (1.0 - cmyk.black)
        self.init(red: red, green: green, blue: blue)
    }
}
