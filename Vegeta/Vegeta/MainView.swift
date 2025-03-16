//
//  MainView.swift
//  Vegeta
//
//  Created by Reinatt Wijaya on 3/15/25.
//

import SwiftUI

struct MainView: View {
    @State private var selectedTab = 0

    var body: some View {
        VStack {
            TabView(selection: $selectedTab) {
                HomeView()
                .tag(0)

                CameraView(selectedTab: $selectedTab)
                .tag(1)

                ProfileView()
                .tag(2)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))

            HStack {
                Button(action: {
                    selectedTab = 0
                }) {
                    VStack {
                        Image(systemName: "house.fill")
                        if selectedTab == 0 {
                            Text("Home")
                                .foregroundColor(.blue)
                        }
                    }
                }
                .frame(maxWidth: .infinity)

                Button(action: {
                    selectedTab = 1
                }) {
                    VStack {
                        Image(systemName: "camera")
                        if selectedTab == 1 {
                            Text("Camera")
                                .foregroundColor(.blue)
                        }
                    }
                }
                .frame(maxWidth: .infinity)

                Button(action: {
                    selectedTab = 2
                }) {
                    VStack {
                        Image(systemName: "person.fill")
                        if selectedTab == 2 {
                            Text("Profile")
                                .foregroundColor(.blue)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .background(Color.gray.brightness(0.3))
            .edgesIgnoringSafeArea(.bottom)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    MainView()
}
