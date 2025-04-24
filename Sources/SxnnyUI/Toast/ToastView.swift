//
//  ToastView.swift
//  SxnnyUI
//
//  Created by TI on 16/04/25.
//  Credits to Ondrej Kvasnovsky


import SwiftUI

public struct ToastView: View {
      var style: ToastStyle
      var message: String
      var width = CGFloat.infinity
      var onCancelTapped: (() -> Void)
      
      public var body: some View {
        HStack(alignment: .center, spacing: 12) {
          Image(systemName: style.iconFileName)
            .foregroundColor(style.themeColor)
          Text(message)
                .font(Font.callout)
                .fontWeight(.black)
                .foregroundColor(.black)
          
          Spacer(minLength: 10)
          
          Button {
            onCancelTapped()
          } label: {
            Image(systemName: "xmark")
              .foregroundColor(style.themeColor)
          }
        }
        .padding()
        .frame(minWidth: 0, maxWidth: width)
        .background(Color.white)
        .cornerRadius(8)
        .overlay(
          RoundedRectangle(cornerRadius: 8)
            .opacity(0.6)
            .background(style.themeColor.opacity(0.2))
        )
        .padding(.horizontal, 16)
      }
}
