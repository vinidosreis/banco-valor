//
//  ImageView.swift
//  BancoValor
//
//  Created by Vinícius dos Reis on 13/09/24.
//

import SwiftUI

struct ImageView: View {
    
    let systemName: String
    let h: CGFloat
    let w: CGFloat
    let a: Alignment
    
    init(_ systemName: String, h: CGFloat, w: CGFloat,_ a: Alignment = .center) {
        self.systemName = systemName
        self.h = h
        self.w = w
        self.a = a
    }
    
    var body: some View {
        Image(systemName: systemName)
            .resizable()
            .scaledToFit()
            .frame(width: w, height: h)
        }
}

#Preview {
    ImageView("heart", h: 50, w: 50)
}
