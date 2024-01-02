//
//  Day_08_Dictionaries_and_Maps.swift
//  
//
//  Created by SK on 06/10/23.
//

/// Source: https://www.hackerrank.com/challenges/30-dictionaries-and-maps/problem

/// Task:
/// Given "n" names and phone numbers, assemble a phone book that maps friends' names to their respective phone numbers.
/// You will then be given an unknown number of names to query your phone book for.
/// For each "name" queried, print the associated entry from your phone book on a new line in the form name=phoneNumber;
/// if an entry for "name" is not found, print "Not found" instead.
/// Note: Your phone book should be a Dictionary/Map/HashMap data structure.

import Foundation

// Enter your code here. Read input from STDIN. Print output to STDOUT

var n = Int(readLine()!)!
var phoneBook = [String: String]()

for _ in 0..<n {
    let user = readLine()!
    let entry = user.split(separator: " ").compactMap({ String($0)})
    
    phoneBook[entry[0]] = entry[1]
}

var query = ""

repeat {
    query = readLine() ?? ""
    guard !query.isEmpty else { break }
    if let number = phoneBook[query] {
        print("\(query)=\(number)")
    } else {
        print("Not found")
    }
    
}while !query.isEmpty
