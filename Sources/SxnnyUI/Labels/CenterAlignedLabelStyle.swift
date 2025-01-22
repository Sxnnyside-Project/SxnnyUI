//
//  CenterAlignedLabelStyle.swift
//  SxnnyUI
//
//  Created by Sxnnyside Proyect on 21/01/25.
//

import SwiftUI

public struct CenterAlignedLabelStyle: LabelStyle {
    @Environment(\.sizeCategory) var size
    
    public func makeBody(configuration: Configuration) -> some View {
        HStack {
            if size >= .accessibilityMedium {
                configuration.icon
                    .frame(width: 80)
            } else {
                configuration.icon
                    .frame(width: 30)
            }
            configuration.title
        }
    }
}

extension LabelStyle where Self == CenterAlignedLabelStyle {
    public static var centerAligned: CenterAlignedLabelStyle { CenterAlignedLabelStyle() }
}
