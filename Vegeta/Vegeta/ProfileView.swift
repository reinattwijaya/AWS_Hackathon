//
//  ProfileView.swift
//  Vegeta
//
//  Created by Reinatt Wijaya on 3/15/25.
//

import SwiftUI

struct ProfileView: View {
    
    var body: some View {
        ScrollView{
            HStack{
                Image(systemName: "person.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 50)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                VStack{
                    Text("Sayantan")
                    HStack{
                        VStack{
                            Text("Followers")
                            Text("46")
                        }
                        VStack{
                            Text("Following")
                            Text("78")
                        }
                    }
                }.padding(25)
            }
            // CO2 saved line graph
            BarGraphView()
                .padding(10)
            VStack{
                Text("Best meal of the week")
                HStack{
                    Image("food2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150)
                        .cornerRadius(10)
                        .padding(20)
                    VStack{
                        HStack{
                            Text("Nutritional Value: A")
                            Spacer()
                        }
                        HStack{
                            Text("CO2 emission saved: 10 kg")
                            Spacer()
                        }
                    }
                    .padding(.leading, 10)
                    Spacer()
                }
                
            }
            
            VStack{
                HStack{
                    Image("food")
                        .resizable()
                        .frame(width: 105, height: 100)
                    Image("food2")
                        .resizable()
                        .frame(width: 105, height: 100)
                    Image("Image")
                        .resizable()
                        .frame(width: 105, height: 100)
                }
                HStack{
                    Image("Image 1")
                        .resizable()
                        .frame(width: 105, height: 100)
                    Image("Image 2")
                        .resizable()
                        .frame(width: 105, height: 100)
                    Image("Image 3")
                        .resizable()
                        .frame(width: 105, height: 100)
                }
            }
            
            Spacer()
        }.padding(.top, 20)
    }
}

#Preview {
    ProfileView()
}
