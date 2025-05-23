//
//  Bundle.swift
//  SxnnyUI
//
//  Created by Sxnnyside Proyect on 21/01/25.
//

import Foundation

public extension Bundle {
    /// The display name of the app, as defined in the `CFBundleDisplayName` or `CFBundleName` key of the Info.plist.
    var displayName: String {
        object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
        ?? object(forInfoDictionaryKey: "CFBundleName") as? String
        ?? "Unknown"
    }

    /// The version of the app, as defined in the `CFBundleShortVersionString` key of the Info.plist.
    var version: String {
        object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "1.0"
    }

    /// The build number of the app, as defined in the `CFBundleVersion` key of the Info.plist.
    var build: String {
        object(forInfoDictionaryKey: kCFBundleVersionKey as String) as? String ?? "1"
    }

    /// The Swift version used in the app, as defined in the `SwiftVersion` key of the Info.plist (custom key).
    var swiftVersion: String? {
        object(forInfoDictionaryKey: "SwiftVersion") as? String
    }

    /// The size of the app bundle on disk, formatted as a human-readable string.
    var formattedAppSize: String {
        let url = bundleURL
        return ByteCountFormatter.string(fromByteCount: url.directorySize, countStyle: .file)
    }

    /// The size of the app bundle on disk in bytes.
    var appSizeInBytes: Int64 {
        bundleURL.directorySize
    }
}

public extension URL {
    /// Calculates the total size of the directory at the URL, including all its contents, in bytes.
    var directorySize: Int64 {
        guard isFileURL else { return 0 }

        var totalSize: Int64 = 0
        let fileManager = FileManager.default

        if let enumerator = fileManager.enumerator(at: self, includingPropertiesForKeys: [.fileSizeKey], options: .skipsHiddenFiles) {
            for case let fileURL as URL in enumerator {
                if let fileSize = try? fileURL.resourceValues(forKeys: [.isRegularFileKey, .fileSizeKey]),
                   fileSize.isRegularFile == true {
                    totalSize += Int64(fileSize.fileSize ?? 0)
                }
            }
        }

        return totalSize
    }
}
