//
//  ITP.swift
//
//
//  Created by Maxim Volgin on 23/03/2024.
//

import Foundation

// https://en.wikipedia.org/wiki/Markov_kernel

// C = (X, G, W, P, D, A, T)
// X, G, W - measurable spaces
// P: WxX->X, D: XxG->G, A: GxW->W - markovian kernels
// T - totally ordered set
// X - experiences
// G - actions
// W - world
// P - perception
// D - decision
// A - action
// T - counter, increments with each decision


