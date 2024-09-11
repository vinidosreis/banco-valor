//
//  Endpoints.swift
//  BancoValor
//
//  Created by Vinícius dos Reis on 10/09/24.
//

enum HTTPMethod: String {
    case POST, DELETE
}

enum Urls {
    case registerUser
    case loginUser
    case deleteUser
}

extension Urls {
    func httpMethodUrl() -> (HTTPMethod, String) {
        let baseUrl = "http://127.0.0.1:8080/"
        switch self {
        case .registerUser: return(.POST,"\(baseUrl)register")
        case .loginUser: return(.POST,"\(baseUrl)login")
        case .deleteUser: return(.DELETE,"\(baseUrl)delete")
        }
    }
}
