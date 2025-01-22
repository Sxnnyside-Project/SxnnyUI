//
//  Badge.swift
//  SxnnyUI
//
//  Created by Sxnnyside Proyect on 21/01/25.
//


import SwiftUI

struct Badge: View {
    var count: Int?
    var imageName: String?

    var body: some View {
        ZStack {
            Circle()
                .fill(Color.red)
                .frame(width: 15, height: 15)

            if let count = count {
                Text("\(count)")
                    .foregroundColor(.white)
                    .font(.caption)
            } else if let imageName = imageName {
                Image(systemName: imageName)
                    .foregroundColor(.white)
                    .font(.caption)
            }
        }
        .offset(x: 10, y: -10)
    }
}

struct BadgeModifier: ViewModifier {
    var count: Int?
    var imageName: String?

    func body(content: Content) -> some View {
        ZStack(alignment: .topTrailing) {
            content
            if count != nil || imageName != nil {
                Badge(count: count, imageName: imageName)
            }
        }
    }
}

extension View {
    public func badge(count: Int? = nil, imageName: String? = nil) -> some View {
        self.modifier(BadgeModifier(count: count, imageName: imageName))
    }
}
