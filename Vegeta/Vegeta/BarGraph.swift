import SwiftUI

struct BarGraphView: View {
    // Dummy data: x-axis values and corresponding y-axis values
    let data: [(x: CGFloat, y: CGFloat)] = [
        (0, 50),
        (1, 75),
        (2, 40),
        (3, 90),
        (4, 60),
        (5, 80),
        (6, 30),
        (7, 85),
        (8, 55),
        (9, 95)
    ]
    
    var body: some View {
        VStack {
            Text("Saved CO2 Emission")
                .font(.headline)
            
            GeometryReader { geometry in
                ZStack {
                    // Draw the background grid or axes (optional)
                    BarGraphGrid()
                    
                    // Calculate the width of each bar based on available space
                    let barWidth = (geometry.size.width - CGFloat(data.count + 1) * 10) / CGFloat(data.count)
                    
                    // Draw the bars
                    ForEach(data, id: \.x) { point in
                        Rectangle()
                            .frame(
                                width: barWidth, // Dynamic width
                                height: point.y // Height based on y-value
                            )
                            .position(
                                x: CGFloat(point.x) * (barWidth + 10) + (barWidth / 2) + 10, // Position the bars with space between them
                                y: geometry.size.height - point.y / 2 // Y-position so the bars are aligned to the bottom
                            )
                            .foregroundColor(.blue)
                    }
                }
            }
            .frame(height: 200)
            .padding()
        }
    }
}

// Optional: Draw grid lines or axes (if needed)
struct BarGraphGrid: View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                // Draw horizontal grid lines
                for i in 0..<6 {
                    path.move(to: CGPoint(x: 0, y: geometry.size.height * CGFloat(i) / 5))
                    path.addLine(to: CGPoint(x: geometry.size.width, y: geometry.size.height * CGFloat(i) / 5))
                }
                
                // Draw vertical grid lines
                for i in 0..<10 {
                    path.move(to: CGPoint(x: geometry.size.width * CGFloat(i) / 9, y: 0))
                    path.addLine(to: CGPoint(x: geometry.size.width * CGFloat(i) / 9, y: geometry.size.height))
                }
            }
            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
        }
    }
}
