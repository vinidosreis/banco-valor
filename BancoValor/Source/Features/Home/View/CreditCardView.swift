//
//  CreditCardView.swift
//  BancoValor
//
//  Created by Vinícius dos Reis on 13/09/24.
//

import SwiftUI

struct CreditCardView: View {
    let bill: String
    let limit: String
    
    var body: some View {
        VStack(alignment: .leading) {
            TextView("Cartão de crédito")
                .padding(.top)
                .padding(.bottom, 1)
            
            TextView("Fatura atual", layout: .init(font: .subheadline))
            
            TextView("R$ \(bill)", layout: .init(font: .largeTitle))
                .font(.largeTitle)
                .bold()
            
            TextView("Limite disponível: R$ \(limit)")
                .padding(.top, 1)
            
            Spacer().frame(maxWidth: .infinity, maxHeight: 8)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(.horizontal)
    }
}

#Preview {
    CreditCardView(bill: "", limit: "")
}
