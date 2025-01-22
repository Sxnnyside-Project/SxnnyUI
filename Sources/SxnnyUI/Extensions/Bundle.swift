//
//  Bundle.swift
//  SxnnyUI
//
//  Created by Sxnnyside Proyect on 21/01/25.
//

import Foundation

extension Bundle {
    public var displayName: String? {
        return object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
    }
    
    public var version: String? {
        return object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }
}
