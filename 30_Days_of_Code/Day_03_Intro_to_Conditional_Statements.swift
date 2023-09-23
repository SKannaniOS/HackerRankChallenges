//
//  Day_03_Intro_to_Conditional_Statements.swift
//  
//
//  Created by SK on 23/09/23.
//

///Source: https://www.hackerrank.com/challenges/30-conditional-statements/problem

///Task
///Given an integer, , perform the following conditional actions:

///If N is odd, print Weird
///If N is even and in the inclusive range of 2 to 5, print Not Weird
///If N is even and in the inclusive range of 6 to 20, print Weird
///If N is even and greater than 20, print Not Weird
///Complete the stub code provided in your editor to print whether or not  is weird.

import Foundation

guard let N = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

if N % 2 != 0 {
    print("Weird")
} else {
    if N >= 2, N <= 5 {
        print("Not Weird")
    }
    if N >= 6, N <= 20 {
        print("Weird")
    }
    if N > 20 {
        print("Not Weird")
    }
}
