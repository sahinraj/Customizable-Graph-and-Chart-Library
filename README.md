# Customizable Graph and Chart Library in SwiftUI

This SwiftUI project features a **Customizable Chart Library** that includes **Line Chart**, **Bar Chart**, and **Pie Chart** implementations. The library supports dynamic data visualization, customizable styling, and smooth animations, making it perfect for iOS developers building modern, interactive UI components.

---

## Features

- 📈 **Line Chart**:
  - Dynamic X and Y axes with labeled data points.
  - Smooth animations for line rendering.
  - Optional data point markers.

- 📊 **Bar Chart**:
  - Dynamic scaling and proportional bar heights.
  - Labels for bar values and categories.
  - Fully responsive to container size.

- 🥧 **Pie Chart**:
  - Proportional segments based on data values.
  - Labels for each segment.
  - Fully customizable colors and layout.

- 🎨 **Customizable Design**:
  - Chart colors, dimensions, and animations can be adjusted.
  - Adaptive to different container sizes using `GeometryReader`.

---

## Screenshots
![Simulator Screenshot - iPhone 16 Pro - 2024-12-07 at 21 08 08](https://github.com/user-attachments/assets/8ad24e46-d653-4342-9a85-847b8c288089)
![Simulator Screenshot - iPhone 16 Pro - 2024-12-07 at 21 08 16](https://github.com/user-attachments/assets/eba6de03-7ff0-44d9-b374-2f29ad911d1e)
![Simulator Screenshot - iPhone 16 Pro - 2024-12-07 at 21 08 21](https://github.com/user-attachments/assets/93e31fbf-018b-44c0-90c0-d1eb35cde7c2)
![Simulator Screenshot - iPhone 16 Pro - 2024-12-07 at 21 08 24](https://github.com/user-attachments/assets/4e3146b1-7187-40cc-8c2d-e219478130f2)

---

## Demo

The app showcases the charts in modals, accessible via buttons. Each chart type is presented dynamically based on user interaction.

### Interaction Flow
1. **Three Buttons**:
   - "Show Line Chart"
   - "Show Bar Chart"
   - "Show Pie Chart"
2. **Dynamic Modals**:
   - Tap a button to open a modal displaying the respective chart.

---

## Code Structure

### `ChartData.swift`
Defines the data model used across all charts.

```swift
struct ChartData: Identifiable {
    let id = UUID()
    let label: String
    let value: Double
    let color: Color
}
```

---

### `LineChartView.swift`
A dynamic line chart with animated rendering and labeled axes.

- Features:
  - X and Y axes with proportional scaling.
  - Smooth animations for line drawing.
  - Customizable colors and data point markers.

---

### `BarChartView.swift`
A responsive bar chart with value labels and dynamic scaling.

- Features:
  - Dynamic bar widths and heights based on container size.
  - Labels above bars and below categories.

---

### `PieChartView.swift`
A proportional pie chart with labels for each segment.

- Features:
  - Segments sized based on data values.
  - Labels displayed outside the segments.

---

### `ContentView.swift`
Demonstrates how to use the library by rendering each chart type dynamically.

- Features:
  - Three buttons for each chart type.
  - Modal presentation of charts.

---

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/custom-chart-library.git
   cd custom-chart-library
   ```

2. Open the project in Xcode:
   ```bash
   open CustomChartLibrary.xcodeproj
   ```

3. Build and run the app on a simulator or device.

---

## Usage

### Adding a New Chart
1. Create your chart view by extending SwiftUI.
2. Use the `ChartData` model to feed data dynamically.
3. Wrap your chart in a modal or use it directly in your view.

---

## Requirements

- iOS 16.0+
- Swift 5.7+
- Xcode 14.0+

---

## Customization

### Data
Update the `sampleData` in `ContentView` to use your own data:

```swift
let sampleData: [ChartData] = [
    ChartData(label: "Jan", value: 200, color: .red),
    ChartData(label: "Feb", value: 400, color: .blue),
    ChartData(label: "Mar", value: 150, color: .green),
    ChartData(label: "Apr", value: 350, color: .orange)
]
```

### Colors and Animations
Modify the chart views to customize line/bar colors, segment styles, and animations.

---

## Contribution

Contributions are welcome! If you'd like to improve this library or add new features, feel free to open an issue or submit a pull request.

---

## License

This project is licensed under the [MIT License](LICENSE).

---

## Author

**Sahin Raj**  
- [GitHub](https://github.com/sahinraj)  
- [LinkedIn](https://www.linkedin.com/in/sahinraj/)  

---
