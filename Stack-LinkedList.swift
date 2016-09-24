//
//  Stack-LinkedList.swift
//  
//
//  Created by Mary Martinez on 9/24/16.
//
//

import Foundation

class LinkedListNode<T> {
    
    var value : T
    var next  : LinkedListNode?
    
    init(_ value: T) {
        self.value = value
    }
}

class LinkedList<T> {
    public typealias Node = LinkedListNode<T>
    
    private var head: Node?
    
    public func isEmpty() -> Bool {
        return head == nil
    }
    
    public func count() -> Int {
        
        if self.isEmpty() {
            return 0
        }
        
        var count = 0
        var currentNode = head
        while (currentNode != nil) {
            count += 1
            currentNode = currentNode.next
        }
        
        return count
    }
    
    public func push(value: T) {
        
        if self.isEmpty() {
            head = Node(value)
        }
        else {
            let newNode = Node(value)
            newNode.next = head
            head = newNode
        }
    }
    
    
}
