//
//  KeychainManager.swift
//  SxnnyUI
//
//  Created by Sxnnyside Proyect on 21/01/25.
//

import Foundation
import Security

/// Errors that can occur during Keychain operations.
public enum KeychainError: Error {
    case dataConversionError
    case itemNotFound
    case unexpectedData
    case unhandledError(status: OSStatus)
}

/// A utility class for managing secure storage of sensitive data using the Keychain.
public struct KeychainManager {

    /// Saves a value to the Keychain for a given key.
    ///
    /// - Parameters:
    ///   - key: The key under which the value will be stored.
    ///   - value: The value to store in the Keychain.
    /// - Throws: A `KeychainError` if the operation fails.
    public static func save(key: String, value: String) throws {
        guard let data = value.data(using: .utf8) else {
            throw KeychainError.dataConversionError
        }

        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecValueData as String: data
        ]

        // Delete any existing item with the same key to avoid duplicates.
        SecItemDelete(query as CFDictionary)

        // Add the new item to the Keychain.
        let status = SecItemAdd(query as CFDictionary, nil)
        if status != errSecSuccess {
            throw KeychainError.unhandledError(status: status)
        }
    }

    /// Retrieves a value from the Keychain for a given key.
    ///
    /// - Parameter key: The key for which to retrieve the value.
    /// - Returns: The value associated with the key.
    /// - Throws: A `KeychainError` if the operation fails.
    public static func get(key: String) throws -> String {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]

        var dataTypeRef: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)

        guard status != errSecItemNotFound else {
            throw KeychainError.itemNotFound
        }

        guard status == errSecSuccess else {
            throw KeychainError.unhandledError(status: status)
        }

        guard let data = dataTypeRef as? Data,
              let result = String(data: data, encoding: .utf8) else {
            throw KeychainError.unexpectedData
        }

        return result
    }

    /// Deletes a value from the Keychain for a given key.
    ///
    /// - Parameter key: The key for which to delete the value.
    /// - Throws: A `KeychainError` if the operation fails.
    public static func delete(key: String) throws {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key
        ]

        let status = SecItemDelete(query as CFDictionary)

        guard status == errSecSuccess || status == errSecItemNotFound else {
            throw KeychainError.unhandledError(status: status)
        }
    }
}
