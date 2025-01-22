//
//  FontWeightViewModel.swift
//  SxnnyUI
//
//  Created by Sxnnyside Proyect on 21/01/25.
//

import SwiftUI

public class FontWeightViewModel: ObservableObject {
    @Published public var selectedFontWeight: Font.Weight = .regular

    public init() {}
}

public struct FontWeightPicker: View {
    @ObservedObject public var fwViewModel: FontWeightViewModel

    public let fontWeights: [Font.Weight] = [.light, .regular, .bold]
    public let fontWeightIcons: [String] = ["textformat.size.smaller", "textformat.size", "textformat.size.larger"]

    public init(fwViewModel: FontWeightViewModel) {
        self.fwViewModel = fwViewModel
    }

    public var body: some View {
        Picker(selection: $fwViewModel.selectedFontWeight, label: Image(systemName: "textformat.size")) {
            ForEach(fontWeights.indices, id: \.self) { index in
                Image(systemName: fontWeightIcons[index])
                    .tag(fontWeights[index])
            }
        }.pickerStyle(.segmented)
    }
}
