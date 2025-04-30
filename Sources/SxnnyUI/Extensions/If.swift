//
//  If.swift
//  SxnnyUI
//
//  Created by TI on 31/03/25.
//

import SwiftUI

extension View {
    /// Conditionally applies a transformation to the view.
    /// - Parameters:
    ///   - condition: A Boolean value that determines whether the transformation is applied.
    ///   - transform: A closure that takes the current view as input and returns a transformed view.
    /// - Returns: Either the transformed view if the condition is `true`, or the original view if the condition is `false`.
    public func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        condition ? AnyView(transform(self)) : AnyView(self)
    }
}
