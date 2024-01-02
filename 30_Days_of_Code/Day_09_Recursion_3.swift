//
//  Day_09_Recursion_3.swift
//  
//
//  Created by SK on 06/10/23.
//

/// Source: https://www.hackerrank.com/challenges/30-recursion/problem

/// Task:
/// Complete the factorial function in the editor below. Be sure to use recursion.
/// factorial has the following paramter:
///     int n: an integer
/// Returns
///     int: the factorial of n

/// Note: If you fail to use recursion or fail to name your recursive function factorial or Factorial, you will get a score of 0.

import Foundation

let n = Int(readLine()!)!

func factorial(n: Int) -> Int {
    guard n != 1 else { return n }
    return n * factorial(n: n - 1)
}

print(factorial(of: n))
