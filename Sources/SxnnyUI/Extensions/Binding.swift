//
//  Binding.swift
//  SxnnyUI
//
//  Created by TI on 14/08/25.
//

import SwiftUI

// MARK: - Conversión de Int <-> Double
extension Binding where Value == Int {
    /// Convierte Binding<Int> a Binding<Double>
    public var double: Binding<Double> {
        Binding<Double>(
            get: { Double(self.wrappedValue) },
            set: { self.wrappedValue = Int($0) }
        )
    }
}

// MARK: - Conversión de Double <-> Int
extension Binding where Value == Double {
    /// Convierte Binding<Double> a Binding<Int>
    public var int: Binding<Int> {
        Binding<Int>(
            get: { Int(self.wrappedValue) },
            set: { self.wrappedValue = Double($0) }
        )
    }
}

// MARK: - Clamped Binding
extension Binding where Value: Comparable {
    public func clamped(to limits: ClosedRange<Value>) -> Binding<Value> {
        Binding<Value>(
            get: { self.wrappedValue },
            set: { self.wrappedValue = Swift.min(Swift.max($0, limits.lowerBound), limits.upperBound) }
        )
    }
}

/// MARK: - Optional Binding con valor por defecto
extension Binding {
    public func replacingNil<T>(with defaultValue: T) -> Binding<T>
    where Value == Optional<T>, T: Sendable {
        Binding<T>(
            get: { self.wrappedValue ?? defaultValue },
            set: { self.wrappedValue = $0 }
        )
    }
}

// MARK: - Boolean toggle from any Comparable
extension Binding where Value: Comparable {
    /// Devuelve un Binding<Bool> que es true cuando el valor coincide con el objetivo
    public func isEqual(to target: Value) -> Binding<Bool> {
        Binding<Bool>(
            get: { self.wrappedValue == target },
            set: { $0 ? (self.wrappedValue = target) : () }
        )
    }
}
