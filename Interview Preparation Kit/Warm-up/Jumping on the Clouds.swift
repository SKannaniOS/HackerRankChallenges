//
//  Jumping on the Clouds.swift
//  
//
//  Created by SK on 04/01/24.
//

/// Source: https://www.hackerrank.com/challenges/jumping-on-the-clouds/problem
///
/// Task:
/// There is a new mobile game that starts with consecutively numbered clouds. Some of the clouds are thunderheads and others are cumulus. 
/// The player can jump on any cumulus cloud having a number that is equal to the number of the current cloud plus 1 or 2.
/// The player must avoid the thunderheads.
/// Determine the minimum number of jumps it will take to jump from the starting postion to the last cloud. It is always possible to win the game.
/// For each game, you will get an array of clouds numbered  if they are safe or  if they must be avoided.
///
/// Example:
/// Input : [0, 0, 1, 0, 0, 1, 0]
/// Output : 4

import Foundation

/*
 * Complete the 'jumpingOnClouds' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts INTEGER_ARRAY c as parameter.
 */

func jumpingOnClouds(c: [Int]) -> Int {
    var step = 0
    var idx = 0
    
    let unsafeIndexes = c.enumerated().compactMap { $1 == 1 ? $0 : nil }
    while idx < c.count {
        if !unsafeIndexes.contains(idx+2), idx+2 < c.count {
            step += 1
            idx += 2
        } else if !unsafeIndexes.contains(idx+1), idx+1 < c.count {
            step += 1
            idx += 1
        } else {
            break
        }
    }
    
    return step
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let cTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

let c: [Int] = cTemp.split(separator: " ").map {
    if let cItem = Int($0) {
        return cItem
    } else { fatalError("Bad input") }
}

guard c.count == n else { fatalError("Bad input") }

let result = jumpingOnClouds(c: c)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)

