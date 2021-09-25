//: [Previous](@previous)

import Foundation
import SwiRL

//dump(_:name:indent:maxDepth:maxItems:)

class MyE1: RLEnv {
    
    
    typealias Value = Float
    
    typealias StateType = Float
    typealias ActionType = Float
    
    private (set) static var stateSpace: RLSpace<StateType> = .vector([0.0...10.0, 0.0...10.0, 0.0...10.0])
    private (set) static var actionSpace: RLSpace<ActionType> = .scalar(0.0...10.0)
    private (set) var isTerminated: Bool = false
    private (set) var reward: Float = 0.0
    private (set) var state: RLType<Float> = stateSpace.random()

    func reset() {
        
    }

    func callAsFunction(action intended: RLType<ActionType>) {
        //
    }

}

let mye1 = MyE1()
//dump(mye1)
print(mye1)

MyE1.actionSpace.random()
MyE1.stateSpace.random()






//: [Next](@next)
