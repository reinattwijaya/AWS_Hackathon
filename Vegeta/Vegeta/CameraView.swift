//
//  CameraView.swift
//  Vegeta
//
//  Created by Reinatt Wijaya on 3/15/25.
//

import SwiftUI

struct CameraView: View {
    @Binding var selectedTab: Int
    
    @State private var image: UIImage?
    @State private var isShowingCamera = false
    @State private var base64String: String = ""
    @State private var showInfo = false
    @State private var jsonData: [String: Any] = [:]
    @State private var isLoading = true

    
    let apiUrl = "https://aq58j9qdij.execute-api.us-west-2.amazonaws.com/default/MainLambda"
    
    var body: some View {
        VStack {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                
                if showInfo{
                    if isLoading {
                            ProgressView("Loading...") // SwiftUI built-in spinner
                                .progressViewStyle(CircularProgressViewStyle())
                                .padding()
                    } else {
                        VStack {
                            InfoCard(title: "Entity", value: "Oranges")
                            HStack {
                                InfoCard(title: "Emissions", value: "\(jsonData["Min Emissions"] as? Double ?? 0.0)")
                                InfoCard(title: "Water withdrawals", value: "\(jsonData["Min Water withdrawals"] as? Double ?? 0.0)")
                            }
                            HStack {
                                InfoCard(title: "Biodiversity", value: "\(jsonData["Min Biodiversity"] as? Double ?? 0.0)")
                                InfoCard(title: "Land use", value: "\(jsonData["Min Land use"] as? Double ?? 0.0)")
                            }
                        }
                        .padding(10)
                    }
                    
                    Button("Post") {
                        print("POSTING BRO")
                        selectedTab = 0
                        self.image = nil
                        showInfo = false
                    }
                    .padding()
                }else{
                    Button("Generate Info") {
                        if let imageData = image.jpegData(compressionQuality: 0.99) {
                            base64String = imageData.base64EncodedString()
                            sendPostRequest(base64String: base64String)
                            showInfo = true
                        }
                    }
                    .padding()
                }
                
//                Text("Base64 Data:")
//                    .bold()
//                
//                ScrollView {
//                    Text(base64String)
//                        .textSelection(.enabled)
//                        .padding()
//                }
//                .frame(height: 150)
            }
            if !showInfo{
                Button("Take Picture") {
                    isShowingCamera = true
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
        .fullScreenCover(isPresented: $isShowingCamera) {
            CameraPicker(image: $image)
        }
    }
    
    func sendPostRequest(base64String: String) {
            // Define the URL for the request
        guard let url = URL(string: apiUrl) else {
            print("Invalid URL")
            return
        }
        
        // Create the request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Prepare the JSON body
        let body: [String: Any] = ["image": base64String]
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted) // Pretty print
            request.httpBody = jsonData
            
            if let jsonString = String(data: jsonData, encoding: .utf8) {
            }
        } catch {
            print("Error encoding JSON: \(error)")
            return
        }
        
        // Send the POST request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("❌ Error: \(error.localizedDescription)")
                return
            }
            
            // Print the raw response data
            if let data = data {
                do {
                    let jsonResponse = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                    if let jsonObject = jsonResponse as? [String: Any] {
                        DispatchQueue.main.async {
                            self.jsonData = jsonObject // Store the dictionary
                            self.isLoading = false
                        }
                    }
                    if let prettyData = try? JSONSerialization.data(withJSONObject: jsonResponse, options: .prettyPrinted),
                       let prettyString = String(data: prettyData, encoding: .utf8) {
                        DispatchQueue.main.async {
                            print("📥 JSON Response:\n\(prettyString)")
                        }
                    }
                } catch {
                    print("❌ Error parsing JSON: \(error.localizedDescription)")
                }
            }
        }
        
        task.resume() // Start the request
    }
}

struct InfoCard: View {
    let title: String
    let value: String

    var body: some View {
        VStack {
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
            Text(value)
                .font(.headline)
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
}

#Preview {
    CameraView(selectedTab: .constant(1))
}
