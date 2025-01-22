//
//  TopLabeledStyleConfig.swift
//  SxnnyUI
//
//  Created by Sxnnyside Proyect on 21/01/25.
//


import SwiftUI

public struct TopLabeledStyleConfig: LabeledContentStyle {
    
   public func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            configuration.label
                .font(.caption)
            configuration.content
        }
    }
}

@available(iOS 16.0, *)
extension LabeledContentStyle where Self == TopLabeledStyleConfig {
    public static var topLabeledStyle: TopLabeledStyleConfig { TopLabeledStyleConfig() }
}
