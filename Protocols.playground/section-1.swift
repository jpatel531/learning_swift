// Playground - noun: a place where people can play

import Cocoa
import Foundation

@objc protocol Speaker {
    func Speak()
    optional func TellJoke()
}

class Vicki : Speaker {
    func Speak(){
        println("Hello, I am VIcki!")
    }
}

class Ray : Speaker {
    func Speak(){
        println("Yo, I am Ray!")
    }
}

// inheritance and protocols: 

class Animal {
    
}

class Dog : Animal, Speaker {
    func Speak(){
        println("Woof!")
    }
}

var speaker:Speaker

speaker = Ray()
speaker.Speak()


// speaker.WriteTutorial() // error!
//(speaker as Ray).writeTutorial()

//This means you can only call methods on speaker that exist in the Speaker protocol, so calling WriteTutorial would be an error even though speaker is actually of type Ray. You can call WriteTutorial if you cast speaker back to Ray temporarily though, as you see here.

speaker = Vicki()

speaker.Speak()

//speaker.tellJoke?()
//These lines use use a technique called optional chaining to do this. If you put a ? mark after the method name, it will check if it exists before calling it. If it does not exist, it will behave as if you’ve called a method that returns nil.

speaker = Dog()

//speaker.tellJoke?()


class DateSimulator {
    
    let a : Speaker
    let b : Speaker
    
    var delegate:DateSimulatorDelegate?
    
    init(a: Speaker, b: Speaker){
        self.a = a
        self.b = b
    }
    
    func simulate(){
        delegate?.dateSimulatorDidStart(self, a: self.a, b: self.b)
        println("Off to dinner...")
        a.Speak()
        b.Speak()
        println("Walking back home...")
        a.TellJoke?()
        b.TellJoke?()
        delegate?.dateSimulatorDidEnd(self, a: self.a, b: self.b)
    }
    
}

protocol DateSimulatorDelegate {
    func dateSimulatorDidStart(sim: DateSimulator, a: Speaker, b:Speaker)
    func dateSimulatorDidEnd(sim: DateSimulator, a: Speaker, b:Speaker)
}

class LoggingDateSimulator:DateSimulatorDelegate {
    func dateSimulatorDidStart(sim: DateSimulator, a: Speaker, b: Speaker) {
        println("Date started!")
    }
    
    func dateSimulatorDidEnd(sim: DateSimulator, a: Speaker, b: Speaker) {
        println("Date ended")
    }
}

let sim = DateSimulator(a: Vicki(), b: Ray())
sim.delegate = LoggingDateSimulator()
sim.simulate()









