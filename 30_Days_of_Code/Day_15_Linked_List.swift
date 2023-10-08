//
//  Day_15_ Linked_List.swift
//  
//
//  Created by SK on 08/10/23.
//

/// Source: https://www.hackerrank.com/challenges/30-linked-list/problem

/// Task:
/// Complete the insert function in your editor so that it creates a new Node (pass "data" as the Node constructor argument) and 
/// inserts it at the tail of the linked list referenced by the  "head" parameter.
/// Once the new node is added, return the reference to the "head" node.
///
/// Note: The  argument is null for an empty list.
/// Input: [2, 3, 4, 1]

import Foundation

class Node {
    let data: Int
    var next: Node?

    init(data: Int) {
        self.data = data
    }
}

func insert(head: Node?, data: Int!) -> Node? {
    // Solution starts here..
    
    let newNode = Node(data: data)
    
    guard let head = head else { return newNode }
    
    var current = head
    while let next = current.next {
        current = next
    }
    current.next = newNode
    return head
}

func display(head: Node?) {
    var current = head

    while current != nil {
        print(current!.data, terminator: " ")
        current = current!.next
    }
}

var head: Node?
let n: Int = Int(readLine()!)!

for _ in 0..<n {
    let element = Int(readLine()!)!
    head = insert(head: head, data: element)
}

display(head: head)
