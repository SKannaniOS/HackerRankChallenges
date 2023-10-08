//
//  Day_14_Scopes.swift
//  
//
//  Created by SK on 08/10/23.
//

/// Source: https://www.hackerrank.com/challenges/30-scope/problem

/// Task:
/// Complete the Difference class by writing the following:
///     - A class constructor that takes an array of integers as a parameter and
///     saves it to the _elements instance variable.
///
///     - A computeDifference method that finds the maximum absolute difference
///     between any 2 numbers in  and stores it in the _maximumDifference instance variable.

import Foundation

class Difference {
    private var elements = [Int]()
    var maximumDifference: Int
    
    // Write your code here
    
    init(a: [Int]) {
        self.elements = a
        self.maximumDifference = 0
    }
    
    func computeDifference() {
        for i in self.elements {
            for j in self.elements.dropFirst() {
                let difference = abs(i - j)
                self.maximumDifference = self.maximumDifference > difference ? self.maximumDifference : difference
            }
        }
    }
    
} // End of Difference class

let n = Int(readLine()!)!
let a = readLine()!.components(separatedBy: " ").map{ Int($0)! }

let d = Difference(a: a)

d.computeDifference()

print(d.maximumDifference)
