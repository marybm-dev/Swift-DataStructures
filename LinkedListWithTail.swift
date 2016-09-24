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
    public func insert(_ value: T) {
        
        if self.isEmpty() {
            head = Node(value)
            tail = head
        }
        else {
            tail?.next = Node(value)
            tail = tail?.next
        }
    }
    
    public func insertAfter(_ element: T, value: T) -> Bool {
        
        if self.isEmpty() {
            return false
        }
        
        if let result = find(element) {
            if result === tail {
                result.next = Node(value)
                tail = result.next
            }
            else {
                let temp = result.next
                let newNode = Node(value)
                newNode.next = temp
                result.next = newNode
            }
            return true
        }
        
        return false
    }
    
    public func delete(_ value: T) -> Bool {
        
        if self.isEmpty() {
            return false
        }
        
        if let result = find(value) {
            if result === head && result === tail {
                head = result.next
                tail = head
            }
            else if result === head {
                head = result.next
            }
            else if result === tail {
                if let link = findLink(to: value) {
                    link.next = nil
                    tail = link
                }
                else {
                    return false
                }
            }
            else {
                if let link = findLink(to: value) {
                    let victim = link.next
                    link.next = victim?.next
                }
                else {
                    return false
                }
            }
            return true
        }
        
        return false
    }
}
