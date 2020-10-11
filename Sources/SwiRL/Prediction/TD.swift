//
//  TD.swift
//  
//
//  Created by Maxim Volgin on 11/08/2020.
//

import Foundation

//public protocol TD {
//    
//    associatedtype A: RLAction1
//    
//    func Q(_ S: RLState1, _ A: A) -> RLValue
//    
//    func targetQ() -> RLValue
//    
//    func target(Rₜ₊₁: RLValue, ɣ: RLValue) -> RLValue
//    
//    func error(QSₜAₜ: RLValue, Rₜ₊₁: RLValue, ɣ: RLValue) -> RLValue
//    
//    /** @return Q(St, At) */
//    func backup(Sₜ: RLState1, Aₜ: A, Rₜ₊₁: RLValue, ɣ: RLValue, 𝛼ₜ: RLValue) -> RLValue
//    
//}
//
//public class TDAbstract<A: RLAction1>: TD {
//    
//    public func Q(_ S: RLState1, _ A: A) -> RLValue { 0.0 } // abstract
//    
//    public func targetQ() -> RLValue { 0.0 } // abstract
//    
//    public func target(Rₜ₊₁: RLValue, ɣ: RLValue) -> RLValue {
//        Rₜ₊₁ + ɣ * targetQ()
//    }
//    
//    public func error(QSₜAₜ: RLValue, Rₜ₊₁: RLValue, ɣ: RLValue) -> RLValue {
//        target(Rₜ₊₁: Rₜ₊₁, ɣ: ɣ) - QSₜAₜ
//    }
//    
//    /** @return Q(St, At) */
//    public func backup(Sₜ: RLState1, Aₜ: A, Rₜ₊₁: RLValue, ɣ: RLValue, 𝛼ₜ: RLValue) -> RLValue {
//        let QSₜAₜ = Q(Sₜ, Aₜ)
//        return QSₜAₜ + 𝛼ₜ * error(QSₜAₜ: QSₜAₜ, Rₜ₊₁: Rₜ₊₁, ɣ: ɣ)
//    }
//    
//}
//
//public class SARSA1<A: RLAction1>: TDAbstract<A> {
//    
//    public override func targetQ() -> RLValue {
////        Q(Sₜ₊₁, Aₜ₊₁)
//        0.0
//    }
//    
//}
//
//public class QLearning1<A: RLAction1>: TDAbstract<A> {
//    
//    public override func targetQ() -> RLValue {
////        maxₐQ(Sₜ₊₁, a)
//        0.0
//    }
//    
//}
//
//public struct TD1 {
//    /** @return Vt+1(St) */
////    public static func target(Rₜ₊₁: RLValue, Sₜ₊₁: RLState1, ɣ: RLValue = 1.0) -> RLValue {
////        Rt+1 + ɣ*Vt(St+1)
////        return state.isTerminal ? 0.0 : reward + self.discount * self.value(state: state)
////    }
//    
//    
////    public static func error() -> RLValue {
////        TD.target() - Vt(St)
////    }
//    
//    /** Vt+1(St) */
////    public func backup() -> RLValue {
////        Vt(St) + 𝛼t * TD.error()
////    }
//    
//}
