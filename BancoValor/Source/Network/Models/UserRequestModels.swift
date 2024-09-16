//
//  UserRequestModels.swift
//  BancoValor
//
//  Created by Vinícius dos Reis on 10/09/24.
//

struct UserRequest: Codable {
    let username: String
    let password: String
}

struct LoginResponse: Codable {
    let token: String
    
    enum CodingKeys: String, CodingKey {
        case token = "response"
    }
}

struct accountData: Codable {
    let name: String
    let balance: String
    let creditCardBill: String
    let creditCardLimit: String
}
