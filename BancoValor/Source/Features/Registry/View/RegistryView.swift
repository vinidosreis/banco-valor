//
//  RegistryView.swift
//  BancoValor
//
//  Created by Vinícius dos Reis on 09/09/24.
//

import SwiftUI

struct RegistryView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var isRegistred = false
    let service: UserServiceProtocol
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
//                TextView(textComponent: .init(textMessage: "Nova conta valor", textLayoutConfig: .init(font: .largeTitle)))
//                    .padding(.top, 40)
//                    .padding(.bottom, 20)
                
                TextField("Usuário", text: $username)
                    .textInputAutocapitalization(.never)
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
                    .padding(.bottom, 30)

                
                Button(action: performRegistry) {
                    Text("Criar conta")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.top, 20)
                .disabled(username.isEmpty || password.isEmpty || confirmPassword.isEmpty || password != confirmPassword)
                
                Spacer()
            }
            .padding(.horizontal, 50)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            .navigationDestination(isPresented: $isRegistred) {
                HomeView()
            }
        }
    }
}

extension RegistryView {
    private func performRegistry() {
        Task {
            do {
                let registryRequest = UserRequest(username: username, password: password)
                _ = try await service.makeRequest(endpoint: .registerUser, body: registryRequest, responseType: LoginResponse.self)
                isRegistred = true
            } catch {
                print("Erro ao registrar usuário: \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    RegistryView(service: UserService())
}
