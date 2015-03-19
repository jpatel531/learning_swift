//
//  TipCalculatorModel.swift
//  TipCalculator
//
//  Created by Jamie Patel on 19/03/2015.
//  Copyright (c) 2015 Jamie Patel. All rights reserved.
//

import Foundation

class TipCalculatorModel {
    
    var total: Double
    var taxPct: Double
    var subtotal: Double {
        get {
            return total / (taxPct + 1)
        }
    }
    
    init(total: Double, taxPct: Double){
        self.total = total
        self.taxPct = taxPct
    }
    
    func calcTipWithTipPct(tipPct: Double) -> Double {
        return subtotal * tipPct
    }
    
    
    func returnPossibleTips() -> [Int: Double] {
        let possibleTipsInfered = [0.15, 0.18, 0.20]
        
        var retval = [Int:Double]()
        
        for possibleTip in possibleTipsInfered {
            let intPct = Int(possibleTip*100)
            
            retval[intPct] = calcTipWithTipPct(possibleTip)
        }
        
        return retval
    }
    
}