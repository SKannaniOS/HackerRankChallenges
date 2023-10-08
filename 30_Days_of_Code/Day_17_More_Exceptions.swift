//
//  Day_17_More_Exceptions.swift
//  
//
//  Created by SK on 08/10/23.
//

///Source: https://www.hackerrank.com/challenges/30-more-exceptions/problem

/// Task:
/// Write a Calculator class with a single method: int power(int,int). 
/// The power method takes two integers, n and p, as parameters and returns the integer result of n power(p).
/// If either n or p is negative, then the method must throw an exception with the message: n and p should be non-negative.

import Foundation

// Defining enum for throwing error
// throw RangeError.NotInRange... is used to throw the error
enum RangeError : Error {
    case NotInRange(String)
}

// Start of class Calculator
class Calculator {
    // Start of function power
    func power(n: Int, p: Int) throws -> Int {
        guard n >= 0, p >= 0 else {
            throw RangeError.NotInRange("n and p should be non-negative")
        }
        
        var result = 1
        for _ in 0..<p {
            result *= n
        }
        return result

    } // End of function power
} // End of class Calculator

let myCalculator = Calculator()
let t = Int(readLine()!)!

for _ in 0..<t {
    let np = readLine()!.components(separatedBy: " ").map{ Int($0)! }
    let n = np[0]
    let p = np[1]

    do {
        let ans = try myCalculator.power(n: n, p: p)
        print(ans)
    } catch RangeError.NotInRange(let errorMsg) {
        print(errorMsg)
    }
}

