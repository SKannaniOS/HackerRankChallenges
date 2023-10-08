//
//  Day_16_Exceptions-String_to_Integer.swift
//  
//
//  Created by SK on 08/10/23.
//

/// Source: https://www.hackerrank.com/challenges/30-exceptions-string-to-integer/problem

/// Task:
/// Read a string, S, and print its integer value; if S cannot be converted to an integer, print Bad String using exception handling.

import Foundation

/*
 * Define an ErrorType
 */
enum StringToIntTypecastingError: Error {
    case BadString
}

func stringToInt(inputString: String) throws -> Int {
    guard let value = Int(inputString) else {
        throw StringToIntTypecastingError.BadString
    }
    return value
}

/*
 * Read the input
 */
let inputString = "a"

do {
    try print(stringToInt(inputString: inputString))
} catch StringToIntTypecastingError.BadString {
    print("Bad String")
}


