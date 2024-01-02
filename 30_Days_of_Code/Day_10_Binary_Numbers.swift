//
//  Day_10_Binary_Numbers.swift
//  
//
//  Created by SK on 06/10/23.
//

/// Source: https://www.hackerrank.com/challenges/30-binary-numbers/problem

/// Task:
/// Given a base-10 integer, n, convert it to binary (base-2).
/// 
/// Then find and print the base-10 integer denoting the maximum number of consecutive 1's in n's binary representation. When working with different bases, it is common to show the base as a subscript.

import Foundation

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

let result = String(n, radix: 2).split(separator: "0").sorted().last!.count
print(result)
