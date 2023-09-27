//
//  Day_07_Arrays.swift
//  
//
//  Created by SK on 27/09/23.
//

/// Source: https://www.hackerrank.com/challenges/30-arrays/problem

/// Task:
/// Given an array A, of N integers, print A's elements in reverse order
/// as a single line of space-separated numbers.

import Foundation

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let arrTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

let arr: [Int] = arrTemp.split(separator: " ").map {
    if let arrItem = Int($0) {
        return arrItem
    } else { fatalError("Bad input") }
}

guard arr.count == n else { fatalError("Bad input") }



let reversedString = arr.reversed().map({ String(describing: $0) }).joined(separator: " ")

print(reversedString)
