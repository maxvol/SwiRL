//: [Previous](@previous)

import Foundation
import Combine
import SwiRL

struct MyEnv: MARLEnvironment {
    typealias Value = Double
    typealias StateType = Int
    typealias ActionType = Int
    
    static var stateSpace: RLSpace<Int> = RLSpace<Int>.scalar(1...5)
    static var actionSpace: RLSpace<Int> = RLSpace<Int>.scalar(1...5)
    
    private static let initialStatus = MARLStatus<Double, Int>(step: 0, time: 0.0, observation: .scalar(3), isTerminated: false)
    private var time = Date()
    
    mutating func reset() {
        time = Date()
        status = initialStatus
    }
    
    func callAsFunction(action intended: RLType<Int>) {
        
    }
    
    var status: CurrentValueSubject<MARLStatus<Double, Int>, Never> = CurrentValueSubject<MARLStatus<Double, Int>, Never>(initialStatus)

    
}

let myEnv = MyEnv()

//: [Next](@next)
