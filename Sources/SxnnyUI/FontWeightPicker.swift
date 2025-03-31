//
//  FontWeightViewModel.swift
//  SxnnyUI
//
//  Created by Sxnnyside Proyect on 21/01/25.
//

import SwiftUI

public enum FontWeightPickerStyle {
    case menu
    case wheel
    case navigationLink
    case segmented
    case inline
    case palette
}

public enum FontWeightOptions: CaseIterable {
    case ultralight, thin, light, regular, medium, semibold, bold, heavy, black

    public var fontWeight: Font.Weight {
        switch self {
        case .ultralight: return .ultraLight
        case .thin: return .thin
        case .light: return .light
        case .regular: return .regular
        case .medium: return .medium
        case .semibold: return .semibold
        case .bold: return .bold
        case .heavy: return .heavy
        case .black: return .black
        }
    }
}

public class FontWeightViewModel: ObservableObject {
    @Published public var selectedFontWeight: Font.Weight = .regular
    @Published public var selected: FontWeightOptions = .regular

    public init() {}
}

public struct FontWeightPicker: View {
    @ObservedObject private var fwViewModel: FontWeightViewModel
    
    private let fontWeights: [Font.Weight] = [.light, .regular, .bold]
    private let fontWeightIcons: [String] = ["textformat.size.smaller", "textformat.size", "textformat.size.larger"]
    
    public init(fwViewModel: FontWeightViewModel) {
        self.fwViewModel = fwViewModel
    }
    
    public var body: some View {
        Picker(selection: $fwViewModel.selectedFontWeight, label: Image(systemName: "textformat.size")) {
            ForEach(fontWeights.indices, id: \.self) { index in
                Image(systemName: fontWeightIcons[index])
                    .tag(fontWeights[index])
            }
        }
    }
}

public struct LimitedFontWeights {
    private let values: [FontWeightOptions]

    public init(_ values: [FontWeightOptions]) {
        precondition(values.count == 3 || values.count == 5, "FontWeights must have exactly 3 or 5 elements.")
        self.values = values
    }

    public var weights: [FontWeightOptions] {
        values
    }
}

public struct FontWeightPickerCustom: View {
    @ObservedObject private var fwViewModel: FontWeightViewModel
    private let fontWeights: LimitedFontWeights
    private let fontWeightIcons: [String]

    public init(
        fwViewModel: FontWeightViewModel,
        fontWeights: LimitedFontWeights = LimitedFontWeights([.light, .regular, .bold]),
        fontWeightIcons: [String] = ["textformat.size.smaller", "textformat.size", "textformat.size.larger"]
    ) {
        guard fontWeightIcons.count == fontWeights.weights.count else {
            fatalError("fontWeightIcons array must match the number of fontWeights.")
        }

        self.fwViewModel = fwViewModel
        self.fontWeights = fontWeights
        self.fontWeightIcons = fontWeightIcons
    }

    public var body: some View {
        Picker(selection: $fwViewModel.selected, label: Text("Font Weight")) {
            ForEach(fontWeights.weights.indices, id: \.self) { index in
                Image(systemName: fontWeightIcons[index])
                    .tag(fontWeights.weights[index])
            }
        }
    }
}

public struct FontWeightPickerStyleModifier: ViewModifier {
    public let style: FontWeightPickerStyle
    
    public func body(content: Content) -> some View {
        switch style {
        case .menu:
            content.pickerStyle(MenuPickerStyle())
        case .wheel:
            content.pickerStyle(WheelPickerStyle())
        case .navigationLink:
            if #available(iOS 16.0, *) {
                content.pickerStyle(NavigationLinkPickerStyle())
            }
        case .segmented:
            content.pickerStyle(SegmentedPickerStyle())
        case .inline:
            content.pickerStyle(InlinePickerStyle())
        case .palette:
            if #available(iOS 17.0, *) {
                content.pickerStyle(PalettePickerStyle())
            }
        }
    }
}

extension View {
    public func fontWeightPickerStyle(_ style: FontWeightPickerStyle) -> some View {
        self.modifier(FontWeightPickerStyleModifier(style: style))
    }
}
