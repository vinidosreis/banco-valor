//
//  CustomToolbar.swift
//  BancoValor
//
//  Created by Vinícius dos Reis on 13/09/24.
//

import SwiftUI

extension View {
    func customToolbar() -> some View {
        self.toolbar {
            ToolbarItem(placement: .principal) {
                TextView("Banco Valor", layout: .init(color: .white))
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

