//
//  LoginView.swift
//  BancoValor
//
//  Created by Vinícius dos Reis on 09/09/24.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isLoggedIn: Bool = false
    let service: UserServiceProtocol
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 20) {
                ImageView("dollarsign.arrow.circlepath", h: 130, w: 130)
                    .foregroundColor(.blue)
                    .padding(.top, 90)
                
                TextView("Banco Valor", layout: .init(color: .blue, font: .largeTitle))
                
                TextFieldView(username: $username, password: $password)
                
                Button(action: {
                    performLogin()
                }) {
                    TextView("Login", layout: .init(color: .white))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                NavigationLink(destination: RegistryView(service: service)) {
                    TextView("Criar nova conta")
                        .underline()
                        .padding(.top, 20)
                }
                
                Spacer()
            }
            .padding(.horizontal, 50)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            .navigationDestination(isPresented: $isLoggedIn) {
                HomeView()
            }
        }
    }
}

extension LoginView {
    private func performLogin() {
        Task {
            do {
                let loginRequest = UserRequest(username: username, password: password)
                let response = try await service.makeRequest(endpoint: .loginUser, body: loginRequest, responseType: LoginResponse.self)
                print(response)
                isLoggedIn = true
            } catch {
                print (error.localizedDescription)
            }
        }
    }
}

#Preview {
    LoginView(service: UserService())
}
