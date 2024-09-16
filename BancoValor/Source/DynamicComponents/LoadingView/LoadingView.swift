//
//  LoadingView.swift
//  BancoValor
//
//  Created by Vinícius dos Reis on 16/09/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            ProgressView("Carregando...")
                .progressViewStyle(CircularProgressViewStyle())
                .scaleEffect(2.0)        }
    }
}

#Preview {
    LoadingView()
}
