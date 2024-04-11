//
//  ContentView.swift
//  TapableTextViewExample
//
//  Created by Illia on 2024-04-11.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            Text("Hello, world!") { attributes in
                if let range = attributes.range(of: "world") {
                    attributes[range].foregroundColor = .red
                    attributes[range].font = .title
                    attributes[range].underlineStyle = .single
                }
            }
            TextView(
                text: "Hello, world! This is an example of a TextView",
                color: .black,
                font: .body,
                attributes: [("world", .red, nil),
                             ("example", .blue, nil),
                            ("TextView", .green, .title)
                            ])
            TapableTextView(
                text: "Tapable TextView example",
                color: .black,
                font: .body,
                attributes: [("example", .blue, nil, { print("example tap") }),
                             ("TextView", .green, .title, { print("TextView tap") })
                            ])
        }
        .padding()
    }
}

#Preview {
    ContentView()
}






