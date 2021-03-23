//
//  Graph.swift
//  
//
//  Created by Maxim Volgin on 22/03/2021.
//

import Foundation

public protocol Vertex {
    associatedtype ID: Hashable
        
    var id: ID { get }
}

public protocol Edge {
    associatedtype ID: Hashable

    var from: ID { get }
    var to: ID { get }
}

public protocol Graph {
    associatedtype V: Vertex
    associatedtype E: Edge where E.ID == V.ID
    
    var vertices: [V] { get }
    var edges: [E] { get }
}

// TODO: adjacenty (A), degree (D), laplacian (L = D - A)

// MARK: - render

public extension Vertex {
    func render() -> String {
        "\tV\(id);"
    }
}

public extension Edge {
    func render() -> String {
        "\tV\(from) -> V\(to);"
    }
}

public extension Graph {
    func render() -> String {
        var gv = ["digraph G {"]
        for v in vertices {
            gv.append(v.render())
        }
        for e in edges {
            gv.append(e.render())
        }
        gv.append("}")
        return gv.joined(separator: "\n")
    }
}


// MARK: - test

struct Entry: Vertex {
    typealias ID = UUID
    
    let id: UUID = UUID()
}

struct Relation: Edge {
    typealias ID = UUID

    var from: UUID
    var to: UUID
}

struct Storage: Graph {
    typealias V = Entry
    typealias E = Relation

    var vertices: [Entry]
    var edges: [Relation]
}


