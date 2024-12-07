//
//  BarChartView.swift
//  Customizable-Graph-and-Chart-Library
//
//  Created by sahin raj on 12/7/24.
//

import SwiftUI

struct BarChartView: View {
    let data: [ChartData]

    var body: some View {
        GeometryReader { geometry in
            let maxValue = data.map { $0.value }.max() ?? 1
            let barWidth: CGFloat = geometry.size.width / CGFloat(data.count * 2) // Dynamic bar width
            
            HStack(alignment: .bottom, spacing: barWidth / 2) {
                ForEach(data) { entry in
                    VStack {
                        // Display value above each bar
                        Text("\(Int(entry.value))")
                            .font(.caption)
                            .foregroundColor(.primary)

                        // Bar
                        Rectangle()
                            .fill(entry.color)
                            .frame(
                                width: barWidth,
                                height: CGFloat(entry.value) / CGFloat(maxValue) * geometry.size.height * 0.7 // Scale bar height
                            )

                        // Label below each bar
                        Text(entry.label)
                            .font(.caption)
                            .frame(maxWidth: barWidth)
                            .lineLimit(1)
                            .minimumScaleFactor(0.5)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .padding(.horizontal)
    }
}
