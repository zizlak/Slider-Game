//
//  StandartMethods.swift
//  OpacityCame
//
//  Created by Aleksandr Kurdiukov on 31.07.20.
//  Copyright © 2020 Zizlak. All rights reserved.
//

import Foundation

class StandartMethods{
    
    static func computeScore(randomNumber: Int, sliderValue: Int) -> Double {
        var diff = Double(randomNumber) - Double(sliderValue)
        if diff < 0 {
            diff = -diff
        }

        return 1.0 - (diff/100)
    }
    
}

extension Double{
    
    func twoDigitsInt() -> Int{
        Int(self*100)
    }
}
