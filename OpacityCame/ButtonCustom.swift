//
//  ButtonCustom.swift
//  OpacityCame
//
//  Created by Aleksandr Kurdiukov on 31.07.20.
//  Copyright © 2020 Zizlak. All rights reserved.
//

import SwiftUI

struct CustomButton: View {
    var action: () -> Void
    var text: String
    var color: UIColor
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .font(.largeTitle)
                .bold()
        }
        .frame(width: 200, height: 40)
        .foregroundColor(.black)
        .background(Color(color))
        .clipShape(Capsule())
        .overlay(Capsule().stroke(Color.white, lineWidth: 4))
        .shadow(radius: 10)
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(action: {}, text: "START", color: .systemOrange)
    }
}
