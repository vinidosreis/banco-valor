//
//  HeaderView.swift
//  BancoValor
//
//  Created by Vinícius dos Reis on 13/09/24.
//

import SwiftUI

struct HeaderView: View {
    let name: String
    
    var body: some View {
        VStack {
            HStack {
                TextView("Bem vindo \(name)", layout: .init(color: .white))
                    .padding(.leading, 16)
                Spacer()
            }
            .padding(.top, 0)
        }
        .padding(.vertical)
        .background(Color.blue)
        .frame(maxWidth: .infinity)
    }
}
//
#Preview {
    HeaderView(name: "Teste")
}
