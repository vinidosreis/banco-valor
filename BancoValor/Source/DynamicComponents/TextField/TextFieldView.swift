//
//  TextFieldView.swift
//  BancoValor
//
//  Created by Vinícius dos Reis on 12/09/24.
//

import SwiftUI

struct TextFieldView: View {
    @Binding var username: String
    @Binding var password: String
    @Binding var confirmPassword: String
    let registry: Bool
    
    init(username: Binding<String>, password: Binding<String>, confirmPassword: Binding<String> = .constant(""), registry: Bool = false) {
         self._username = username
         self._password = password
         self._confirmPassword = confirmPassword
         self.registry = registry
     }
    
    var body: some View {
        VStack(spacing: 16) {
            TextField("Usuário", text: $username)
                .textInputAutocapitalization(.never)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            
            SecureField("Senha", text: $password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            
            if registry {
                SecureField("Confirme a senha", text: $confirmPassword)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
            }
        }
    }
}

#Preview {
    @State var username = "vinicius"
    @State var password = "123456"
    
    return TextFieldView(username: $username, password: $password)
}
