//
//  Optional.swift
//  SxnnyUI
//
//  Created by TI on 23/05/25.
//

import Foundation

public extension Optional {
    /// Returns the unwrapped value if it exists, otherwise returns the provided default value.
    func or(_ defaultValue: Wrapped) -> Wrapped {
        self ?? defaultValue
    }
}
