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
                Image(systemName: "dollarsign.arrow.circlepath")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 130, height: 130)
                    .foregroundColor(.blue)
                    .padding(.top, 90)
                    .frame(maxWidth: .infinity)
                
//                TextView(textComponent: .init(textMessage: "Banco Valor", textLayoutConfig: .init(foregroundStyle: .blue, font: .largeTitle)))
                
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
//                    TextView(textComponent: .init(textMessage: "Login", textLayoutConfig: .init(foregroundStyle: .white)))
//                        .frame(maxWidth: .infinity)
//                        .padding()
//                        .background(Color.blue)
//                        .cornerRadius(10)
                }
                
                NavigationLink(destination: RegistryView(service: service)) {
//                    TextView(textComponent: .init(textMessage: "Criar nova conta", textLayoutConfig: .init(font: .subheadline))).underline()
//                        .padding(.top, 20)
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
