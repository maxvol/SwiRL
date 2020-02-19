//: [Previous](@previous)

import Foundation

struct Function<Input, Output> {
    let raw: (Input) -> Output
    
    init(_ raw: @escaping (Input) -> Output) {
        self.raw = raw
    }
    
    func callAsFunction(_ input: Input) -> Output {
        raw(input)
    }
}

extension Function where Input == Void {
    func callAsFunction() -> Output {
        raw(Void())
    }
}

extension Function {
    func combined(with value: Input) -> Function<Void, Output> {
        Function<Void, Output> { self.raw(value) }
    }
    
    func chained<T>(to next: @escaping (Output) -> T) -> Function<Input, T> {
        Function<Input, T> { next(self.raw($0)) }
    }
}


let f = Function<Double, Double>( { x -> Double in pow(x, 2.0) } )
f(2.0)







//: [Next](@next)
