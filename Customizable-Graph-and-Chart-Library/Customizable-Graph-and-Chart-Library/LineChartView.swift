//
//  LineChartView.swift
//  Customizable-Graph-and-Chart-Library
//
//  Created by sahin raj on 12/7/24.
//

import SwiftUI

struct LineChartView: View {
    let data: [ChartData]
    let lineColor: Color
    let showPoints: Bool

    @State private var animationPercentage: CGFloat = 0

    var body: some View {
        GeometryReader { geometry in
            let maxValue = data.map { $0.value }.max() ?? 1
            let minValue = data.map { $0.value }.min() ?? 0
            let chartHeight = geometry.size.height * 0.8
            let chartWidth = geometry.size.width - 60 // Leave space for Y-axis labels

            VStack {
                ZStack {
                    // Axes
                    Path { path in
                        // Vertical Y-axis
                        path.move(to: CGPoint(x: 40, y: 0))
                        path.addLine(to: CGPoint(x: 40, y: chartHeight))

                        // Horizontal X-axis
                        path.move(to: CGPoint(x: 40, y: chartHeight))
                        path.addLine(to: CGPoint(x: chartWidth + 40, y: chartHeight))
                    }
                    .stroke(Color.gray, lineWidth: 1)

                    // Line chart
                    Path { path in
                        guard let firstPoint = data.first else { return }
                        let startX = 40.0
                        let startY = chartHeight * (1 - CGFloat((firstPoint.value - minValue) / (maxValue - minValue)))
                        path.move(to: CGPoint(x: startX, y: startY))

                        for (index, point) in data.enumerated() {
                            let x = 40 + chartWidth * CGFloat(index) / CGFloat(data.count - 1)
                            let y = chartHeight * (1 - CGFloat((point.value - minValue) / (maxValue - minValue)))
                            path.addLine(to: CGPoint(x: x, y: y))
                        }
                    }
                    .trim(from: 0, to: animationPercentage)
                    .stroke(lineColor, lineWidth: 2)
                    .animation(.easeOut(duration: 1.5), value: animationPercentage)
                    .onAppear {
                        animationPercentage = 1.0
                    }

                    // Points
                    if showPoints {
                        ForEach(Array(data.enumerated()), id: \.offset) { index, point in
                            let x = 40 + chartWidth * CGFloat(index) / CGFloat(data.count - 1)
                            let y = chartHeight * (1 - CGFloat((point.value - minValue) / (maxValue - minValue)))

                            Circle()
                                .fill(lineColor)
                                .frame(width: 8, height: 8)
                                .position(x: x, y: y)
                        }
                    }
                }

                // X-axis labels
                HStack {
                    ForEach(data) { point in
                        Text(point.label)
                            .font(.caption)
                            .frame(maxWidth: .infinity)
                    }
                }
                .padding(.horizontal)
            }
            .padding(.leading, 20) // Space for Y-axis labels
            .overlay(
                // Y-axis labels
                VStack {
                    ForEach(0..<5) { step in
                        let value = maxValue - (maxValue - minValue) * Double(step) / 4
                        Text("\(Int(value))")
                            .font(.caption)
                            .frame(width: 40, alignment: .trailing)
                            .offset(y: chartHeight * CGFloat(step) / 4 - chartHeight / 2)
                    }
                }
                .padding(.leading, 10),
                alignment: .leading
            )
        }
        .frame(height: 300) // Fixed height for consistent layout
    }
}
