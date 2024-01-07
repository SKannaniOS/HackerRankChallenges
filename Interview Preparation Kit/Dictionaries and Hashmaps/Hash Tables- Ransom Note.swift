//
//  Hash Tables- Ransom Note.swift
//  
//
//  Created by SK on 07/01/24.
//

/// Source: https://www.hackerrank.com/challenges/ctci-ransom-note/problem
///
/// Task: Given the words in the magazine and the words in the ransom note.
/// Print "Yes" if he can replicate his ransom note exactly using whole words from the magazine;
/// otherwise, print No.

/// Example
/// magazine = "attack at dawn"  ransom note = "Attack at dawn"
/// The magazine has all the right words, but there is a case mismatch. The answer is Yes.

import Foundation

/*
 * Complete the 'checkMagazine' function below.
 *
 * The function accepts following parameters:
 *  1. STRING_ARRAY magazine
 *  2. STRING_ARRAY note
 */

func checkMagazine(magazine: [String], note: [String]) -> Void {
    // Write your code here
    var magazineDict = [String: Int]()
    magazine.forEach {
        magazineDict[$0] = (magazineDict[$0] ?? 0) + 1
    }
    
    var noteDict = [String: Int]()
    note.forEach {
        noteDict[$0] = (noteDict[$0] ?? 0) + 1
    }
    
    var canFrame = true
    
    for (n, c) in noteDict {
        if (magazineDict[n] ?? 0) < c {
            canFrame = false
            break
        }
    }
    
    print(canFrame ? "Yes": "No")
}

guard let firstMultipleInputTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
let firstMultipleInput = firstMultipleInputTemp.split(separator: " ").map{ String($0) }

guard let m = Int(firstMultipleInput[0])
else { fatalError("Bad input") }

guard let n = Int(firstMultipleInput[1])
else { fatalError("Bad input") }

guard let magazineTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

let magazine: [String] = magazineTemp.split(separator: " ").map {
    String($0)
}

guard magazine.count == m else { fatalError("Bad input") }

guard let noteTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

let note: [String] = noteTemp.split(separator: " ").map {
    String($0)
}

guard note.count == n else { fatalError("Bad input") }

checkMagazine(magazine: magazine, note: note)

