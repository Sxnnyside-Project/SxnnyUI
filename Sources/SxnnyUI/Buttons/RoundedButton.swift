//
//  RoundedButton.swift
//  SxnnyUI
//
//  Created by Sxnnyside Proyect on 21/01/25.
//


import SwiftUI

public struct RoundedButton: View {
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
            Label(label, systemImage: systemImage)
                .symbolRenderingMode(.hierarchical)
                .font(.title2)
                .frame(maxWidth: .infinity)
                .padding()
                .background(backgroundColor)
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
        }
        .disabled(disabled)
        .buttonStyle(.borderless)
        .padding(.bottom, 10)
    }
}
