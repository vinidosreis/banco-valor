//
//  UserService.swift
//  BancoValor
//
//  Created by Vinícius dos Reis on 09/09/24.
//

import Foundation

protocol BankServiceProtocol {
    func makeRequest<T: Codable, U: Codable>(
        endpoint: Urls,
        headers: [String: String]?,
        body: T,
        responseType: U.Type
    ) async throws -> U
}


struct BankService: BankServiceProtocol {
    let network: URLSession
    
    func makeRequest<T: Codable, U: Codable>(
        endpoint: Urls,
        headers: [String: String]?,
        body: T,
        responseType: U.Type
    ) async throws -> U {
        let (method, fullUrl) = endpoint.httpMethodUrl()
        guard let url = URL(string: fullUrl) else {
            throw BVError.invalidURL
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = method.rawValue
        
        if let headers {
            for (key, value) in headers {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        if method != .GET {
            
            do {
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                request.httpBody = try JSONEncoder().encode(body)
            } catch {
                throw BVError.encodingError(error: error)
            }
            
        }
        
        let (data, _) = try await network.data(for: request)
        
        do {
            return try JSONDecoder().decode(U.self, from: data)
        } catch {
            throw BVError.decodingError(error: error)
        }
    }
}

