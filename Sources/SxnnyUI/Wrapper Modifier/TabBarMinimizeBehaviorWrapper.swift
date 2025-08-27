//
//  TabBarMinimizeBehaviorWrapper.swift
//  SxnnyUI
//
//  Created by TI on 27/08/25.
//

import SwiftUI

/// Wrapper modifier to conditionally apply .tabBarMinimizeBehavior(.onScrollDown) only on iOS 26+
struct TabBarMinimizeBehaviorWrapper: ViewModifier {
    func body(content: Content) -> some View {
        if #available(iOS 26.0, *) {
            content.tabBarMinimizeBehavior(.onScrollDown)
        } else {
            content
        }
    }
}

public extension View {
    func tabBarMinimizeBehaviorWrapper() -> some View {
        self.modifier(TabBarMinimizeBehaviorWrapper())
    }
}
