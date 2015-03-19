// Playground - noun: a place where people can play

import Cocoa

//let tutorialTeam = 60.5
//let editorialTeam = 17

let priceInferred = 19.99
let priceExplicit: Double = 19.99

let onSaleInferred = true
let onSaleExplicit: Bool = false

let nameInferred = "Whoppie Cushion"

let nameExplicit: String = "Whoopie Cushions"

if onSaleInferred {
    println("\(nameInferred) on sale for \(priceInferred)!")
} else {
    println("\(nameInferred) at regular price: \(priceInferred)!")
}



class TipCalculator {
 
    let total: Double
    let taxPct: Double
    let subtotal: Double
    
//    let possibleTipsInferred = [0.15, 0.18, 0.20]
    
//    let possibleTipsExplicit:[Double] = [0.15, 0.18, 0.20]

    
    init(total: Double, taxPct: Double){
        self.total = total
        self.taxPct = taxPct
        
        subtotal = total / (taxPct + 1)
    }
    
    func calcTipWithTipPct(tipPct: Double) -> Double {
        return subtotal * tipPct
    }
 
    func printPossibleTips(){
//        for possibleTip in possibleTipsInferred {
//println("\(possibleTip*100)%: \(calcTipWithTipPct(possibleTip))")
//        }
        
    }
    
    func returnPossibleTips() -> [Int: Double] {
        let possibleTipsInfered = [0.15, 0.18, 0.20]
        
        let possibleTipsExplicit:[Double] = [0.15, 0.18, 0.20]
        
        var retval = [Int:Double]()
        
        for possibleTip in possibleTipsInfered {
            let intPct = Int(possibleTip*100)
            
            retval[intPct] = calcTipWithTipPct(possibleTip)
        }
        
        return retval
    }
    
}

let tipCalc = TipCalculator(total: 33.25, taxPct: 0.06)

tipCalc.printPossibleTips()

tipCalc.returnPossibleTips()




