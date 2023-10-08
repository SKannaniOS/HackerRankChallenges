//
//  Day_18_Queues_and_Stacks.swift
//  
//
//  Created by SK on 08/10/23.
//

/// Source: https://www.hackerrank.com/challenges/30-queues-stacks/problem

/// Task:
/// We must first take each character in "s", enqueue it in a queue, and also push that same character onto a stack.
/// Once that's done, we must dequeue the first character from the queue and pop the top character off the stack, then compare the two characters to see if they are the same.
/// As long as the characters match, we continue dequeueing, popping, and comparing each character until our containers are empty (a non-match means "s" isn't a palindrome).

import Foundation

class Solution {
  //Write your code here
      var stack: [Character]
    var queue: [Character]
    
    init() {
        self.stack = [Character]()
        self.queue = [Character]()
    }
    
    func pushCharacter(ch: Character) {
        self.stack.append(ch)
    }
    
    func popCharacter() -> Character{
        return self.stack.removeLast()
    }
    
    func enqueueCharacter(ch: Character) {
        self.queue.append(ch)
    }
    
    func dequeueCharacter() -> Character{
        return self.queue.removeFirst()
    }
}

// read the string s.
let s = readLine()!

// create the Solution class object p.
let obj = Solution()

// push/enqueue all the characters of string s to stack.
for character in s {
    obj.pushCharacter(ch: character)
    obj.enqueueCharacter(ch: character)
}


var isPalindrome = true

// pop the top character from stack.
// dequeue the first character from queue.
// compare both the characters.
for _ in 0..<(s.count / 2) {
    if obj.popCharacter() != obj.dequeueCharacter() {
        isPalindrome = false

        break
    }
}

// finally print whether string s is palindrome or not.
if isPalindrome {
    print("The word, \(s), is a palindrome.")
} else {
    print("The word, \(s), is not a palindrome.")
}
