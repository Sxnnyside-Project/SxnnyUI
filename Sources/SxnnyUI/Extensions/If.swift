//
//  If.swift
//  SxnnyUI
//
//  Created by TI on 31/03/25.
//

import SwiftUI

extension View {
    public func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        condition ? AnyView(transform(self)) : AnyView(self)
    }
}
