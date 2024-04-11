//
//  TextView.swift
//  TapableTextViewExample
//
//  Created by Illia on 2024-04-11.
//

import SwiftUI

struct TextView: View {
    
    private let attributedText: AttributedString
    private let font: Font
    private let color: Color
    
    init(text: String, color: Color, font: Font, attributes: [(text: String, color: Color?, font: Font?)]) {
        var attributedText = AttributedString(text)
        attributes.forEach { (aText: String, aColor: Color?, aFont: Font?) in
            if let range = attributedText.range(of: aText) {
                attributedText[range].foregroundColor = aColor ?? color
                attributedText[range].font = aFont ?? font
                attributedText[range].link = URL(string: aText)
            }
        }
        self.attributedText = attributedText
        self.font = font
        self.color = color
    }
    
    var body: some View {
        Text(attributedText)
            .font(font)
            .foregroundStyle(color)
    }
}
