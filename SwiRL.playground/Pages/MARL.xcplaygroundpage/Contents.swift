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
    var startTime = Date()
    var experienceMap: [ID: [MARLExperience<StateType, ActionType, Value>]] = [:]
    
    mutating func reset() {
        startTime = Date()
        status.value = MyEnv.initialStatus
    }
    
    mutating func step(to observation: RLType<StateType>, isTerminated: Bool = false) {
        let step = status.value.step + 1
        let delta = self.startTime.distance(to: Date())
        status.value = MARLStatus<Value, StateType>(step: step, time: delta, observation: observation, isTerminated: isTerminated)
    }
    
    // MARK: experience buffer
    
    mutating func experience(agent id: ID) -> MARLExperience<StateType, ActionType, Value>? {
        guard var experienceArray = self.experienceMap[id] else {
            return nil
        }
        let experience = experienceArray.popLast()
        self.experienceMap[id] = experienceArray
        return experience
    }
        
    mutating func callAsFunction(agent id: ID, action intended: RLType<Int>) throws {
        if status.value.isTerminated { throw MARLError.isTerminated }
        // TODO
        
        
        self.step(to: .scalar(2), isTerminated: false)
        
        
        let experience = MARLExperience<StateType, ActionType, Value>(observation: .scalar(1), action: .scalar(1), reward: 0.0, nextObservation: .scalar(2))
        
        
        var experienceArray = self.experienceMap[id] ?? []
        experienceArray.insert(experience, at: 0)
        self.experienceMap[id] = experienceArray
    }
    
    // MARK: callback
    
    mutating func callAsFunction(agent id: ID, action intended: RLType<ActionType>, callback: ((MARLExperience<StateType, ActionType, Value>) -> Void)) throws {
        if status.value.isTerminated { throw MARLError.isTerminated }
            
//    TODO:
        
        self.step(to: .scalar(2), isTerminated: false)
        
        let experience = MARLExperience<StateType, ActionType, Value>(observation: .scalar(1), action: .scalar(1), reward: 0.0, nextObservation: .scalar(2))
        
        callback(experience)
    }
    
    // MARK: async
    
    @available(macOS 12, iOS 15, *)
    mutating func callAsFunction(agent id: ID, action intended: RLType<ActionType>) async throws -> MARLExperience<StateType, ActionType, Value> {
        if status.value.isTerminated { throw MARLError.isTerminated }
            
//    TODO:
        
        self.step(to: .scalar(2), isTerminated: false)
        
        let experience = MARLExperience<StateType, ActionType, Value>(observation: .scalar(1), action: .scalar(1), reward: 0.0, nextObservation: .scalar(2))

        return experience
    }
    
    // MARK: Combine
    
    var status: CurrentValueSubject<MARLStatus<Double, Int>, Never> = CurrentValueSubject<MARLStatus<Double, Int>, Never>(initialStatus)

    
}

var myEnv = MyEnv()
myEnv.status.sink {
    print($0)
}

try? myEnv(agent: 1, action: .scalar(1)) { e in
    print(e)
}

try? myEnv(agent: 2, action: .scalar(1))
//dump(myEnv)

if let e = myEnv.experience(agent: 1) {
    print(e)
}

//await try? myEnv(agent: 2, action: .scalar(1))
//async let

//: [Next](@next)
