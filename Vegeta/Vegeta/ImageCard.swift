//
//  ImageCard.swift
//  Vegeta
//
//  Created by Reinatt Wijaya on 3/15/25.
//

import SwiftUI

struct ImageNumberCard: View {
    var imageName: String // Name of the image in your assets
    var numbers: [Int]   // Array of 4 numbers to display
    var labels: [String] = ["CO2 Emissions", "Water saved", "Land Use saved", "Land Enriched"]

    var body: some View {
        VStack(spacing: 10) {
            Text("Sayantan ate an amazing food today! Check it out")
            // Image
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 150)
                .cornerRadius(10)
                .shadow(radius: 5)

            // Numbers Grid
            HStack(spacing: 5) {
                VStack {
                    Text("\(numbers[0]) kg")
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                    Text(" \(labels[0])") // Customize labels as needed
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity)
                
                VStack {
                    Text("\(numbers[1]) kg")
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                    Text(" \(labels[1])") // Customize labels as needed
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity)
                
                VStack {
                    Text("\(numbers[2]) kg")
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                    Text(" \(labels[2])") // Customize labels as needed
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity)
            }
            .padding(.horizontal)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}
