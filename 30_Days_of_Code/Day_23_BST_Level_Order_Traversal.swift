//
//  Day_23_BST_Level_Order_Traversal.swift
//  
//
//  Created by SK on 18/10/23.
//

/// Source: https://www.hackerrank.com/challenges/30-binary-trees/problem

/// Task:
/// A level-order traversal, also known as a breadth-first search, visits each level of a tree's nodes from left to right, top to bottom. 
/// You are given a pointer, root, pointing to the root of a binary search tree. Complete the levelOrder function provided in your editor
/// so that it prints the level-order traversal of the binary search tree.
///
/// Hint: You'll find a queue helpful in completing this challenge.

import Foundation

// Start of Node class
class Node {
    var data: Int
    var left: Node?
    var right: Node?

    init(d : Int) {
        data  = d
    }
} // End of Node class

// Start of Tree class
class Tree {
    func insert(root: Node?, data: Int) -> Node? {
        if root == nil {
            return Node(d: data)
        }

        if data <= (root?.data)! {
            root?.left = insert(root: root?.left, data: data)
        } else {
            root?.right = insert(root: root?.right, data: data)
        }

        return root
    }

    func levelOrder(root: Node?) -> Void {
        // Solution...
        guard let root = root else { return }
        var queue = [Node]()
        queue.append(root)
        
        while !queue.isEmpty {
            let current = queue.removeFirst()
            
            print(current.data, terminator: " ")
            
            if let leftNode = current.left {
                queue.append(leftNode)
            }
            
            if let rightNode = current.right {
                queue.append(rightNode)
            }
        }
    } // End of levelOrder function


} // End of Tree class

var root: Node?
let tree = Tree()

let t = Int(readLine()!)!

for _ in 0..<t {
    root = tree.insert(root: root, data: Int(readLine()!)!)
}

tree.levelOrder(root: root)
