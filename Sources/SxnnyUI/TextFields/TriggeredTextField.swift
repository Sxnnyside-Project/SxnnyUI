//
//  TriggeredTextField.swift
//  SxnnyUI
//
//  Created by Sxnnyside Proyect on 21/01/25.
//

import SwiftUI

public struct TriggeredTextField: UIViewRepresentable {
    public class Coordinator: NSObject, UITextFieldDelegate {
        var parent: TriggeredTextField
        
        init(parent: TriggeredTextField) {
            self.parent = parent
        }
        
        public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
    }
    
    @Binding public var text: String
    public var placeholder: String
    public var backgroundColor: UIColor
    
    public func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    public func makeUIView(context: Context) -> UITextField {
        let textField = UITextField(frame: .zero)
        textField.delegate = context.coordinator
        textField.keyboardType = .namePhonePad
        textField.placeholder = placeholder
        textField.backgroundColor = backgroundColor
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .words
        textField.returnKeyType = .done
        textField.addTarget(context.coordinator, action: #selector(Coordinator.textChanged(_:)), for: .editingChanged)
        return textField
    }
    
    public func updateUIView(_ uiView: UITextField, context: Context) {
        let capitalizedText = text.capitalized
        uiView.text = capitalizedText
        uiView.backgroundColor = backgroundColor
    }
    
    public init(text: Binding<String>, placeholder: String, backgroundColor: UIColor) {
        self._text = text
        self.placeholder = placeholder
        self.backgroundColor = backgroundColor
    }
}

public extension TriggeredTextField.Coordinator {
    @objc func textChanged(_ textField: UITextField) {
        parent.text = textField.text ?? ""
    }
}

