//
//  Day_19_Interfaces.swift
//  
//
//  Created by SK on 18/10/23.
//

/// Source: https://www.hackerrank.com/challenges/30-interfaces/problem

/// Task:
/// The AdvancedArithmetic interface and the method declaration for the abstract divisorSum(n) method are provided for you in the editor below.
/// Complete the implementation of Calculator class, which implements the AdvancedArithmetic interface.
/// The implementation for the divisorSum(n) method must return the sum of all divisors of n.
///
/// Example: n = 25
/// The divisors of 25 are 1, 5, 25. Their sum is 31.

/// Solution is in C++11.

#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>
#include <string>
using namespace std;

class AdvancedArithmetic{
    public:
        virtual int divisorSum(int n)=0;
};

class Calculator : public AdvancedArithmetic {
public:
    int divisorSum(int n) {
        if (n == 1) {
            return n;
        }
        
        int sum = n;
        for (int i = 1; i <= n/2; i++) {
            if (n % i == 0) {
                sum = sum + i;
            }
        }
        return sum;
    }
};

int main(){
    int n;
    cin >> n;
    AdvancedArithmetic *myCalculator = new Calculator();
    int sum = myCalculator->divisorSum(n);
    cout << "I implemented: AdvancedArithmetic\n" << sum;
    return 0;
}
