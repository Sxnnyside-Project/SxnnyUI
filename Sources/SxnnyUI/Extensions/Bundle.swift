//
//  Bundle.swift
//  SxnnyUI
//
//  Created by Sxnnyside Proyect on 21/01/25.
//

import Foundation

extension Bundle {
    /// The display name of the app, as defined in the `CFBundleDisplayName` key of the Info.plist.
    public var displayName: String? {
        return object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
    }
    
    /// The version of the app, as defined in the `CFBundleShortVersionString` key of the Info.plist.
    public var version: String? {
        return object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }
    
    /// The build number of the app, as defined in the `CFBundleVersion` key of the Info.plist.
    public var build: String? {
        return object(forInfoDictionaryKey: kCFBundleVersionKey as String) as? String
    }
    
    /// The Swift version used in the app, as defined in the `SwiftVersion` key of the Info.plist.
    public var swiftVersion: String? {
        return object(forInfoDictionaryKey: "SwiftVersion") as? String
    }
    
    /// The size of the app bundle on disk, formatted as a human-readable string.
    public var appSize: String? {
        let appDirectory = URL(fileURLWithPath: Bundle.main.bundlePath)
        let appSize = appDirectory.directorySize
        return ByteCountFormatter.string(fromByteCount: appSize, countStyle: .file)
    }
}

extension URL {
    /// The total size of the directory at the URL, including all its contents, in bytes.
    public var directorySize: Int64 {
        var size: Int64 = 0
        if let enumerator = FileManager.default.enumerator(at: self, includingPropertiesForKeys: [.fileSizeKey], options: [], errorHandler: nil) {
            for case let fileURL as URL in enumerator {
                size += Int64((try? fileURL.resourceValues(forKeys: [.fileSizeKey]).fileSize ?? 0) ?? 0)
            }
        }
        return size
    }
}
