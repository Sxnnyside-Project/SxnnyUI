//
//  KeychainManager.swift
//  SxnnyUI
//
//  Created by Sxnnyside Project on 21/01/25.
//

import Foundation
import Security

/// Errors that can occur during Keychain operations.
///
/// - dataConversionError: The provided data could not be converted to a format suitable for the Keychain (e.g., String to Data conversion failed).
/// - itemNotFound: The requested item could not be found in the Keychain.
/// - unexpectedData: The data retrieved from the Keychain was not in the expected format or could not be converted to the desired type.
/// - unhandledError(status:): An unexpected OSStatus error code was returned from a Keychain API call, indicating an internal or unknown error.
public enum KeychainError: Error {
    case dataConversionError
    case itemNotFound
    case unexpectedData
    case unhandledError(status: OSStatus)
}

/// A utility struct for managing secure storage of sensitive data using the Keychain.
///
/// `KeychainManager` provides static methods for securely saving, retrieving, and deleting sensitive string data
/// in the Keychain. It is designed to simplify integration with Apple's Keychain Services, ensuring that
/// sensitive information such as passwords, tokens, and secrets are stored securely and can be easily accessed
/// or managed when needed. The struct handles common errors, such as data conversion issues, missing items, or unexpected
/// data, by throwing well-defined `KeychainError` values.
///
/// ## Usage
///
/// - To save data:
///     ```swift
///     try KeychainManager.save(key: "com.example.token", value: "mySecretToken")
///     ```
/// - To retrieve data:
///     ```swift
///     let token = try KeychainManager.get(key: "com.example.token")
///     ```
/// - To delete data:
///     ```swift
///     try KeychainManager.delete(key: "com.example.token")
///     ```
///
/// ## Error Handling
///
/// All methods throw `KeychainError` on failure. Use Swift's `do-catch` statements to handle errors gracefully.
///
/// ## Thread Safety
///
/// All operations are performed synchronously and are safe to call from any thread.
///
/// ## Security Note
///
/// Data stored in the Keychain is encrypted and protected by the system, making it suitable for storing secrets
/// and other sensitive information.
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
