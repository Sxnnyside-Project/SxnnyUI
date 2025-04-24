//
//  Toast.swift
//  SxnnyUI
//
//  Created by TI on 16/04/25.
//  Credits to Ondrej Kvasnovsky

public struct Toast: Equatable {
    var style: ToastStyle
    var message: String
    var duration: Double = 3
    var width: Double = .infinity
        
    public init(style: ToastStyle, message: String, duration: Double, width: Double) {
        self.style = style
        self.message = message
        self.duration = duration
        self.width = width
    }
    
    public init(style: ToastStyle, message: String) {
        self.style = style
        self.message = message
    }
}
