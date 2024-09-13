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
                ImageView("dollarsign.arrow.circlepath", h: 130, w: 130)
                    .foregroundColor(.blue)
                    .padding(.top, 30)
                
                TextView("Nova Conta Valor", layout: .init(color: .blue, font: .largeTitle))
                    .padding()
        
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
                    .padding(.bottom, 0)
                
                Button(action: performRegistry) {
                    TextView("Criar conta", layout: .init(color: .white))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.blue)
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
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    HStack(spacing: 0) {
                        Button(action: {
                        }) {
                            Image(systemName: "arrow.left")
                                .foregroundStyle(.black)
                        }
                        
                        TextView("Voltar")
                    }
                }
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
                print("user registred!")
            } catch {
                print("Erro ao registrar usuário: \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    RegistryView(service: UserService())
}
