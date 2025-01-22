//
//  LabeledIconButton.swift
//  SxnnyUI
//
//  Created by Sxnnyside Proyect on 21/01/25.
//


import SwiftUI

@available(iOS 16.0, *)
public struct LabeledIconButton: View {
    public let action: () -> Void
    public let iconName: String
    public let label: String
    public let footnote: String
    public let isSelected: Bool
    
    public init(action: @escaping () -> Void, iconName: String, label: String, footnote: String, isSelected: Bool) {
        self.action = action
        self.iconName = iconName
        self.label = label
        self.footnote = footnote
        self.isSelected = isSelected
    }
    
    public var body: some View {
        Button(action: action) {
            VStack(alignment: .center) {
                if let uiImage = UIImage(named: iconName) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 80)
                } else {
                    Image(systemName: iconName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .symbolRenderingMode(.hierarchical)
                        .frame(height: 80)
                }
                LabeledContent {
                    if #available(iOS 16.1, *) {
                        Text(footnote)
                            .fontDesign(.rounded)
                            .foregroundStyle(.gray)
                            .frame(maxWidth: .infinity, alignment: .center)
                    } else {
                        Text(footnote)
                            .foregroundStyle(.gray)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                } label: {
                    Text(label)
                        .font(.body)
                        .fontWeight(.black)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .multilineTextAlignment(.center)
                }.labeledContentStyle(.topLabeledStyle)
            }
            .foregroundStyle(.black)
        }
        .frame(maxWidth: 150, minHeight: 145, maxHeight: 170)
        .buttonStyle(.borderless)
        .background(isSelected ? .selectedButtonGradient : .buttonGradient)
        .cornerRadius(15)
        .shadow(color: .gray, radius: 5, x: 0, y: 5)
        .overlay(isSelected ? Image(systemName: "checkmark.circle").offset(x: 50, y: -50) : nil)
        .foregroundStyle(.white)
    }
}
