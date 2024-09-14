//
//  BalanceView.swift
//  BancoValor
//
//  Created by Vinícius dos Reis on 13/09/24.
//

import SwiftUI

struct BalanceView: View {
    let balance: String
    let buttons: [(String, String)] = [
        ("creditcard", "Área Pix"),
        ("barcode", "Pagar"),
        ("arrowshape.turn.up.forward", "Transf."),
        ("banknote", "Investir")
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            TextView("Conta Corrente")
                .padding(.top)
                .padding(.bottom, 1)
            
            TextView("R$ \(balance)", layout: .init(font: .largeTitle))
                .font(.largeTitle)
                .bold()
            
            HStack(alignment: .center) {
                ForEach(buttons, id: \.0) { icon, label in
                    VStack {
                        ImageView(icon, h: 24, w: 24)
                        TextView(label)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding(.vertical, 8)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
    }
}

extension BalanceView {
    func fetchAccountInfo() async {
        do {
            
        } catch {
            
        }
    }
}

//#Preview {
//    BalanceView()
//}
