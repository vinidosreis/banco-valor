//
//  BancoValorApp.swift
//  BancoValor
//
//  Created by Vinícius dos Reis on 09/09/24.
//

import SwiftUI

@main
struct BancoValorApp: App {
    let service = BankService(network: URLSession.shared)
    
    var body: some Scene {
        WindowGroup {
            ContentView(service: service)
        }
    }
}
