//
//  BaseChartView.swift
//  Customizable-Graph-and-Chart-Library
//
//  Created by sahin raj on 12/7/24.
//

import SwiftUI

struct BaseChartView<Content: View>: View {
    let title: String
    let subtitle: String?
    let content: Content

    init(title: String, subtitle: String? = nil, @ViewBuilder content: () -> Content) {
        self.title = title
        self.subtitle = subtitle
        self.content = content()
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
            
            if let subtitle = subtitle {
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            content
                .frame(maxWidth: .infinity, maxHeight: 400)
                .background(Color(.systemBackground).shadow(radius: 4))
                .cornerRadius(10)
        }
        .padding()
    }
}
