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

    public var body: some View {
        if alertManager.showAlert {
            VStack(spacing: 16) {
                HStack {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .foregroundColor(.yellow)
                    Text("Advertencia")
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
}
