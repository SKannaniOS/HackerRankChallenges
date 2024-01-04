//
//  Minimum Swaps 2.swift
//  
//
//  Created by SK on 04/01/24.
//

/// Source: https://www.hackerrank.com/challenges/minimum-swaps-2/problem
///
/// Task:
/// You are given an unordered array consisting of consecutive integers [1, 2, 3, ..., n] without any duplicates.
/// You are allowed to swap any two elements.
/// Find the minimum number of swaps required to sort the array in ascending order.

import Foundation

// Complete the minimumSwaps function below.
func minimumSwaps(arr: [Int]) -> Int {
    var swaps = 0
    var array = arr
    
    for i in array.indices {
        while array[i] != i+1 {
            let temp = array[i]
            array[i] = array[temp - 1]
            array[temp - 1] = temp
            swaps += 1
        }
    }
    
    return swaps
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let arrTemp = readLine() else { fatalError("Bad input") }
let arr: [Int] = arrTemp.split(separator: " ").map {
    if let arrItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return arrItem
    } else { fatalError("Bad input") }
}

guard arr.count == n else { fatalError("Bad input") }

let res = minimumSwaps(arr: arr)

fileHandle.write(String(res).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)

