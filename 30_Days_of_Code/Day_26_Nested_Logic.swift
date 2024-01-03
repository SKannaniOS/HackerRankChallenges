//
//  Day_26_Nested_Logic.swift
//  
//
//  Created by SK on 03/01/24.
//

/// Source: https://www.hackerrank.com/challenges/30-nested-logic/problem

/// Task:
/// Your local library needs your help! Given the expected and actual return dates for a library book, create a program that calculates the fine (if any). 
/// The fee structure is as follows:
///
/// 1. If the book is returned on or before the expected return date, no fine will be charged (i.e.: fine = 0).
///
/// 2. If the book is returned after the expected return day but still within the same calendar month and year as the expected return date,
/// fine = 15 Hackos * (number of days late).
///
/// 3. If the book is returned after the expected return month but still within the same calendar year as the expected return date, the .
/// fine = 500 Hackos * (number of months late).
///
/// 4. If the book is returned after the calendar year in which it was expected, there is a fixed fine of 10000 Hackos.

import Foundation

let rDate = readLine()!.components(separatedBy: " ").compactMap { Int($0) }
let dDate = readLine()!.components(separatedBy: " ").compactMap { Int($0) }

var fine = 0

if rDate[2] > dDate[2] {
    fine = 10000
} else if rDate[1] > dDate[1], rDate[2] == dDate[2] {
    fine = 500 * (rDate[1] - dDate[1])
} else if rDate[0] > dDate[0], rDate[1] == dDate[1], rDate[2] == dDate[2] {
    fine = 15 * (rDate[0] - dDate[0])
} else {
    fine = 0
}

print(fine)
