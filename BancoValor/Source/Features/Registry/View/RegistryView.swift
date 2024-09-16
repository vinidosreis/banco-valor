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
    let service: BankServiceProtocol
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                ImageView("dollarsign.arrow.circlepath", h: 130, w: 130)
                    .foregroundColor(.blue)
                    .padding(.top, 30)
                
                TextView("Nova Conta Valor", layout: .init(color: .blue, font: .largeTitle))
                    .padding()
        
                TextFieldView(username: $username, password: $password, confirmPassword: $confirmPassword, registry: true)
                
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
                HomeView(service: service)
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
                _ = try await service.makeRequest(endpoint: .registerUser, headers: nil, body: registryRequest, responseType: LoginResponse.self)
                isRegistred = true
            } catch {
                print(BVError.registryError(error: error))
            }
        }
    }
}

#Preview {
    RegistryView(service: BankService(network: URLSession.shared))
}
