//
//  Counting Valleys.swift
//  
//
//  Created by SK on 03/01/24.
//

/// Source: https://www.hackerrank.com/challenges/counting-valleys/problem
///
/// Task:
/// An avid hiker keeps meticulous records of their hikes. During the last hike that took exactly "steps" steps.
/// For every step it was noted if it was an uphill, U, or a downhill, D step.
/// Hikes always start and end at sea level, and each step up or down represents a 1 unit change in altitude.
/// We define the following terms:
///     * A mountain is a sequence of consecutive steps above sea level, starting with a step up from sea level and ending with a step down to sea level.
///     * A valley is a sequence of consecutive steps below sea level, starting with a step down from sea level and ending with a step up to sea level.
/// Given the sequence of up and down steps during a hike, find and print the number of valleys walked through.

import Foundation

/*
 * Complete the 'countingValleys' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts following parameters:
 *  1. INTEGER steps
 *  2. STRING path
 */

func countingValleys(steps: Int, path: String) -> Int {
    var val = 0
    var step = 0
    for s in path {
        let lastStep = step
        step = s == "U" ? step + 1 : step - 1
        
        if lastStep == 0, step == -1 {
            val += 1
        }
    }
    return val
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let steps = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let path = readLine() else { fatalError("Bad input") }

let result = countingValleys(steps: steps, path: path)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
