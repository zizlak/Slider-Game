//
//  Slider.swift
//  OpacityCame
//
//  Created by Aleksandr Kurdiukov on 31.07.20.
//  Copyright © 2020 Zizlak. All rights reserved.
//

import SwiftUI

struct SliderUIKit: UIViewRepresentable {
    
    @State var alfa: Double
    @Binding var value: Int
    @Binding var randomNumber: Int
    
    func makeUIView(context: Context) -> UISlider {
        
        let slider = UISlider(frame: .zero)
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.alpha = CGFloat(alfa)
        slider.value = Float(value)
        slider.tintColor = .systemRed
        slider.thumbTintColor = .systemRed
        
        slider.addTarget(context.coordinator,
                         action: #selector(Coordinator.valueChanged),
                         for: .valueChanged)
        
        return slider
        
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        
        uiView.value = Float(value)
        uiView.alpha = CGFloat(StandartMethods.computeScore(
            randomNumber: randomNumber,
            sliderValue: value))

        
    }
    
    func makeCoordinator() -> SliderUIKit.Coordinator {
        Coordinator(value: $value)
    }
}

extension SliderUIKit {
    class Coordinator: NSObject {
        @Binding var value: Int
        
        init(value: Binding<Int>){
            self._value = value
        }
        
        @objc func valueChanged(sender: UISlider) {
            
            value = Int(sender.value)
        }
    }
}

struct Slider_Previews: PreviewProvider {
    static var previews: some View {
        SliderUIKit(alfa: 0.4, value: .constant(50), randomNumber: .constant(20))
    }
}



