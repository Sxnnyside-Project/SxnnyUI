//
//  ShadowedRoundedButton.swift
//  SxnnyUI
//
//  Created by Sxnnyside Proyect on 21/01/25.
//


import SwiftUI

public struct ShadowedRoundedButton: View {
    public let label: String
    public let systemImage: String
    public let backgroundColor: Color
    public let action: () -> Void
    public let disabled: Bool

    public init(label: String, systemImage: String, backgroundColor: Color, action: @escaping () -> Void, disabled: Bool = false) {
        self.label = label
        self.systemImage = systemImage
        self.backgroundColor = backgroundColor
        self.action = action
        self.disabled = disabled
    }
    
    public var body: some View {
        Button(action: action) {
            if #available(iOS 16.0, *) {
                Label(label, systemImage: systemImage)
                    .symbolRenderingMode(.hierarchical)
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(disabled ? Color.gray : backgroundColor)
                    .cornerRadius(10)
                    .shadow(color: .gray, radius: 5, x: 0, y: 5)
                    .padding(.horizontal)
            } else {
                Label(label, systemImage: systemImage)
                    .symbolRenderingMode(.hierarchical)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(disabled ? Color.gray : backgroundColor)
                    .cornerRadius(10)
                    .shadow(color: .gray, radius: 5, x: 0, y: 5)
                    .padding(.horizontal)
            }
        }
        .disabled(disabled)
        .buttonStyle(.borderless)
    }
}
