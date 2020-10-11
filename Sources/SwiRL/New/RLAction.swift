//
//  RLAction.swift
//  SwiRL
//
//  Created by Maxim Volgin on 10/10/2020.
//

import Foundation

// may be related to particular state or not
public protocol RLAction: CaseIterable {
    associatedtype ID: Hashable
        
    var id: ID { get }
}

