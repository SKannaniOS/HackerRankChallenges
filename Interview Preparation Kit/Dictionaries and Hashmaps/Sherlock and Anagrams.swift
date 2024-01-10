//
//  Sherlock and Anagrams.swift
//  
//
//  Created by SK on 10/01/24.
//

/// Source: https://www.hackerrank.com/challenges/sherlock-and-anagrams/problem
///
/// Task:
/// Two strings are anagrams of each other if the letters of one string can be rearranged to form the other string.
/// Given a string, find the number of pairs of substrings of the string that are anagrams of each other.

import Foundation

/*
 * Complete the 'sherlockAndAnagrams' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts STRING s as parameter.
 */

func sherlockAndAnagrams(s: String) -> Int {
    var substrings = [String: Int]()
    for i in 0...s.count {
        var str = ""
        let start = s.index(s.startIndex, offsetBy: i)
        for j in 0 ... s.count - i {
            let end = s.index(start, offsetBy: j)
            str = String(s[start..<end])
            if !str.isEmpty {
                str = String(str.sorted())
                substrings[str] = (substrings[str] ?? 0) + 1
            }
        }
    }
    
    var count = 0
    for (_, v) in substrings {
        if v > 1 {
            count += v * (v - 1) / 2
        }
    }
    
    return count
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let q = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

for qItr in 1...q {
    guard let s = readLine() else { fatalError("Bad input") }

    let result = sherlockAndAnagrams(s: s)

    fileHandle.write(String(result).data(using: .utf8)!)
    fileHandle.write("\n".data(using: .utf8)!)
}

