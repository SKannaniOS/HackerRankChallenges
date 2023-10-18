//
//  Day_24_More_Linked_Lists.swift
//  
//
//  Created by SK on 19/10/23.
//

/// Source: https://www.hackerrank.com/challenges/30-linked-list-deletion/problem

/// Task:
/// A Node class is provided for you in the editor. A Node object has an integer data field, "data", and a Node instance pointer, "next", 
/// pointing to another node (i.e.: the next node in a list).
///
/// A removeDuplicates function is declared in your editor, which takes a pointer to the "head" node of a linked list as a parameter.
/// Complete removeDuplicates so that it deletes any duplicate nodes from the list and returns the head of the updated list.
///
/// Note: The "head" pointer may be null, indicating that the list is empty. Be sure to reset your "next" pointer 
/// when performing deletions to avoid breaking the list.

import Foundation

// Start of class Node
class Node {
    var data: Int
    var next: Node?

    init(d: Int) {
        data = d
    }
} // End of class Node

// Start of class LinkedList
class LinkedList {
    func insert(head: Node?, data: Int) -> Node? {
        if head == nil {
            return Node(d: data)
        }

        head?.next = insert(head: head?.next, data: data)

        return head
    }

    func display(head: Node?) {
        if head != nil {
            print(head!.data, terminator: " ")

            display(head: head?.next)
        }
    }
    
    // Start of function removeDuplicates
    func removeDuplicates(head: Node?) -> Node? {
        // Solution...
        if head?.next == nil {
            return head
        }
        
        if head?.data == head?.next?.data {
            var processing = head
            while processing?.data == processing?.next?.data {
                processing = processing?.next
            }
            head?.next = processing?.next
        }
        
        head?.next = removeDuplicates(head: head?.next)
        return head
    } // End of function removeDuplicates
} // End of class LinkedList

var head: Node?
let linkedList = LinkedList()

let t = Int(readLine()!)!

for _ in 0..<t {
    head = linkedList.insert(head: head, data: Int(readLine()!)!)
}

linkedList.display(head: linkedList.removeDuplicates(head: head))

