//
//  AlertManager.swift
//  SxnnyUI
//
//  Created by Sxnnyside Proyect on 21/01/25.
//

import SwiftUI
import Combine

public class AlertManager: ObservableObject {
    @Published public var showAlert: Bool = false
    @Published public var alertMessage: String = ""
    
    public func showAlert(message: String) {
        alertMessage = message
        showAlert.toggle()
    }
    
    public init() {}
}

public struct AlertView: View {
    @ObservedObject public var alertManager: AlertManager
    private var title: String = "Advertencia"
    private var color: Color = .yellow

    public var body: some View {
        if alertManager.showAlert {
            VStack(spacing: 16) {
                HStack {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .foregroundColor(color)
                    Text(title)
                        .font(.headline)
                        .fontWeight(.bold)
                    Spacer()
                }

                GroupBox {
                    Text(alertManager.alertMessage)
                }

                Button("OK") {
                    alertManager.showAlert = false
                }
                .padding(.top, 10)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 15)
                .fill(Color.white.opacity(0.9)))
            .frame(maxWidth: 300)
            .padding()
        }
    }
    
    public init(alertManager: AlertManager) {
        self.alertManager = alertManager
    }
    
    public init(_ title: String, alertManager: AlertManager) {
        self.title = title
        self.alertManager = alertManager
    }
    
    public init(_ title: String, _ color: Color, alertManager: AlertManager) {
        self.title = title
        self.color = color
        self.alertManager = alertManager
    }
}
