//
//  ErrorView.swift
//  BancoValor
//
//  Created by Vinícius dos Reis on 09/09/24.
//

import SwiftUI

struct ErrorView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("Try again please!")
                .font(.largeTitle)
                .padding()

            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Back to Home")
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .navigationTitle("Login")
    }
}

#Preview {
    ErrorView()
}
