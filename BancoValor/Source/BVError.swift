//
//  ServiceError.swift
//  BancoValor
//
//  Created by Vinícius dos Reis on 15/09/24.
//

enum BVError: Error {
    case invalidURL
    case loginFailed
    case decodingError(error: Error)
    case encodingError(error: Error)
    case missingData
    case registryError(error: Error)
    case keychain(error: Error)
    
    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "The URL is invalid."
        case .loginFailed:
            return "Login failed."
        case .decodingError(let error):
            return "Failed to decode the response: \(error.localizedDescription)"
        case .encodingError(let error):
            return "Failed to encode the request body: \(error.localizedDescription)"
        case .missingData:
            return "No data was returned."
        case .registryError(let error):
            return "Registry error occured: \(error.localizedDescription)."
        case .keychain(let error):
            return "An keychain error occurred: \(error.localizedDescription)"
        }
    }
}
