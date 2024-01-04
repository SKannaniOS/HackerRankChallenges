//
//  Array Manipulation.swift
//  
//
//  Created by SK on 04/01/24.
//

/// Source: https://www.hackerrank.com/challenges/crush/problem
///
/// Task:
/// Starting with a 1-indexed array of zeros and a list of operations, for each operation add a value to each the array element between two given indices, inclusive. 
/// Once all operations have been performed, return the maximum value in the array.
///
/// Example:
///     n = 10
///     queries: [[1, 5, 3], [4, 8, 7], [6, 9, 1]]
///
///     index->      1  2  3  4  5  6  7  8  9  10
///                 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
///                 [3, 3, 3, 3, 3, 0, 0, 0, 0, 0]
///                 [3, 3, 3, 10,10, 7, 7, 7, 0, 0]
///                 [3, 3, 3, 10,10, 8, 8, 8, 1, 0]
///
///     Large value: 10

import Foundation

/*
 * Complete the 'arrayManipulation' function below.
 *
 * The function is expected to return a LONG_INTEGER.
 * The function accepts following parameters:
 *  1. INTEGER n
 *  2. 2D_INTEGER_ARRAY queries
 */

func arrayManipulation(n: Int, queries: [[Int]]) -> Int {
    
    var array = Array(repeating: 0, count: n)
    var result = Int.min
    
    for q in queries {
        let start = q[0] - 1
        let end = q[1] - 1
        let value = q[2]
        
        array[start] += value
        if end + 1 < n {
            array[end+1] -= value
        }
    }
    
    var cursor = 0
    for a in array {
        cursor += a
        result = max(result, cursor)
    }
    
    return result
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let firstMultipleInputTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
let firstMultipleInput = firstMultipleInputTemp.split(separator: " ").map{ String($0) }

guard let n = Int(firstMultipleInput[0])
else { fatalError("Bad input") }

guard let m = Int(firstMultipleInput[1])
else { fatalError("Bad input") }

var queries = [[Int]]()

for _ in 1...m {
    guard let queriesRowTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

    let queriesRow: [Int] = queriesRowTemp.split(separator: " ").map {
        if let queriesItem = Int($0) {
            return queriesItem
        } else { fatalError("Bad input") }
    }

    guard queriesRow.count == 3 else { fatalError("Bad input") }

    queries.append(queriesRow)
}

guard queries.count == m else { fatalError("Bad input") }

let result = arrayManipulation(n: n, queries: queries)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)


/// Note:
///     The above solution is the most prefered solution to avoid the "Timeout Error".
///     The following solution will be the actual algorithmic one.

func arrayManipulation1(n: Int, queries: [[Int]]) -> Int {
    
    var array = Array(repeating: 0, count: n)
    
    for q in queries {
        let start = q[0] - 1
        let end = q[1] - 1
        let value = q[2]
        
        for i in start...end {
            array[i] += value
        }
    }
    
    return array.max() ?? 0
}
