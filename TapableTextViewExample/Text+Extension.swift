//
//  Text+Extension.swift
//  TapableTextViewExample
//
//  Created by Illia on 2024-04-11.
//

import SwiftUI

extension Text {
    init(_ text: String, configure: (inout AttributedString) -> Void) {
        var attributedText = AttributedString(text)
        configure(&attributedText)
        self.init(attributedText)
    }
}
