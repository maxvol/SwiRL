//
//  RLException.swift
//  SwiRL
//
//  Created by Maxim Volgin on 11/10/2020.
//

import Foundation

public enum RLException: Error {
    case maxQ(message: String)
    case argmaxQ(message: String)
}
