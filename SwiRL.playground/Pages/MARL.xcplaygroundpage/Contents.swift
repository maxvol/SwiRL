//: [Previous](@previous)

import Foundation
import Combine
import SwiRL

struct MyEnv: MARLEnvironment {
    typealias ID = Int
    typealias Value = Double
    typealias StateType = Int
    typealias ActionType = Int
    
    static var stateSpace: RLSpace<Int> = RLSpace<Int>.scalar(1...5)
    static var actionSpace: RLSpace<Int> = RLSpace<Int>.scalar(1...5)
    
    private static let initialStatus = MARLStatus<Double, Int>(step: 0, time: 0.0, observation: .scalar(3), isTerminated: false)
    private var time = Date()
    private var experienceMap: [ID: [MARLExperience<StateType, ActionType, Value>]] = [:]
    
    mutating func reset() {
        time = Date()
        status.value = MyEnv.initialStatus
    }
    
    mutating func callAsFunction(agent id: ID, action intended: RLType<Int>) {
        // TODO
        
        let time = Date()
        let delta = self.time.distance(to: time)
        let step = status.value.step + 1
        
        status.value = MARLStatus<Double, Int>(step: step, time: delta, observation: .scalar(3), isTerminated: false)
        
        
        let experience = MARLExperience<StateType, ActionType, Value>(observation: .scalar(1), action: .scalar(1), reward: 0.0, nextObservation: .scalar(2))
        
        
        var experienceArray = self.experienceMap[id] ?? []
        experienceArray.append(experience)
        self.experienceMap[id] = experienceArray
    }
    
    var status: CurrentValueSubject<MARLStatus<Double, Int>, Never> = CurrentValueSubject<MARLStatus<Double, Int>, Never>(initialStatus)

    
}

var myEnv = MyEnv()
myEnv.status.sink {
    print($0)
}
myEnv(agent: 1, action: .scalar(1))
//dump(myEnv)

//: [Next](@next)
