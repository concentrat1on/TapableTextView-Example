//
//  TapableTextView.swift
//  TapableTextViewExample
//
//  Created by Illia on 2024-04-11.
//

import SwiftUI

struct TapableTextView: View {
    
    @Environment(\.openURL) private var openURL
    
    private let text: String
    private let font: Font
    private let color: Color
    private let attributes: [(text: String, color: Color?, font: Font?, action: () -> ())]
    
    init(text: String, color: Color, font: Font, attributes: [(text: String, color: Color?, font: Font?, action: () -> ())]) {
        self.text = text
        self.font = font
        self.color = color
        self.attributes = attributes
    }
    
    var body: some View {
        TextView(text: text,
                 color: color,
                 font: font,
                 attributes: attributes.map { ($0.text, $0.color, $0.font) })
        .environment(\.openURL, OpenURLAction { url in
            attributes.first(where: { $0.0 == url.lastPathComponent })?.action()
            return .systemAction
        })
    }
}
