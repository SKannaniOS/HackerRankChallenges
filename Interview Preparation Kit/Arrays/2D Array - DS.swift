//
//  2D Array - DS.swift
//  
//
//  Created by SK on 03/01/24.
//

/// Source: https://www.hackerrank.com/challenges/2d-array/problem
///
/// Task:
/// An hourglass in A is a subset of values with indices falling in this pattern in arr's graphical representation:
///
/// a   b   c
///     d
/// e   f   g
///
///There are 16 hourglasses in arr. An hourglass sum is the sum of an hourglass' values. 
///Calculate the hourglass sum for every hourglass in arr, then print the maximum hourglass sum.
///The array will always be 6 X 6.

import Foundation

/*
 * Complete the 'hourglassSum' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts 2D_INTEGER_ARRAY arr as parameter.
 */

func hourglassSum(arr: [[Int]]) -> Int {
    var sums = [Int]()
    for row in 0...3 {
        for column in 0...3 {
            let value = arr[row][column] + arr[row][column + 1] + arr[row][column + 2] + arr[row + 1][column + 1] + arr[row + 2][column] + arr[row + 2][column + 1] + arr[row + 2][column + 2]
            sums.append(value)
        }
    }
    
    return sums.reduce(Int.min, {max($0, $1)})

}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

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

let result = hourglassSum(arr: arr)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)

