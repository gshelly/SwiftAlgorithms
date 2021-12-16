import UIKit

//
//  SinglyLinkedList.swift
//  SwiftAlgorithms
//
//  Created by Shelly Gupta on 12/14/21.
//

import Foundation

public class Node {
    var value: String
    var next: Node?
    weak var perviousNode: Node?
    
    init(value: String) {
        self.value = value
    }
}

public class LinkedList {
    private var head: Node?
    private var tail: Node?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var nodeCount: Int {
        var count = 0
        var node = head
        while node != nil {
            node = node?.next
            count += 1
        }
        return count
    }
    
    func append(value: String) {
        let newNode = Node(value: value)
        
        if let tailNode = tail {
            newNode.perviousNode = tailNode
            tailNode.next = newNode
        }
        else {
            head = newNode
        }
        tail = newNode
    }
    
    func removeAll() {
        head = nil
        tail = nil
    }
    func deleteFirstNode() {
        head = head?.next
    }
    
    func deleteNode(nodeIndex: Int) {
        var currentNode = head
        var currentIndex = 0
        
        while currentNode != nil && !isEmpty {
            if nodeIndex == 0 {
                head = currentNode?.next
                break;
            }
            
            if currentIndex == nodeIndex {
                currentNode?.perviousNode?.next = currentNode?.next
                currentNode?.next?.perviousNode = currentNode?.perviousNode
                currentNode?.next == nil ? tail = currentNode?.perviousNode : nil
                currentNode?.next = nil
                currentNode?.perviousNode = nil
                break;
            }
            else {
                currentNode = currentNode?.next
                currentIndex += 1
            }
            
        }
    }
    
    func appendAtIndex(_ value: String, _ nodeIndex: Int) {
        let newNode = Node(value: value)
        var currentNode = head
        var currentIndex = 0
        
        while currentNode != nil {
            
            if nodeIndex == 0 {
                if nodeCount == 0 {
                    head = newNode
                    break
                }
                else {
                    newNode.next = head
                    head?.perviousNode = newNode
                    head = newNode
                    break
                }
            }
            if currentIndex == nodeIndex {
                let currentNodePrev = currentNode?.perviousNode
                currentNode?.perviousNode?.next = newNode
                currentNode?.perviousNode = newNode
                newNode.perviousNode = currentNodePrev
                newNode.next = currentNode
            }
            currentNode = currentNode?.next
            
            currentIndex += 1
        }
    }
    
    func appendAtlast(_ value: String) {
        let newNode =  Node(value: value)
        if tail != nil {
            tail?.next = newNode
            newNode.perviousNode = tail
            newNode.next = nil
            tail = newNode
        }
    }
    
    func reversed() {
        var currentNode = tail
        var temp: Node? = Node(value: "")
        while currentNode != nil {
            temp = currentNode?.next
            currentNode?.next = currentNode?.perviousNode
            print(currentNode?.perviousNode?.value)
            currentNode = currentNode?.perviousNode
            currentNode?.perviousNode = temp
            
            print(currentNode?.value)
        }
    }
}

extension LinkedList: CustomStringConvertible {
    // 2
    public var description: String {
        // 3
        var text = "["
        var node = head
        // 4
        while node != nil {
            text += "\(String(describing: node!.perviousNode?.value)) -> \(node!.value) -> \(String(describing: node!.next?.value))"
            node = node!.next
            if node != nil { text += "\n" }
        }
        // 5
        return text + "]"
    }
}

let namesList = LinkedList()
namesList.append(value: "Shelly")
namesList.append(value: "Jatin")
namesList.append(value: "Tinky")
namesList.append(value: "Linku")
////namesList.removeAll()
//print(namesList)
//namesList.deleteNode(nodeIndex: 2)
namesList.appendAtIndex("Mike", 0)
print(namesList)
print(namesList.nodeCount)
//namesList.appendAtlast("Larry")
print(namesList)
print(namesList.nodeCount)

namesList.reversed()
print(namesList)
