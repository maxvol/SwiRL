//
//  Space.swift
//
//
//  Created by Maxim Volgin on 24/03/2024.
//

import Foundation

//self.action_space = spaces.Discrete(3)
//self.observation_space = spaces.Box(0, 1, shape=(2,))

enum Space {
    case Discrete
    case Continuous
    var n: Int {
        0
    }
    
//    env.action_space.sample()
}
