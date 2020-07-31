//
//  ContentView.swift
//  OpacityCame
//
//  Created by Aleksandr Kurdiukov on 31.07.20.
//  Copyright © 2020 Zizlak. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alfa = 0.0
    @State var value = 99
    
    @State private var alertBool = false
    @State var randomNumber = Int.random(in: 0...100)
    
    
    var body: some View {
        VStack {
            Text("Move your slider to the point: \(randomNumber)")
            
            HStack {
                Text("0")
                SliderUIKit(alfa: alfa, value: $value, randomNumber: $randomNumber)
                Text("100")
            }.padding()
            
            CustomButton(action: { self.alertBool = true },
                         text: "CHECK", color: .systemOrange)
                .padding(.bottom, 50)
                .alert(isPresented: $alertBool) {
                    Alert(title: Text(
                        "Your Score: \(StandartMethods.computeScore(randomNumber: randomNumber,sliderValue: value).twoDigitsInt())"),
                          dismissButton: .default(Text("Got it!")))
            }
            
            
            CustomButton(action: {
                self.randomNumber = Int.random(in: 0...100)
            }, text: "RESTART", color: .systemBlue)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
