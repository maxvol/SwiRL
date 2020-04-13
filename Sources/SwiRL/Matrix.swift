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
  
    public var print: String {
      var string = "shape: \(self.shape)\n"
      /** 2D-only */
      switch self.shape.count {
      case 1:
        for j in 0..<self.shape[0] {
          string.append("\(self[j])\t")
        }
      case 2:
        for i in 0..<self.shape[0] {
          for j in 0..<self.shape[1] {
            string.append("\(self[j])\t")
          }
          string.append("\n")
        } 
      default:
        string.append("grid: \(self.grid)\n")
      }
      return string
    }

}
