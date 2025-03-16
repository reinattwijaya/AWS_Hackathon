//
//  ContentView.swift
//  Vegeta
//
//  Created by Reinatt Wijaya on 3/15/25.
//

import SwiftUI

struct ContentView: View {
    @State var name: String = ""
    @State var password: String = ""
    @State var showPassword: Bool = false
    
    var isSignInButtonDisabled: Bool {
        [name, password].contains(where: \.isEmpty)
    }
    
    var body: some View {
        NavigationStack{
        VStack(alignment: .leading, spacing: 15) {
            Spacer()
            
            TextField("Name",
                      text: $name,
                      prompt: Text("Name").foregroundColor(.blue))
            .padding(10)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.blue, lineWidth: 2)
            }
            .padding(.horizontal)
            
            HStack {
                Group {
                    if showPassword {
                        TextField("Password",
                                  text: $password,
                                  prompt: Text("Password").foregroundColor(.red))
                    } else {
                        SecureField("Password",
                                    text: $password,
                                    prompt: Text("Password").foregroundColor(.red))
                    }
                }
                .padding(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.red, lineWidth: 2)
                }
                
                Button { // add this new button
                    showPassword.toggle()
                } label: {
                    Image(systemName: showPassword ? "eye.slash" : "eye")
                        .foregroundColor(.red)
                }
                
            }.padding(.horizontal)
            
            Spacer()
            
            
            
                NavigationLink(destination: MainView().navigationBarBackButtonHidden(true))
                {
                    Text("Sign In")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                }
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .background(
                    LinearGradient(colors: [.blue, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                .cornerRadius(20)
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
