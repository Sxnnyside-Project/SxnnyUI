//
//  HideKeyboardModifier.swift
//  SxnnyUI
//
//  Created by Sxnnyside Project on 21/01/25.
//

import SwiftUI

/// A view modifier that hides the keyboard when tapping outside of input fields.
/// A SwiftUI view modifier that enables dismissal of the keyboard when the user taps
/// anywhere outside of a text input field. This is especially useful in forms or other
/// user interfaces containing text fields where the keyboard might otherwise remain visible
/// and block content. The modifier sets a content shape over the view hierarchy to ensure
/// all space is tappable, then sends a resignFirstResponder action to dismiss the keyboard
/// when a tap is detected.
///
/// Usage:
///     .modifier(HideKeyboardModifier())
/// or, more idiomatically in SwiftUI,
///     .hideKeyboardWhenTappedAround()
///
/// - Note: This modifier is only effective on platforms where `UIApplication`
///   and `UIResponder` are available (i.e., iOS, iPadOS, and visionOS).
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

/// A SwiftUI-compatible view that enables observation of keyboard visibility changes on platforms
/// supporting UIKit (iOS, iPadOS, visionOS).
///
/// `KeyboardVisibilityView` is an invisible `UIViewRepresentable` used internally as a background
/// in SwiftUI to listen for keyboard show and hide notifications. When the keyboard appears or
/// disappears, the provided closure (`onChange`) is called with a Boolean indicating the new
/// visibility state.
///
/// - Usage: Typically, you do not use `KeyboardVisibilityView` directly. Instead, call the
///   `.onKeyboardVisibilityChange { isVisible in ... }` view modifier on your SwiftUI view,
///   which will install this representable behind the scenes.
///
/// - Parameters:
///   - onChange: A closure that receives a `Bool` whenever the keyboard appears (`true`)
///     or disappears (`false`). Use this closure to update state or perform side effects in
///     response to keyboard events.
///
/// - Note: This view should only be used on platforms where `UIViewRepresentable`,
///   `UIResponder.keyboardWillShowNotification`, and `UIResponder.keyboardWillHideNotification`
///   are available. On unsupported platforms, this view has no effect.
///
/// Example:
/// ```swift
/// .onKeyboardVisibilityChange { isVisible in
///     print("Keyboard is now \(isVisible ? "visible" : "hidden")")
/// }
/// ```
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


public extension View {
    /// Hides the keyboard when tapping outside of input fields.
    ///
    /// Applies a view modifier that adds a transparent tap gesture to the entire view hierarchy,
    /// so that tapping anywhere outside of input fields will dismiss the keyboard. This is useful
    /// in forms or screens with text inputs to prevent the keyboard from blocking content after editing.
    ///
    /// - Returns: A view that dismisses the keyboard when tapped outside of input fields.
    ///
    /// - Note: This modifier takes effect only on platforms where `UIApplication` and `UIResponder`
    ///   are available (iOS, iPadOS, visionOS). On unsupported platforms, it has no effect.
    func hideKeyboardWhenTappedAround() -> some View {
        self.modifier(HideKeyboardModifier())
    }

    /// Hides the keyboard programmatically.
    /// Programmatically dismisses the keyboard if it is currently displayed.
    ///
    /// This method sends a resignFirstResponder action to the current first responder, causing any active
    /// text input field to relinquish focus and the keyboard to be dismissed. It is useful for triggering
    /// keyboard dismissal in response to custom events, such as a button tap.
    ///
    /// - Note: This method is only effective on platforms where `UIApplication` and `UIResponder`
    ///   are available (i.e., iOS, iPadOS, and visionOS). On other platforms, this method has no effect.
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil, from: nil, for: nil)
    }

    /// Adds an action to perform when the keyboard appears or disappears.
    ///
    /// This view modifier allows you to observe changes in keyboard visibility and perform custom actions in response.
    /// The provided closure is called with a Boolean value indicating whether the keyboard is visible (`true`) or hidden (`false`).
    ///
    /// - Parameter action: A closure that is called with a Boolean argument whenever the keyboard appears (`true`) or disappears (`false`).
    /// - Returns: A view that triggers the action when the keyboard visibility changes.
    func onKeyboardVisibilityChange(perform action: @Sendable @escaping (Bool) -> Void) -> some View {
        self.background(KeyboardVisibilityView(onChange: action))
    }
}
