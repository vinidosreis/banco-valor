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
                VStack {
                    HStack {
//                        TextView(textComponent: .init(textMessage: "Bem vindo, Vinícius", textLayoutConfig: .init(foregroundStyle: .white, font: .headline)))
//                            .padding(.leading, 16)
                        
                        Spacer()
                    }
                    .padding(.top, 0)
                }
                .padding(.vertical)
                .background(.blue)
                .frame(maxWidth: .infinity)
                
                VStack(alignment: .leading) {
                    Text("Conta Corrente")
                        .font(.headline)
                        .padding(.top)
                        .padding(.bottom, 1)
                    
                    Text("R$ 12.356,00")
                        .font(.largeTitle)
                        .bold()
                    
                    HStack(alignment: .center) {
                        VStack {
                            Image(systemName: "creditcard")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                            Text("Área Pix")
                        }
                        .frame(maxWidth: .infinity)
                        
                        VStack {
                            Image(systemName: "barcode")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                            Text("Pagar")
                        }
                        .frame(maxWidth: .infinity)
                        
                        VStack {
                            Image(systemName: "arrowshape.turn.up.forward")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                            TextView("Transferir")
                        }
                        .frame(maxWidth: .infinity)
                        
                        VStack {
                            Image(systemName: "banknote")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                            Text("Investir")
                                .multilineTextAlignment(.center)
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .padding(.top, 8)
                    .padding(.bottom, 8)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
                
                VStack(alignment: .leading) {
                    Text("Cartão de crédito")
                        .font(.headline)
                        .padding(.top)
                        .padding(.bottom, 1)
                    
                    Text("Fatura atual")
                        .font(.subheadline)
                    
                    
                    Text("R$ 1.094,80")
                        .font(.largeTitle)
                        .bold()
                    
                    Text("Limite disponível: R$ 730,00")
                        .font(.headline)
                        .padding(.top, 1)
                    
                    Spacer().frame(maxWidth: .infinity, maxHeight: 8)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding(.horizontal)
                
                Spacer()
            }
            .background(Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all))
            .toolbar {
                ToolbarItem(placement: .principal) {
//                    TextView(textComponent: .init(textMessage: "Banco Valor", textLayoutConfig: .init(foregroundStyle: .white, font: .headline)))
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                    }) {
                        Image(systemName: "bell.badge")
                            .foregroundColor(.white)
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                    }) {
                        Image(systemName: "person.crop.circle")
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
