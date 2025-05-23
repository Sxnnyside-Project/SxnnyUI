//
//  Array.swift
//  SxnnyUI
//
//  Created by TI on 23/05/25.
//

import Foundation

public extension Array {
    /// Retorna un elemento aleatorio seguro (sin crash si está vacío)
    var safeRandomElement: Element? {
        isEmpty ? nil : self.randomElement()
    }
    
    /// Retorna un array sin elementos duplicados (solo para elementos Hashable)
    func unique<T: Hashable>(by keyPath: KeyPath<Element, T>) -> [Element] {
        var seen = Set<T>()
        return filter { seen.insert($0[keyPath: keyPath]).inserted }
    }
}
