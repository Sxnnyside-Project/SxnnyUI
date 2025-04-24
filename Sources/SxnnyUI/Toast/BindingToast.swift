//
//  BindingToast.swift
//  SxnnyUI
//
//  Created by TI on 16/04/25.
//


import SwiftUI

extension View {

  public func toastView(toast: Binding<Toast?>) -> some View {
    self.modifier(ToastModifier(toast: toast))
  }
}
