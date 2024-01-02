//
//  Day_11_2D_Arrays.swift
//  
//
//  Created by SK on 06/10/23.
//

/// Source: https://www.hackerrank.com/challenges/30-2d-arrays/problem

/// Task:
/// Calculate the hourglass sum for every hourglass in A, then print the maximum hourglass sum.

/// Samlpe: A
///
/// [[1, 1, 1, 0, 0, 0],
/// [0, 1, 0, 0, 0, 0],
/// [1, 1, 1, 0, 0, 0],
/// [0, 0, 2, 4, 4, 0],
/// [0, 0, 0, 2, 0, 0],
/// [0, 0, 1, 2, 4, 0]]
///
/// Answer: 19

import Foundation

var arr = [[Int]]()

for _ in 1...6 {
    guard let arrRowTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

    let arrRow: [Int] = arrRowTemp.split(separator: " ").map {
        if let arrItem = Int($0) {
            return arrItem
        } else { fatalError("Bad input") }
    }

    guard arrRow.count == 6 else { fatalError("Bad input") }

    arr.append(arrRow)
}

guard arr.count == 6 else { fatalError("Bad input") }

// Solution starts below
var allValues = [Int]()
for i in 0...3 {
    for j in 0...3 {
        let value = arr[i][j] + arr[i][j+1] + arr[i][j+2] + arr[i+1][j+1] + arr[i+2][j] + arr[i+2][j+1] + arr[i+2][j+2]
        allValues.append(value)
    }
}

print(allValues.sorted().last!)

