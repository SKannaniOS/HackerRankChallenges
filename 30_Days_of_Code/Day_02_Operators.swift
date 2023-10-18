//
//  Day_02_Operators.swift
//  
//
//  Created by SK on 22/09/23.
//

/// Source: https://www.hackerrank.com/challenges/30-operators/problem

/// Task:
/// Given the meal price (base cost of a meal), tip percent (the percentage of the meal price being added as tip),
/// and tax percent (the percentage of the meal price being added as tax) for a meal,
/// find and print the meal's total cost. Round the result to the nearest integer.

import Foundation

func solve(meal_cost: Double, tip_percent: Int, tax_percent: Int) -> Void {
    
    let tipAmount: Double = (Double(tip_percent) / 100.0) * meal_cost
    let taxAmount: Double = (Double(tax_percent) / 100.0) * meal_cost
    
    let totalCost = meal_cost + tipAmount + taxAmount
    
    print(Int(totalCost.rounded()))
}
