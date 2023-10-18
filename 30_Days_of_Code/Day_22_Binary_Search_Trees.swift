//
//  Day_22_Binary_Search_Trees.swift
//  
//
//  Created by SK on 18/10/23.
//

/// Source: https://www.hackerrank.com/challenges/30-binary-search-trees

/// Task:
/// The height of a binary search tree is the number of edges between the tree's root and its furthest leaf.
/// You are given a pointer, "root", pointing to the root of a binary search tree.
/// Complete the getHeight function provided in your editor so that it returns the height of the binary search tree.

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

    func getHeight(root: Node?) -> Int {
        // Solution....
        guard let root = root else { return -1 }
        
        let left = self.getHeight(root: root.left)
        let right = self.getHeight(root: root.right)
        
        return max(left, right) + 1
    } // End of getHeight function


} // End of Tree class

var root: Node?
let tree = Tree()

let t = Int(readLine()!)!

for _ in 0..<t {
    root = tree.insert(root: root, data: Int(readLine()!)!)
}

print(tree.getHeight(root: root))

