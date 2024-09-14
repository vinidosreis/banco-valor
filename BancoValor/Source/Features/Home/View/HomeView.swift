//
//  HomeView.swift
//  BancoValor
//
//  Created by Vinícius dos Reis on 09/09/24.
//

import SwiftUI
import KeychainAccess

struct HomeView: View {
    let service: BankServiceProtocol
    @State private var balance: String = "--"
    @State private var creditCardBill: String = "--"
    @State private var creditCardLimit: String = "--"
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                HeaderView(name: "Vinícius")
                
                BalanceView(balance: balance)
                
                CreditCardView(bill: creditCardBill, limit: creditCardLimit)
                
                Spacer()
            }
            .background(Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all))
            .customToolbar()
            .task {
                await fetchBalance()
            }
        }
    }
}

extension HomeView {
    private func fetchBalance() async {
        Task {
            do {
                // Acessa o Keychain para recuperar o token JWT
                let keychain = Keychain(service: "com.example.BancoValor")
                guard let token = keychain["jwtToken"] else {
                    print("Token não encontrado no Keychain")
                    return
                }
                
                // Define o header Authorization com o token JWT
                let headers = ["Authorization": "Bearer \(token)"]
                
                // Faz a requisição usando o método makeRequest, agora passando os headers
                let balanceResponse = try await service.makeRequest(endpoint: .getBalance, headers: headers, body: ["":""], responseType: AccountBalance.self)
                
                // Atualiza as variáveis de estado com os dados recebidos
                balance = balanceResponse.balance
                creditCardBill = balanceResponse.creditCardBill
                creditCardLimit = balanceResponse.creditCardLimit
            } catch {
                print("Error to get balance: \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    HomeView(service: BankService())
}
