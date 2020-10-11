//
//  RLState.swift
//  SwiRL
//
//  Created by Maxim Volgin on 10/10/2020.
//

import Foundation

// manifest variables, manifestation of state
public protocol RLObservation {
}

// also latent variables
public protocol RLState: RLObservation {
    associatedtype ID: Hashable
        
    var id: ID { get }
}


