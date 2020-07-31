//
//  Slider.swift
//  OpacityCame
//
//  Created by Aleksandr Kurdiukov on 31.07.20.
//  Copyright © 2020 Zizlak. All rights reserved.
//

import SwiftUI

struct SliderUIKit: UIViewRepresentable {

    @Binding var alfa: Double
    @Binding  var value: Double
    
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
        uiView.alpha = CGFloat(alfa)
        
    }
    
    func makeCoordinator() -> SliderUIKit.Coordinator {
        Coordinator(value: $value)
    }
    
}

extension SliderUIKit {
    class Coordinator: NSObject {
        @Binding var value: Double
        
        init(value: Binding<Double>){
            self._value = value
        }
        
        @objc func valueChanged(sender: UISlider) {
            
            value = Double(sender.value)
        }
    }
}




struct Slider_Previews: PreviewProvider {
    static var previews: some View {
        SliderUIKit(alfa: .constant(0.4), value: .constant(50))
    }
}
