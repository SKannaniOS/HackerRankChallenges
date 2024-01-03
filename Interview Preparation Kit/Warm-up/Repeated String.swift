//
//  Repeated String.swift
//  
//
//  Created by SK on 04/01/24.
//

/// Source: https://www.hackerrank.com/challenges/repeated-string/problem
///
/// Task:
/// There is a string, s, of lowercase English letters that is repeated infinitely many times. Given an integer, n, find and print the number of letter a's in the first n letters of the infinite string.

import Foundation

/*
 * Complete the 'repeatedString' function below.
 *
 * The function is expected to return a LONG_INTEGER.
 * The function accepts following parameters:
 *  1. STRING s
 *  2. LONG_INTEGER n
 */

func repeatedString(s: String, n: Int) -> Int {
    var count = s.filter { $0 == "a"}.count
    
    let mul = n / s.count
    count = count * mul
    
    if (n % s.count != 0) {
        let remainig = n - (s.count * mul)
        let extra = s.prefix(remainig)
        count = count + extra.filter { $0 == "a"}.count
    }
    
    return count
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let s = readLine() else { fatalError("Bad input") }

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

let result = repeatedString(s: s, n: n)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)

