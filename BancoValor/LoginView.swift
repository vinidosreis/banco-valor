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
                Spacer()
                
                Image(systemName: "dollarsign.arrow.circlepath")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 130, height: 130 )
                    .foregroundColor(.blue)
                    .padding(.top, -30)
                    .frame(maxWidth: .infinity)
                
                Text("Banco Valor")
                    .foregroundStyle(.blue)
                    .font(.largeTitle)
                    .padding(.bottom, 50)
                
                TextField("Usuario", text: $username)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                
                SecureField("Senha", text: $password)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                
                Button(action: {
                    performLogin()
                }) {
                    Text("Login")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                NavigationLink(destination: RegistryView(service: service)) {
                    Text("Criar nova conta")
                        .font(.subheadline)
                        .foregroundColor(.black)
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
