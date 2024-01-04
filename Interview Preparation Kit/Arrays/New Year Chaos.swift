//
//  New Year Chaos.swift
//  
//
//  Created by SK on 04/01/24.
//

/// Source: https://www.hackerrank.com/challenges/new-year-chaos/problem
///
/// Task:
/// It is New Year's Day and people are in line for the Wonderland rollercoaster ride.
/// Each person wears a sticker indicating their initial position in the queue from "1" to "n".
/// Any person can bribe the person directly in front of them to swap positions, but they still wear their original sticker.
/// One person can bribe at most two others.
///
/// Determine the minimum number of bribes that took place to get to a given queue order. 
/// Print the number of bribes, or, if anyone has bribed more than two people, print "Too chaotic".
 
import Foundation

/*
 * Complete the 'minimumBribes' function below.
 *
 * The function accepts INTEGER_ARRAY q as parameter.
 */

func minimumBribes(q: [Int]) -> Void {
    
    // In this process, we are going to find who received the bribe.
    // Not who gave it.
    
    var bribes = 0
    
    for (currentIndex, value) in q.enumerated() {
        let originalIndex = value - 1

        //If the current value went more than 2 steps backward, then it's chaotic..
        if originalIndex - currentIndex > 2 {
            print("Too chaotic")
            return
        }
        
        // The current value can go backward maximum 2 steps only.
        // So we have start check the briber from 0 or 2 steps in front of him..
        
        let start = max(0, originalIndex - 2)
        let end = currentIndex
        
        for j in start..<end {
            // Only the higher value person than current value have given the bribe..
            // So if we got him, increase the bribe count..
            if q[j] > value {
                bribes += 1
            }
        }
    }

    print(bribes)
}

guard let t = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

for tItr in 1...t {
    guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

    guard let qTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

    let q: [Int] = qTemp.split(separator: " ").map {
        if let qItem = Int($0) {
            return qItem
        } else { fatalError("Bad input") }
    }

    guard q.count == n else { fatalError("Bad input") }

    minimumBribes(q: q)
}


///Note: The most simpler solution for the same above problem is below.

func minimumBribes(q: [Int]) -> Void {
    var bribes = 0
    var p1 = 1
    var p2 = 2
    var p3 = 3
    
    for p in q {
        if p == p1 {
            p1 = p2
            p2 = p3
            p3 += 1
        } else if p == p2 {
            bribes += 1
            p2 = p3
            p3 += 1
        } else if p == p3 {
            bribes += 2
            p3 += 1
        } else {
            bribes = -1
            break
        }
    }
    
    bribes == -1 ? print("Too chaotic") : print(bribes)
}
