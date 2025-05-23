//
//  SafeAreaBottomPadding.swift
//  SxnnyUI
//
//  Created by TI on 23/05/25.
//

import SwiftUICore

// Define la clave de entorno personalizada
private struct SafeAreaInsetsKey: EnvironmentKey {
    static let defaultValue: EdgeInsets = EdgeInsets()
}

extension EnvironmentValues {
    var safeAreaInsets: EdgeInsets {
        get { self[SafeAreaInsetsKey.self] }
        set { self[SafeAreaInsetsKey.self] = newValue }
    }
}

// Modificador que usa la clave de entorno
public struct SafeAreaBottomPadding: ViewModifier {
    @Environment(\.safeAreaInsets) private var insets: EdgeInsets
    
    public func body(content: Content) -> some View {
        content.padding(.bottom, insets.bottom)
    }
}

