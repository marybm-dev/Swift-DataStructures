//
//  LinkedListWithTail.swift
//  
//
//  Created by Mary Martinez on 9/24/16.
//
//

import Foundation

class LinkedListNode<T: Equatable> {
    
    var value : T
    var next  : LinkedListNode?
    
    init(_ value: T) {
        self.value = value
    }
}

class LinkedList<T: Equatable> {
    public typealias Node = LinkedListNode<T>
    
    private var head: Node?
    private var tail: Node?
    
    public func isEmpty() -> Bool {
        return head == nil && tail == nil
    }
    
    public func find(_ value: T) -> Node? {
        
        if self.isEmpty() {
            return nil
        }
        
        var current = head
        while current != nil {
            if current!.value == value {
                return current
            }
            current = current?.next
        }
        
        return nil
    }
    
    public func findLink(to value: T) -> Node? {
        
        if self.isEmpty() {
            return nil
        }
        
        var current = head
        var next = head?.next
        while current != nil && next != nil {
            if next!.value == value {
                return current
            }
            current = next
            next = next?.next
        }
        
        return nil
    }
}
