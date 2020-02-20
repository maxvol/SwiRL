//
//  Matrix.swift
//  SwiRL
//
//  Created by Maxim Volgin on 20/02/2020.
//
import Foundation

public struct Matrix<T: Numeric> {
  var grid: [T] = []
  public let shape: [Int]
  public var count: Int { get { self.shape.reduce(1,*) } }

  public init(_ value: T, shape: Int...) {
    self.shape = shape
    self.grid = Array(repeating: value, count: self.count)
  }

  func indexIsValid(_ index: [Int]) -> Bool {
    return zip(index, self.shape)
      .map { (i: Int, count: Int) -> Bool in i < count }
      .reduce(true) { (s, v) -> Bool in s && v }
  }

  func index(_ index: [Int]) -> Int {
    // i * J * K + j * K + k
    var location = 0
    for (i, j) in index.enumerated() {
      let tail = shape[(i + 1)...]
      let multiplier = tail.reduce(1, *)
      location += j * multiplier
    }
    return location
  }

  public subscript(_ index: Int...) -> T {
        get {
            assert(indexIsValid(index), "Index out of range")
            return grid[self.index(index)]
        }
        set {
            assert(indexIsValid(index), "Index out of range")
            grid[self.index(index)] = newValue
        }
    }

}
