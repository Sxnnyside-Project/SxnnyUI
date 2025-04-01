//
//  Color.swift
//  SxnnyUI
//
//  Created by Sxnnyside Proyect on 21/01/25.
//

import SwiftUI

extension Color {
    // Inicialización con valor hexadecimal
    public init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var rgbValue: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&rgbValue)
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        self.init(red: red, green: green, blue: blue)
    }

    // Inicialización con RGB
    public init(rgb: (red: Double, green: Double, blue: Double)) {
        self.init(red: rgb.red / 255.0, green: rgb.green / 255.0, blue: rgb.blue / 255.0)
    }

    // Inicialización con RGBA
    public init(rgba: (red: Double, green: Double, blue: Double, alpha: Double)) {
        self.init(red: rgba.red / 255.0, green: rgba.green / 255.0, blue: rgba.blue / 255.0, opacity: rgba.alpha)
    }

    // Inicialización con CMYK
    public init(cmyk: (cyan: Double, magenta: Double, yellow: Double, black: Double)) {
        let red = (1.0 - cmyk.cyan) * (1.0 - cmyk.black)
        let green = (1.0 - cmyk.magenta) * (1.0 - cmyk.black)
        let blue = (1.0 - cmyk.yellow) * (1.0 - cmyk.black)
        self.init(red: red, green: green, blue: blue)
    }
}
