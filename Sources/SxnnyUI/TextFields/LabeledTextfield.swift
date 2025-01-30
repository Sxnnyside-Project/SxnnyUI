//
//  LabeledTextfield.swift
//  SxnnyUI
//
//  Created by Sxnnyside Proyect on 21/01/25.
//


import SwiftUI

public struct LabeledTextfield: View {
    public let text: String
    public let placeholder: String
    @Binding public var Disabled: Bool
    @Binding public var value: Double
    @FocusState.Binding public var isFocused: Bool
    
    public var body: some View {
        TextField(text, value: $value, formatter: FloatFormatter())
            .keyboardType(.decimalPad)
            .multilineTextAlignment(.leading)
            .padding(.trailing, 10)
            .textFieldStyle(.roundedBorder)
            .focused($isFocused)
            .disabled(Disabled)
            .disableAutocorrection(true)
            .overlay(
                HStack {
                    Spacer()
                    Text(placeholder)
                        .foregroundColor(.gray)
                        .padding(.trailing, 20)
                }
            )
    }
    
    public init(text: String, placeholder: String, Disabled: Binding<Bool>, value: Binding<Double>, isFocused: FocusState<Bool>.Binding) {
        self.text = text
        self.placeholder = placeholder
        self._Disabled = Disabled
        self._value = value
        self._isFocused = isFocused
    }
}
