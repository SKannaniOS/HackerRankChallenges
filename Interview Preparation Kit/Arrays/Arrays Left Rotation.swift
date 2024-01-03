//
//  Arrays Left Rotation.swift
//  
//
//  Created by SK on 04/01/24.
//

/// Source: https://www.hackerrank.com/challenges/ctci-array-left-rotation/problem
///
/// Task:
/// A left rotation operation on an array shifts each of the array's elements 1 unit to the left.
/// For example, if 2 left rotations are performed on array [1, 2, 3, 4, 5], then the array would become [3, 4, 5, 1, 2].
/// Note that the lowest index item moves to the highest index in a rotation.
/// This is called a circular array.
/// Given an array "a" of "n" integers and a number "d" , perform "d" left rotations on the array. Return the updated array to be printed as a single line of space-separated integers.

import Foundation

/*
 * Complete the 'rotLeft' function below.
 *
 * The function is expected to return an INTEGER_ARRAY.
 * The function accepts following parameters:
 *  1. INTEGER_ARRAY a
 *  2. INTEGER d
 */

func rotLeft(a: [Int], d: Int) -> [Int] {
    var processing = a
    for _ in 1...d {
        let removed = processing.removeFirst()
        processing.append(removed)
    }
    return processing
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let firstMultipleInputTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
let firstMultipleInput = firstMultipleInputTemp.split(separator: " ").map{ String($0) }

guard let n = Int(firstMultipleInput[0])
else { fatalError("Bad input") }

guard let d = Int(firstMultipleInput[1])
else { fatalError("Bad input") }

guard let aTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

let a: [Int] = aTemp.split(separator: " ").map {
    if let aItem = Int($0) {
        return aItem
    } else { fatalError("Bad input") }
}

guard a.count == n else { fatalError("Bad input") }

let result = rotLeft(a: a, d: d)

fileHandle.write(result.map{ String($0) }.joined(separator: " ").data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)

