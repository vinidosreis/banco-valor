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
    
    @State private var name: String = ""
    @State private var balance: String = "--"
    @State private var creditCardBill: String = "--"
    @State private var creditCardLimit: String = "--"
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                HeaderView(name: ", \(name)")
                
                BalanceView(balance: balance)
                
                CreditCardView(bill: creditCardBill, limit: creditCardLimit)
                
                Spacer()
            }
            .customToolbar()
            .background(Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all))
            .task {
                await fetchBalance()
            }
        }
    }
}
struct EmptyBody: Codable {}

extension HomeView {
    private func fetchBalance() async {
        Task {
            do {
                let keychain = Keychain(service: "com.example.BancoValor")
                guard let token = keychain["jwtToken"] else {
                    print(BVError.keychain(error: BVError.missingData))
                    return
                }
                
                let headers = ["Authorization": "Bearer \(token)"]
                let balanceResponse = try await service.makeRequest(endpoint: .accountData, headers: headers, body: false, responseType: accountData.self)
                
                updateBalance(response: balanceResponse)
            } catch {
                print(BVError.missingData)
            }
        }
    }
    
    private func updateBalance(response: accountData) {
        name = response.name
        balance = response.balance
        creditCardBill = response.creditCardBill
        creditCardLimit = response.creditCardLimit
    }
}

#Preview {
    HomeView(service: BankService(network: URLSession.shared))
}
