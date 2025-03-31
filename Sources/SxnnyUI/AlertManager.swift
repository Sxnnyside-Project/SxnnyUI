//
//  AlertManager.swift
//  SxnnyUI
//
//  Created by Sxnnyside Proyect on 21/01/25.
//

import SwiftUI
import Combine

/// Clase que se encarga de gestionar el control de alertas
public final class AlertManager: ObservableObject {
    @Published fileprivate var alertShowing: Bool = false
    @Published fileprivate var alertMessage: String = ""
    
    public var isAlertShowing: Bool {
        return alertShowing
    }

    public var currentAlertMessage: String {
        return alertMessage
    }
    
    public init() {}

    public func showAlert(message: String) {
        alertMessage = message
        alertShowing = true
    }

    public func dismissAlert() {
        alertMessage = ""
        alertShowing = false
    }
}

/// Vista de alerta que se encarga de mostrar un mensaje personalizable
public struct AlertView: View {
    @ObservedObject public var alertManager: AlertManager
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    private var title: String = "Advertencia"
    private var icon: String = "exclamationmark.triangle.fill"
    private var color: Color = .yellow
    private var alertColor: Color {
        return colorScheme == .dark ? .black : .white
    }
    
    public var body: some View {
        if alertManager.alertShowing {
            VStack(spacing: 16) {
                HStack {
                    Image(systemName: icon)
                        .foregroundStyle(color)
                    Text(title)
                        .font(.headline)
                        .fontWeight(.bold)
                    Spacer()
                }

                GroupBox {
                    Text(alertManager.alertMessage)
                }

                Button("OK") {
                    alertManager.dismissAlert()
                }
                .padding(.top, 10)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 15).fill(alertColor.opacity(0.9)))
            .frame(maxWidth: 300)
            .padding()
        }
    }
    
    /// Crea una instancia con los valores predeterminados
    /// - Parameter alertManager: Instancia de AlertManager
    public init(alertManager: AlertManager) {
        self.alertManager = alertManager
    }
    
    /// Crea una instancia con titulo personalizado
    /// - Parameters:
    ///   - title: Titulo de la alerta
    ///   - alertManager: Instancia de AlertManager
    public init(_ title: String, alertManager: AlertManager) {
        self.title = title
        self.alertManager = alertManager
    }
    
    /// Crea una instancia con color de icono personalizado
    /// - Parameters:
    ///   - color: Color del icono de la alerta
    ///   - alertManager: Instancia de AlertManager
    public init(_ color: Color, alertManager: AlertManager) {
        self.color = color
        self.alertManager = alertManager
    }
    
    /// Crea una instancia con titulo e color de icono personalizado
    /// - Parameters:
    ///   - title: Titulo de la alerta
    ///   - color: Color del icono de la alerta
    ///   - alertManager: Instancia de AlertManager
    public init(_ title: String, _ color: Color, alertManager: AlertManager) {
        self.title = title
        self.color = color
        self.alertManager = alertManager
    }
    
    /// Crea una instancia con titulo e icono personalizado
    /// - Parameters:
    ///   - icon: Icono de la alerta
    ///   - title: Titulo de la alerta
    ///   - alertManager: Instancia de AlertManager
    public init(_ title: String, _ icon: String, alertManager: AlertManager) {
        self.icon = icon
        self.title = title
        self.alertManager = alertManager
    }
    
    /// Crea una instancia con los valores personalizados
    /// - Parameters:
    ///   - title:Icono de la alerta
    ///   - icon: Titulo de la alerta
    ///   - color: Color del icono de la alerta
    ///   - alertManager: Instancia de AlertManager
    public init(_ title: String, _ icon: String, _ color: Color, alertManager: AlertManager) {
        self.icon = icon
        self.title = title
        self.color = color
        self.alertManager = alertManager
    }
}
