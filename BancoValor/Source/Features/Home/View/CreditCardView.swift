//
//  CreditCardView.swift
//  BancoValor
//
//  Created by Vinícius dos Reis on 13/09/24.
//

import SwiftUI

struct CreditCardView: View {
    var body: some View {
        VStack(alignment: .leading) {
            TextView("Cartão de crédito")
                .padding(.top)
                .padding(.bottom, 1)
            
            TextView("Fatura atual", layout: .init(font: .subheadline))
            
            TextView("R$ 1.094,80", layout: .init(font: .largeTitle))
                .font(.largeTitle)
                .bold()
            
            TextView("Limite disponível: R$ 730,00")
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
    CreditCardView()
}
