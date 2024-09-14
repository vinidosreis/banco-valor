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
        body: T?,
        responseType: U.Type) async throws -> U
}


struct BankService: BankServiceProtocol {
    func makeRequest<T: Codable, U: Codable>(
        endpoint: Urls,
        headers: [String: String]? = nil,
        body: T? = nil,
        responseType: U.Type) async throws -> U {
        let (method, fullUrl) = endpoint.httpMethodUrl()
        guard let url = URL(string: fullUrl) else { throw URLError(.badURL) }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        // Adiciona os headers, se houver
        if let headers {
            for (key, value) in headers {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        
            if request.httpMethod != "GET" {
                if let body {
                    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                    request.httpBody = try? JSONEncoder().encode(body)
                }
            }
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        guard let decodedResponse = try? JSONDecoder().decode(U.self, from: data) else {
            throw NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Decoding error"])
        }
        
        return decodedResponse
    }
}

