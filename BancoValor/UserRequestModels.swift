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
    let response: String
}
