//
//  ContentView.swift
//  OpacityCame
//
//  Created by Aleksandr Kurdiukov on 31.07.20.
//  Copyright © 2020 Zizlak. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alfa = 1.0
    @State var value = 30.0
    
    var randomNumber = Int.random(in: 0...100)
    
    
    var body: some View {
        VStack {
            Text("Move your slider to the point: \(randomNumber)")
            
            SliderUIKit(alfa: $alfa, value: $value)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension ContentView {
    
    private func computeScore() -> Double {
        let difference = abs(randomNumber - lround(value))
        return Double(100 - difference) / 100
    }
}
