//
//  Graph.swift
//  
//
//  Created by Maxim Volgin on 22/03/2021.
//

import Foundation

public protocol Vertex: Hashable {
    associatedtype ID: Hashable
        
    var id: ID { get }
    
    func render() -> String
}

public protocol Edge: Hashable {
    associatedtype ID: Hashable

    var from: ID { get }
    var to: ID { get }
    
    func render() -> String
}

public protocol Graph {
    associatedtype V: Vertex
    associatedtype E: Edge where E.ID == V.ID
    
    var vertices: Set<V> { get }
    var edges: Set<E> { get }
    
    func render() -> String
}

// TODO: adjacenty (A), degree (D), laplacian (L = D - A)

// MARK: - hash

public extension Vertex {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

public extension Edge {
    func hash(into hasher: inout Hasher) {
        func hash(into hasher: inout Hasher) {
            hasher.combine(from)
            hasher.combine(to)
        }
    }
}

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

    var vertices: Set<Entry>
    var edges: Set<Relation>
}


