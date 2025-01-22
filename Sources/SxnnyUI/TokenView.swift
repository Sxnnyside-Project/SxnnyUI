//
//  TokenView.swift
//  SxnnyUI
//
//  Created by Sxnnyside Proyect on 21/01/25.
//

import SwiftUI

/// Vista para representar un token con una `Badge` para eliminarlo.
public struct TokenView: View {
    public var token: Token
    public var onDelete: (Token) -> Void

    public init(token: Token, onDelete: @escaping (Token) -> Void) {
        self.token = token
        self.onDelete = onDelete
    }

    public var body: some View {
        HStack {
            Text(token.text)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(Color.blue.opacity(0.2))
                .cornerRadius(8)
                .badge(imageName: "xmark")
                .onTapGesture {
                    onDelete(token)
                }
        }
    }
}
