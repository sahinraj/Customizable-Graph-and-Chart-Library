//
//  PieChartView.swift
//  Customizable-Graph-and-Chart-Library
//
//  Created by sahin raj on 12/7/24.
//

import SwiftUI

struct PieChartView: View {
    let data: [ChartData]

    var body: some View {
        GeometryReader { geometry in
            let total = data.map { $0.value }.reduce(0, +)
            let center = CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2)
            let radius = min(geometry.size.width, geometry.size.height) / 2

            ZStack {
                ForEach(Array(data.enumerated()), id: \.offset) { index, entry in
                    let startAngle = Angle(degrees: data.prefix(index).map { $0.value }.reduce(0, +) / total * 360)
                    let endAngle = Angle(degrees: (data.prefix(index + 1).map { $0.value }.reduce(0, +)) / total * 360)

                    Path { path in
                        path.move(to: center)
                        path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
                    }
                    .fill(entry.color)

                    // Add labels for each segment
                    let midAngle = Angle(degrees: (startAngle.degrees + endAngle.degrees) / 2)
                    let labelX = center.x + radius * 0.7 * cos(CGFloat(midAngle.radians))
                    let labelY = center.y + radius * 0.7 * sin(CGFloat(midAngle.radians))

                    Text("\(entry.label): \(Int(entry.value))")
                        .font(.caption)
                        .position(x: labelX, y: labelY)
                }
            }
        }
        .aspectRatio(1, contentMode: .fit)
    }
}
