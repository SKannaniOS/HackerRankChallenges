//
//  Day_06_Let's_Review.swift
//  
//
//  Created by SK on 26/09/23.
//

/// Source: https://www.hackerrank.com/challenges/30-review-loop/problem

/// Task:
/// Given a string S, of N length that is indexed from 0 to N-1,
/// print its even-indexed and odd-indexed characters as 2 space-separated strings
/// on a single line

import Foundation

func printEvenAndOdd(string: String) {
    
    fputs("string: " + string + "\n", stderr)
    
    let evenString = string.enumerated().filter({ $0.0 % 2 == 0 }).map({ String($0.element) }).joined()
    let oddString = string.enumerated().filter({ $0.0 % 2 != 0 }).map({ String($0.element) }).joined()
    
    print("\(evenString) \(oddString)")
}
