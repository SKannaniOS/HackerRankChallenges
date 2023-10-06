//
//  Day_12_Inheritance.swift
//  
//
//  Created by SK on 06/10/23.
//

/// Source: https://www.hackerrank.com/challenges/30-inheritance/problem

import Foundation

/// Task:
/// You are given two classes, Person and Student, where Person is the base class and Student is the derived class. 
/// Completed code for Person and a declaration for Student are provided for you in the editor.
/// Observe that Student inherits all the properties of Person.

/// Complete the Student class by writing the following:
///
/// A Student class constructor, which has 4 parameters:
///     A string, firstName.
///     A string, lastName.
///     An integer, idNumber.
///     An integer array (or vector) of test scores, scores.
///
/// A char calculate() method that calculates a Student object's average and
/// returns the grade character representative of their calculated average:
///
/// O -> 90 to 100
/// E -> 80 to 89
/// A -> 70 to 79
/// P -> 55 to 69
/// D -> 40 to 54
/// T -> 0 to 39

// Class Person
class Person {
    private let firstName: String
    private let lastName: String
    private let id: Int

    // Initializer
    init(firstName: String, lastName: String, id: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.id = id
    }

    // Print person data
    func printPerson() {
        print("Name: \(lastName), \(firstName)")
        print("ID: \(id)")
    }
} // End of class Person

// Class Student
class Student: Person {
    var testScores: [Int]

    /*
    *   Initializer
    *
    *   Parameters:
    *   firstName - A string denoting the Person's first name.
    *   lastName - A string denoting the Person's last name.
    *   id - An integer denoting the Person's ID number.
    *   scores - An array of integers denoting the Person's test scores.
    */
    // Write your initializer here
    init(firstName: String, lastName: String, id: Int, scores: [Int]) {
        self.testScores = scores
        super.init(firstName: firstName, lastName: lastName, id: id)
    }
    
    /*
    *   Method Name: calculate
    *   Return: A character denoting the grade.
    */
    // Write your method here
    func calculate() -> Character {
        let avg = self.testScores.reduce(0, +) / self.testScores.count
        switch avg {
        case 90...100:
            return "O"
        case 80..<90:
            return "E"
        case 70..<80:
            return "A"
        case 55..<70:
            return "P"
        case 40..<55:
            return "D"
        case 0..<40:
            return "T"
        default:
            return "T"
        }
    }
} // End of class Student

let nameAndID = readLine()!.components(separatedBy: " ")
let _ = readLine()
let scores = readLine()!.components(separatedBy: " ").map{ Int($0)! }

let s = Student(firstName: nameAndID[0], lastName: nameAndID[1], id: Int(nameAndID[2])!, scores: scores)

s.printPerson()

print("Grade: \(s.calculate())")
