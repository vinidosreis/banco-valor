//
//  RegistryView.swift
//  BancoValor
//
//  Created by Vinícius dos Reis on 09/09/24.
//

import SwiftUI

struct RegistryView: View {
    @State private var username = String()
    @State private var password = String()
    @State private var confirmPassword = String()
    @State private var isRegistered = false
    let service: UserServiceProtocol
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Nova conta valor")
                .font(.title)
                .padding(.top, 40)
            
            TextField("Usuario", text: $username)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            
            SecureField("Senha", text: $password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            
            SecureField("Confirme a senha", text: $confirmPassword)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            
            Button(action: {
                performRegistry()
            }) {
                Text("Criar conta")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.top, 20)
            
            Spacer()
        }
        .padding(.horizontal, 50)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
}

extension RegistryView {
    private func performRegistry() {
        Task {
            do {
                guard password == confirmPassword else {
                    print("As senhas não coincidem")
                    return
                }
                let registryRequest = UserRequest(username: username, password: password)
                let response = try await service.makeRequest(endpoint: .registerUser, body: registryRequest, responseType: LoginResponse.self)
                print("User registered successfully: \(response)")
                isRegistered = true
            } catch {
                print("Erro ao registrar usuário: \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    RegistryView(service: UserService())
}
