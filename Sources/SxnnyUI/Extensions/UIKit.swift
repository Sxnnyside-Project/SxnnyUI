//
//  UIKit.swift
//  SxnnyUI
//
//  Created by TI on 23/05/25.
//

import UIKit

public extension UIApplication {
    /// Método para cerrar teclado desde cualquier parte.
    func dismissKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

public extension UIDevice {
    /// Modelo de dispositivo legible.
    var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        return identifier
    }
}

