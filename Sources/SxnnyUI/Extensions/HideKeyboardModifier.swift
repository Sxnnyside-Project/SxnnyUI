//
//  HideKeyboardModifier.swift
//  SxnnyUI
//
//  Created by Sxnnyside Proyect on 21/01/25.
//

import SwiftUI

/// A view modifier that hides the keyboard when tapping outside of a text field or other input view.
struct HideKeyboardModifier: ViewModifier {
    /// Modifies the content view to add a tap gesture that hides the keyboard.
    /// - Parameter content: The content view to modify.
    /// - Returns: A view with the tap gesture applied.
    func body(content: Content) -> some View {
        content
            .onTapGesture {
                hideKeyboard()
            }
    }
    
    /// Hides the keyboard by resigning the first responder status of the current input view.
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

extension View {
    /// Adds a modifier to the view that hides the keyboard when tapping outside of a text field or other input view.
    /// - Returns: A view with the `HideKeyboardModifier` applied.
    public func hideKeyboardWhenTappedAround() -> some View {
        self.modifier(HideKeyboardModifier())
    }
}
