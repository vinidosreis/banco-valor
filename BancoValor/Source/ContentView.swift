//
//  ContentView.swift
//  BancoValor
//
//  Created by Vinícius dos Reis on 09/09/24.
//

import SwiftUI

struct ContentView: View {
    let service: UserServiceProtocol
    
    var body: some View {
        LoginView(service: service)
    }
}

#Preview {
    ContentView(service: UserService())
}
