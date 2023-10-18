//
//  Day_21_Generics.swift
//  
//
//  Created by SK on 18/10/23.
//

/// Source: https://www.hackerrank.com/challenges/30-generics

/// Task:
/// Write a single generic function named printArray; this function must take an array of generic elements as a parameter
/// (the exception to this is C++, which takes a vector). The locked Solution class in your editor tests your function.

import Foundation

struct Printer<T> {
    /**
    *    Name: printArray
    *    Print each element of the generic array on a new line. Do not return anything.
    *    @param A generic array
    **/
    
    // Write your code here
    
    func printArray(array: [T]) {
        array.forEach { print($0) }
    }
    
}


var n = Int(readLine()!)!
var intArray = Array(repeating: 0, count: n);
for i in 0...n - 1 {
    intArray[i] = Int(readLine()!)!;
}

n = Int(readLine()!)!
var stringArray = Array(repeating: "", count: n);
for i in 0...n - 1 {
    stringArray[i] = readLine()!;
}

Printer<Int>().printArray(array: intArray)
Printer<String>().printArray(array: stringArray)
