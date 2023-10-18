//
//  Day_20_Sorting.swift
//  
//
//  Created by SK on 18/10/23.
//

/// Source: https://www.hackerrank.com/challenges/30-sorting/problem

/// Task:
/// Given an array a, of size n distinct elements, sort the array in ascending order using the Bubble Sort algorithm above. Once sorted, print the following 3 lines:
///     * Array is sorted in numSwaps swaps.
///         where "numSwaps" is the number of swaps that took place.
///     * First Element: firstElement
///         where "firstElement" is the first element in the sorted array.
///     * Last Element: lastElement
///         where "lastElement" is the last element in the sorted array.
///
/// Hint: To complete this challenge, you will need to add a variable that keeps a running tally of all swaps that occur during execution.

import Foundation

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let aTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

let a: [Int] = aTemp.split(separator: " ").map {
    if let aItem = Int($0) {
        return aItem
    } else { fatalError("Bad input") }
}

guard a.count == n else { fatalError("Bad input") }

// Write your code here

var swaps = 0
var array = a
let limit = n - 1

for i in 0 ... limit {
    for j in 0 ..< limit - i {
        if array[j] > array[j + 1] {
            let temp = array[j]
            array[j] = array[j + 1]
            array[j + 1] = temp
            
            swaps += 1
        }
    }
}

print("Array is sorted in \(swaps) swaps.")
print("First Element: \(array[0])")
print("Last Element: \(array[limit])")
