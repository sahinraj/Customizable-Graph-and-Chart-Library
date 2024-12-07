//
//  ContentView.swift
//  Customizable-Graph-and-Chart-Library
//
//  Created by sahin raj on 12/7/24.
//

import SwiftUI

struct ContentView: View {
    let sampleData: [ChartData] = [
        ChartData(label: "Jan", value: 200, color: .red),
        ChartData(label: "Feb", value: 400, color: .blue),
        ChartData(label: "Mar", value: 150, color: .green),
        ChartData(label: "Apr", value: 350, color: .orange)
    ]

    @State private var showLineChart = false
    @State private var showBarChart = false
    @State private var showPieChart = false

    var body: some View {
        VStack(spacing: 20) {
            // Line Chart Button
            Button(action: {
                showLineChart = true
            }) {
                Text("Show Line Chart")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .sheet(isPresented: $showLineChart) {
                ChartModalView(title: "Line Chart") {
                    LineChartView(data: sampleData, lineColor: .blue, showPoints: true)
                        .frame(height: 300)
                }
            }

            // Bar Chart Button
            Button(action: {
                showBarChart = true
            }) {
                Text("Show Bar Chart")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .sheet(isPresented: $showBarChart) {
                ChartModalView(title: "Bar Chart") {
                    BarChartView(data: sampleData)
                        .frame(height: 300)
                }
            }

            // Pie Chart Button
            Button(action: {
                showPieChart = true
            }) {
                Text("Show Pie Chart")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .sheet(isPresented: $showPieChart) {
                ChartModalView(title: "Pie Chart") {
                    PieChartView(data: sampleData)
                        .frame(height: 300)
                }
            }
        }
        .padding()
    }
}
