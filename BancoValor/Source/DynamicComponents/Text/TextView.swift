//
//  TextView.swift
//  BancoValor
//
//  Created by Vinícius dos Reis on 11/09/24.
//

import SwiftUI

struct TextView: View {
    let message: String
    var layoutConfig = TextLayoutConfig()
    
    init(_ message: String) {
        self.message = message
    }
    
    init(_ message: String, layout: TextLayoutConfig) {
        self.message = message
        self.layoutConfig = layout
    }
    
    var body: some View {
        Text(message)
            .frame(width: layoutConfig.width, height: layoutConfig.height)
            .foregroundStyle((layoutConfig.color))
            .font(layoutConfig.font)
    }
}

#Preview {
    TextView("TESTE", layout: .init(font: .largeTitle))
}
