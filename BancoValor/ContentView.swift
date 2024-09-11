//
//  ContentView.swift
//  BancoValor
//
//  Created by Vinícius dos Reis on 09/09/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let service = UserService()
        LoginView(service: service)
    }
}

#Preview {
    ContentView()
}
