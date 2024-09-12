//
//  Text.swift
//  BancoValor
//
//  Created by Vinícius dos Reis on 11/09/24.
//

struct TextComponent {
    var textMessage: String
    var textLayoutConfig: TextLayoutConfig
    
    init(_ textMessage: String, textLayoutConfig: TextLayoutConfig = .init()) {
        self.textMessage = textMessage
        self.textLayoutConfig = textLayoutConfig
    }
}
