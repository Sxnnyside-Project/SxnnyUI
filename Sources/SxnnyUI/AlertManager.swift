//
//  AlertManager.swift
//  SxnnyUI
//
//  Created by Sxnnyside Proyect on 21/01/25.
//

import SwiftUI
import Combine

/// Represents the state of an alert, including its visibility and message.
public struct AlertState {
    public var isShowing: Bool
    public var message: String
    public var type: AlertType

    public init(isShowing: Bool = false, message: String = "", type: AlertType = .info) {
        self.isShowing = isShowing
        self.message = message
        self.type = type
    }
}

// Enum representing different types of alerts.
public enum AlertType {
    case info
    case success
    case warning
    case error
}

/// Manages the state and behavior of alerts.
public final class AlertManager: ObservableObject {
    @Published private(set) var alertState: AlertState = AlertState()

    private let queue = DispatchQueue(label: "com.example.AlertManagerQueue")

    public init() {}

    /// Shows an alert with a specific message and type.
    ///
    /// - Parameters:
    ///   - message: The message to display in the alert.
    ///   - type: The type of the alert (e.g., `.info`, `.error`).
    public func showAlert(message: String, type: AlertType = .info) {
        queue.sync {
            alertState = AlertState(isShowing: true, message: message, type: type)
        }
    }
    
    /// Returns the current alert showing state.
    public func isShowing() -> Bool {
        queue.sync {
            return alertState.isShowing
        }
    }

    /// Dismisses the currently displayed alert.
    public func dismissAlert() {
        queue.sync {
            alertState = AlertState()
        }
    }
}

/// A customizable alert view for displaying messages with optional actions.
public struct AlertView: View {
    @ObservedObject public var alertManager: AlertManager
    @Environment(\.colorScheme) var colorScheme: ColorScheme

    private var title: String
    private var icon: String
    private var color: Color
    private var buttonLabel: String
    private var buttonAction: (() -> Void)?

    private var alertBackgroundColor: Color {
        return colorScheme == .dark ? .black : .white
    }

    public var body: some View {
        if alertManager.alertState.isShowing {
            VStack(spacing: 16) {
                HStack {
                    Image(systemName: icon)
                        .foregroundStyle(color)
                    Text(title)
                        .font(.headline)
                        .fontWeight(.bold)
                    Spacer()
                }

                ScrollView {
                    Text(alertManager.alertState.message)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }

                Button(buttonLabel) {
                    buttonAction?()
                    alertManager.dismissAlert()
                }
                .padding(.top, 10)
                .buttonStyle(.borderedProminent)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 15).fill(alertBackgroundColor.opacity(0.9)))
            .frame(maxWidth: 300)
            .padding()
            .accessibilityElement(children: .combine)
            .accessibilityLabel("\(title), \(alertManager.alertState.message)")
            .transition(.opacity)
            .animation(.easeInOut, value: alertManager.alertState.isShowing)
        }
    }

    /// Initializes the alert view with customizable options.
    ///
    /// - Parameters:
    ///   - title: The title of the alert.
    ///   - icon: The system image name for the alert icon.
    ///   - color: The color of the alert icon.
    ///   - buttonLabel: The label for the action button.
    ///   - buttonAction: The action to perform when the button is tapped.
    ///   - alertManager: The `AlertManager` instance managing the alert state.
    public init(
        title: String = "Alert",
        icon: String = "exclamationmark.triangle.fill",
        color: Color = .yellow,
        buttonLabel: String = "OK",
        buttonAction: (() -> Void)? = nil,
        alertManager: AlertManager
    ) {
        self.title = title
        self.icon = icon
        self.color = color
        self.buttonLabel = buttonLabel
        self.buttonAction = buttonAction
        self.alertManager = alertManager
    }
}

