//
//  MARLEnvironment.swift
//  
//
//  Created by Maxim Volgin on 25/09/2021.
//

import Foundation
#if canImport(Combine)
import Combine
#endif

//typealias RLActionSpace

public protocol MARLEnvironment {
    associatedtype ID: Comparable, Hashable
    associatedtype Value: RLValue
    //    associatedtype Action: RLAction
    //    associatedtype Observation: RLObservation
    //    associatedtype Experience: RLExperience
    associatedtype StateType: Comparable
    associatedtype ActionType: Comparable
    
    static var stateSpace: RLSpace<StateType> { get }
    static var actionSpace: RLSpace<ActionType> { get }
    
//    var isTerminated: Bool { get }
//    var reward: Value { get }
//    var state: RLType<StateType> { get }
    
    mutating func reset() // -> RLStep<Observation, Value>
        
    mutating func step(to observation: RLType<StateType>, isTerminated: Bool)
    
//    func step(action intended: Action) -> RLStep<Observation, Value>

    /** goes to exp */
    mutating func callAsFunction(agent id: ID, action intended: RLType<ActionType>)
    
    // MARK: callback
//    func callAsFunction(agent id: ID, action intended: RLType<ActionType>) // -> RLStep<Observation, Value>

    // MARK: async/await
    #if swift(>=5.5)
//    func callAsFunction(action intended: RLType<ActionType>) async throws -> RLStep<Observation, Value>
    #endif
    
    // MARK: Combine
    #if canImport(Combine)
    var status: CurrentValueSubject<MARLStatus<Value, StateType>, Never> { get }
    #endif

}

public extension MARLEnvironment {
}

// range ~= value
// overlaps
// my turn?
// range isEmpty
// clamp(to:
// equals mask

// action masks for state for given agent
// masks for state and action_space, also for particular agent
// encode/decode state & actions

// perform and store to buffer
// get stored experiences

// TimeInterval = Double
// update -> state, isFinal/isTerminated,
// experience -> observation: Observation, action: Action, reward: Value, nextObservation: Observation, isFinal: Bool
// multiagent?
// timestep? seq or ts

// perform(a, exp_callback: s, a, r, n, f)
// subs(state_callback: s, f/t)


//func fetchImages() async throws -> [UIImage] {
//enum Result<Success, Failure> where Failure : Error {
//
//    /// A success, storing a `Success` value.
//    case success(Success)
//
//    /// A failure, storing a `Failure` value.
//    case failure(Failure)
//}


//class Game: ObservableObject {
//
//    private(set) static var playerHuman = Player(name: "HUMAN")
//    private(set) static var playerAgent = Player(name: "AGENT")
//
//    @Published private(set) var humanState: GameState { didSet { Game.playerHuman.respond(to: humanState, of: self )} }
//    @Published private(set) var agentState: GameState { didSet { Game.playerAgent.respond(to: agentState, of: self )} }

//var current = CurrentValueSubject<Int, Never>(10)
//var passthrough = PassthroughSubject<Int, Never>()
//
//current.send(1)
//passthrough.send(1)
//
//current.sink(receiveValue: { print($0) })
//passthrough.sink(receiveValue: { print($0) })

//Output, Failure> where Failure : Error

//https://www.hackingwithswift.com/articles/233/whats-new-in-swift-5-5
