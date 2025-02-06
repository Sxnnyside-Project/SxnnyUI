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
    
    public var build: String? {
        return object(forInfoDictionaryKey: kCFBundleVersionKey as String) as? String
    }
    
    public var swiftVersion: String? {
        return object(forInfoDictionaryKey: "SwiftVersion") as? String
    }
    
    public var appSize: String? {
        let appDirectory = URL(fileURLWithPath: Bundle.main.bundlePath)
        let appSize = appDirectory.directorySize
        return ByteCountFormatter.string(fromByteCount: appSize, countStyle: .file)
    }
}

extension URL {
    var directorySize: Int64 {
        var size: Int64 = 0
        if let enumerator = FileManager.default.enumerator(at: self, includingPropertiesForKeys: [.fileSizeKey], options: [], errorHandler: nil) {
            for case let fileURL as URL in enumerator {
                size += Int64((try? fileURL.resourceValues(forKeys: [.fileSizeKey]).fileSize ?? 0) ?? 0)
            }
        }
        return size
    }
}
