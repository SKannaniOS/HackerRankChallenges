//
//  Day_01_Data_Types.swift
//  
//
//  Created by SK on 21/09/23.
//

/// Source: https://www.hackerrank.com/challenges/30-data-types/problem

/// Task:
/// Complete the code in the editor below. The variables i,d, and s are already declared and initialized for you. You must:
///
/// - Declare  variables: one of type int, one of type double, and one of type String.
/// - Read  lines of input from stdin (according to the sequence given in the Input Format section below) and initialize your  variables.
///
/// - Use the + operator to perform the following operations:
///     - Print the sum of  plus your int variable on a new line.
///     - Print the sum of  plus your double variable to a scale of one decimal place on a new line.
///     - Concatenate  with the string you read as input and print the result on a new line.
///

import Foundation

var i = 4
var d = 4.0
var s = "HackerRank "

// Declare second integer, double, and String variables.
var ii = 0
var dd = 0.0
var ss = ""

// Read and save an integer, double, and String to your variables.
 ii = Int(readLine()!) ?? 0
 dd = Double(readLine()!) ?? 0.0
 ss = String(readLine()!)

// Print the sum of both integer variables on a new line.
print(i+ii)

// Print the sum of the double variables on a new line.
print(d+dd)

// Concatenate and print the String variables on a new line
// The 's' variable above should be printed first.
print(s+ss)
