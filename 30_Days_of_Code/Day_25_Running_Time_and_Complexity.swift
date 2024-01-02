//
//  Day_25_Running_Time_and_Complexity.swift
//  
//
//  Created by SK on 03/01/24.
//

/// Source: https://www.hackerrank.com/challenges/30-running-time-and-complexity/problem

/// Task:
/// A prime is a natural number greater than 1 that has no positive divisors other than 1 and itself.
/// Given a number, n, determine and print whether it is Prime or Not prime.

/// Note: If possible, try to come up with a O(Root(n)) primality algorithm, or see what sort of optimizations you come up with for an O(n) algorithm.
/// Be sure to check out the Editorial after submitting your code.

import Foundation

// Enter your code here
let count = Int(readLine()!)!

func isPrimeNumber(_ n: Int) -> Bool {
    guard n != 2 else { return true }
    guard n > 1, n % 2 != 0 else { return false }
    return !stride(from: 3, through: Int(sqrt(Double(n))), by: 2).contains { n % $0 == 0 }
}

for _ in 0..<count {
    let n = Int(readLine()!)!
    isPrimeNumber(n) ? print("Prime") : print("Not prime")
}
