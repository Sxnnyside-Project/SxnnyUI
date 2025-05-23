//
//  SxnnyGrid.swift
//  SxnnyUI
//
//  Created by TI on 23/05/25.
//

import SwiftUI

public struct SxnnyGrid<Content: View>: View {
    private let columns: [GridItem]
    private let content: () -> Content

    public init(
        columns: [GridItem],
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.columns = columns
        self.content = content
    }

    public var body: some View {
        LazyVGrid(columns: columns, spacing: SxnnyTheme.defaultSpacing) {
            content()
        }
    }
}
