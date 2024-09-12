//
//  TextView.swift
//  BancoValor
//
//  Created by Vinícius dos Reis on 11/09/24.
//

import SwiftUI

struct TextView: View {
    let textComponent: TextComponent
    
    init(_ textMessage: String) {
        let defaultLayout = TextLayoutConfig()
        self.textComponent = TextComponent(textMessage, textLayoutConfig: defaultLayout)
    }
    
    var body: some View {
        Text(textComponent.textMessage)
            .frame(width: textComponent.textLayoutConfig.frameWidth, height: textComponent.textLayoutConfig.frameHeight)
            .foregroundStyle((textComponent.textLayoutConfig.foregroundStyle ?? .black))
            .font(textComponent.textLayoutConfig.font)
    }
}

#Preview {
    return VStack {
        TextView("Banco Valor")
        TextView("Banco Valor")
    }
    .padding([.leading, .trailing], 16)
}
