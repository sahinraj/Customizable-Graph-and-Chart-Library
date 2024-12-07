//
//  ChartModalView.swift
//  Customizable-Graph-and-Chart-Library
//
//  Created by sahin raj on 12/7/24.
//

import SwiftUI

struct ChartModalView<Content: View>: View {
    let title: String
    let content: Content

    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }

    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
                .padding()

            Divider()
            Spacer()
            content
                .padding()

            Spacer()
        }
        .padding()
    }
}
