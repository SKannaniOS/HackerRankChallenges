//
//  Day_05_Loops.swift
//  
//
//  Created by SK on 25/09/23.
//

/// Source: https://www.hackerrank.com/challenges/30-loops/problem
///
/// Task:
/// Given an integer n, print its first 10 multiples. 
/// Each multiple n x i (where i 1...10) should be printed on a new line in the form:
/// n x i = result.

import Foundation

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

for i in 1...10 {
    print("\(n) x \(i) = \(n * i)")
}
