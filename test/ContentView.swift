//
//  ContentView.swift
//  test
//
//  Created by Siya Choudhary on 1/12/23.
//

import SwiftUI

var foodList = [String]()

struct ContentView: View {
    @State private var foodAdded = ""
    var body: some View {
        VStack {
            Section{
                Text("My Grocery Helper")
                    .foregroundColor(Color.mint)
                    .fontWeight(.bold)
                    .font(.system(size: 30))
                TextField("Grocery Item", text: $foodAdded)
                    .padding()
                    .background(Color(red: 250 / 255, green: 243 / 255, blue: 250 / 255))
                    .cornerRadius(10)
                    .foregroundColor(Color.black)
                Button("Add to list", action: {
                    foodList.append(foodAdded)
                    for food in foodList {
                        print(food)
                    }
                    foodAdded = ""
                })
                .padding(10)
                .background(Color.mint)
                .foregroundColor(Color.white)
                .cornerRadius(10)
            }.padding(.bottom)
        
            Divider()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            
            List{
                ForEach(foodList, id: \.self){ myFood in
                    HStack {
                        Text(myFood).padding()
                        Section{
                            Button(" x ", action:{
                                if let index = foodList.firstIndex(of: myFood) {
                                    foodList.remove(at: index)
                                    
                                }
                            })
                            .padding(5)
                            .background(Color.red)
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                        }
                    }
                }
            }.cornerRadius(10)
            
            Spacer()
            Spacer()
            
            Button("Clear List", action: {
                foodList.removeAll()
            })
            .padding(10)
            .background(Color.mint)
            .foregroundColor(Color.white)
            .cornerRadius(10)
        }
        .padding(30)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
