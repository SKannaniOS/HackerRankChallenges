//
//  Day_04_Class _vs._instance.swift
//  
//
//  Created by SK on 25/09/23.
//

/// Source: https://www.hackerrank.com/challenges/30-class-vs-instance/problem

/// Task:
/// Write a Person class with an instance variable, "age", and a constructor that takes an integer, "initialAge", as a parameter. 
/// The constructor must assign "initialAge" to "age" after confirming the argument passed as "initalAge" is not negative.
/// If a negative argument is passed as "initialAge", the constructor should set "age" to 0 and print "Age is not valid, setting age to 0.".
/// 
/// In addition, you must write the following instance methods:
///     a. yearPasses() should increase the "age" instance variable by 1.
///     b. amIOld() should perform the following conditional actions:
///         - If age less than 13, print You are young..
///         - If age greater than or equal to 13 and less than 18, print You are a teenager..
///         - Otherwise, print You are old..

import Foundation

class Person {
    var age: Int = 0

    init(initialAge: Int) {
        // Add some more code to run some checks on initialAge
        self.age = initialAge < 0 ? 0 : initialAge
        
        if initialAge < 0 {
            print("Age is not valid, setting age to 0.")
        }
    }

    func amIOld() {
        // Do some computations in here and print out the correct statement to the console
        if self.age < 13 {
            print("You are young.")
        } else if 13...17  ~= self.age {
            print("You are a teenager.")
        } else {
            print("You are old.")
        }
    }

    func yearPasses() {
        // Increment the age of the person in here
        self.age += 1
    }
}

let t = Int(readLine()!)!
