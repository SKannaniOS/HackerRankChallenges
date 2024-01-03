//
//  Day_28_RegEx_Patterns_and_Intro_to_Databases.swift
//  
//
//  Created by SK on 03/01/24.
//

/// Source: https://www.hackerrank.com/challenges/30-regex-patterns/problem

/// Task:
///
/// Consider a database table, Emails, which has the attributes First Name and Email ID.
/// Given N rows of data simulating the Emails table, print an alphabetically-ordered list of people
/// whose email address ends in @gmail.com.

import Foundation

guard let N = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

var names = [String]() // add a variable to store names

for NItr in 1...N {
    guard let firstMultipleInputTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
    let firstMultipleInput = firstMultipleInputTemp.split(separator: " ").map{ String($0) }

    let firstName = firstMultipleInput[0]

    let emailID = firstMultipleInput[1]
    
    if emailID.hasSuffix("@gmail.com") { // append the names whose emailID ends with "@gmail.com"
        names.append(firstName)
    }
}

let namesToPrint = names.sorted().joined(separator: "\n") //Create a single string to avoid the extra loop...
print(namesToPrint)
