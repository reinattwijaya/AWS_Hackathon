//
//  HomeView.swift
//  Vegeta
//
//  Created by Reinatt Wijaya on 3/15/25.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Example Usage
                ImageNumberCard(imageName: "oranges", numbers: [30, 231, 12, 10])
                ImageNumberCard(imageName: "Image 1", numbers: [13, 131, 5, 7])
                ImageNumberCard(imageName: "Image 2", numbers: [30, 201, 3, 9])
            }
            .padding()
        }
        .padding(.top, 20)
    }
}

#Preview {
    HomeView()
}
