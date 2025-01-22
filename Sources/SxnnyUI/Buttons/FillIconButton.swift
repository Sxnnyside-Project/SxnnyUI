//
//  FillIconButton.swift
//  SxnnyUI
//
//  Created by Sxnnyside Proyect on 21/01/25.
//

import SwiftUI

public struct FillIconButton: View {
    public let action: () -> Void
    public let iconName: String
    public let label: String
    public let isSelected: Bool
    
    public init(action: @escaping () -> Void, iconName: String, label: String, isSelected: Bool) {
        self.action = action
        self.iconName = iconName
        self.label = label
        self.isSelected = isSelected
    }
    
    public var body: some View {
        Button(action: action) {
            VStack {
                if let uiImage = UIImage(named: iconName) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 80)
                } else {
                    Image(systemName: iconName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .symbolRenderingMode(.hierarchical)
                        .frame(height: 80)
                }
                Text(label)
                    .font(.body)
                    .fontWeight(.black)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.center)
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
