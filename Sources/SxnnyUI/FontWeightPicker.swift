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

public class FontWeightViewModel: ObservableObject {
    @Published public var selectedFontWeight: Font.Weight = .regular

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
