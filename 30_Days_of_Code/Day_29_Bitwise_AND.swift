//
//  Day_29_Bitwise_AND.swift
//
//
//  Created by SK on 03/01/24.
//

/// Source: https://www.hackerrank.com/challenges/30-bitwise-and/problem
///
/// Task:
///
/// Given set S = {1, 2, 3, ...N}. Find two integers, A and B (where A less than B),
/// from set S such that the value of A&B is the maximum possible
/// and also less than a given integer, K.
/// In this case, & represents the bitwise AND operator.

import Foundation

/*
 * Complete the 'bitwiseAnd' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts following parameters:
 *  1. INTEGER N
 *  2. INTEGER K
 */

func bitwiseAnd(N: Int, K: Int) -> Int {
    // Write your code here
    var ans = 0
    
    for i in 1..<N {
        for j in i+1...N {
            if i & j < K {
                ans = ans < i & j ? i & j : ans
            }
        }
    }
    
    return ans
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let t = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

for tItr in 1...t {
    guard let firstMultipleInputTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
    let firstMultipleInput = firstMultipleInputTemp.split(separator: " ").map{ String($0) }
    
    guard let count = Int(firstMultipleInput[0])
    else { fatalError("Bad input") }
    
    guard let lim = Int(firstMultipleInput[1])
    else { fatalError("Bad input") }
    
    let res = bitwiseAnd(N: count, K: lim)
    
    fileHandle.write(String(res).data(using: .utf8)!)
    fileHandle.write("\n".data(using: .utf8)!)
}

/// Note:
/// The above solution is creating "Timeout Error" only in Swift language.
/// So I added same logic solution in Java 8 below, which is perfectly fine.

public static int bitwiseAnd(int N, int K) {
    // Write your code here
    int ans = 0;
    
    for (int i = 1; i < N; i++) {
        for (int j = i+1; j <= N; j++) {
            if ((i & j) < K) {
                ans = (ans < (i & j)) ? i & j : ans;
            }
        }
    }
    
    return ans;
}
