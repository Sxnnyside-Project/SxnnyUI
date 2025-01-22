//
//  Logger.swift
//  SxnnyUI
//
//  Created by Sxnnyside Proyect on 21/01/25.
//

import UIKit

/// Clase Logger para gestionar la generación de logs con un intervalo de tiempo específico.
public class Logger {
    private static let logInterval: TimeInterval = 60 // Cada 60 segundos
    nonisolated(unsafe) private static var lastLogTime: Date = Date.distantPast
    private static let queue = DispatchQueue(label: "com.example.LoggerQueue")

    /// Registra un mensaje en la consola si ha pasado el intervalo de tiempo especificado desde el último log.
    /// - Parameter message: El mensaje que se va a registrar.
    public static func log(_ message: String) {
        queue.sync {
            let now = Date()
            if now.timeIntervalSince(lastLogTime) > logInterval {
                print(message)
                lastLogTime = now
            }
        }
    }
}
