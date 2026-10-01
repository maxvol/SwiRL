//
//  Transition.swift
//
//
//  Created by Maxim Volgin on 24/03/2024.
//

import Foundation

struct Transition {
    var probability: Double
    var next_state: SO
    var reward: Double
    var done: Bool
}
