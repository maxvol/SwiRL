//
//  Global.swift
//  SwiRL
//
//  Created by Maxim Volgin on 26/01/2020.
//

public typealias Value = Double
public typealias Reward = Value
public typealias Return = Value

public protocol State {
    var id: Int { get }
    var isTerminal: Bool { get }
}

public protocol Action {}

public protocol Agent {
    func step(reward: Value, state: State)
}

public protocol Policy {}

public protocol Environment {}

public protocol Algorithm {
    func backup(reward: Value, state: State)
}
