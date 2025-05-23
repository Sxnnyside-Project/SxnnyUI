//
//  HideKeyboardModifier.swift
//  SxnnyUI
//
//  Created by Sxnnyside Proyect on 21/01/25.
//

import SwiftUI

/// A view modifier that hides the keyboard when tapping outside of input fields.
private struct HideKeyboardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .contentShape(Rectangle()) // Asegura que todo el contenido sea sensible al toque
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                                to: nil, from: nil, for: nil)
            }
    }
}

public extension View {
    /// Hides the keyboard when tapping outside of input fields.
    func hideKeyboardWhenTappedAround() -> some View {
        self.modifier(HideKeyboardModifier())
    }

    /// Hides the keyboard programmatically.
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil, from: nil, for: nil)
    }

    /// Detects when the keyboard appears or disappears and performs an action.
    func onKeyboardVisibilityChange(perform action: @Sendable @escaping (Bool) -> Void) -> some View {
        self.background(KeyboardVisibilityView(onChange: action))
    }
}

/// View that detects keyboard visibility changes.
private struct KeyboardVisibilityView: UIViewRepresentable {
    let onChange: @Sendable (Bool) -> Void

    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        let center = NotificationCenter.default

        center.addObserver(forName: UIResponder.keyboardWillShowNotification,
                           object: nil, queue: .main) { [onChange] _ in
            onChange(true)
        }

        center.addObserver(forName: UIResponder.keyboardWillHideNotification,
                           object: nil, queue: .main) { [onChange] _ in
            onChange(false)
        }

        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}
