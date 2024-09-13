//
//  HomeView.swift
//  BancoValor
//
//  Created by Vinícius dos Reis on 09/09/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                HeaderView(name: "Vinícius")
                
                BalanceView(title: "Conta Corrente", balance: "R$ 12.356,00")
                
                CreditCardView()
                
                Spacer()
            }
            .background(Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all))
            .customToolbar()
        }
    }
}

#Preview {
    HomeView()
}
