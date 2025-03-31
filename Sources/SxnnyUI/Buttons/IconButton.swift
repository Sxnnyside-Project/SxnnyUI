//
//  IconButton.swift
//  SxnnyUI
//
//  Created by TI on 31/03/25.
//

import SwiftUI

public struct IconButton: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
    public let action: () -> Void
    public let iconName: String
    public let label: String
    public let additional: String
    public let contentMode: ContentMode = .fit
    public let isSelected: Bool
    
    public init(action: @escaping () -> Void, iconName: String, label: String, additional: String = "", isSelected: Bool, contentMode: ContentMode = .fit) {
        self.action = action
        self.iconName = iconName
        self.label = label
        self.additional = additional
        self.isSelected = isSelected
    }
    
    public var body: some View {
        let buttonWidth: CGFloat = horizontalSizeClass == .compact ? 150 : 400
        let buttonHeight: CGFloat = horizontalSizeClass == .compact ? 170 : 300
        let buttonMinHeight: CGFloat = horizontalSizeClass == .compact ? 145 : 200
        let iconSize: CGFloat = horizontalSizeClass == .compact ? 80 : 130
        let fontType: Font = horizontalSizeClass == .compact ? .body : .title
        
        Button(action: action) {
            VStack {
                if let uiImage = UIImage(named: iconName) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: contentMode)
                        .frame(height: iconSize)
                } else {
                    Image(systemName: iconName)
                        .resizable()
                        .aspectRatio(contentMode: contentMode)
                        .symbolRenderingMode(.hierarchical)
                        .frame(height: iconSize)
                }
                Text(label)
                    .font(fontType)
                    .fontWeight(.black)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.center)
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .foregroundStyle(.black)
        }
        .frame(maxWidth: buttonWidth, minHeight: buttonMinHeight, maxHeight: buttonHeight)
        .buttonStyle(.borderless)
        .background(isSelected ? .selectedButtonGradient : .buttonGradient)
        .cornerRadius(15)
        .shadow(color: .gray, radius: 5, x: 0, y: 5)
        .overlay(isSelected ? Image(systemName: "checkmark.circle").offset(x: 50, y: -50) : nil)
        .foregroundStyle(.white)
    }
}
