//
//  TwoSum.swift
//  SwiftAlgorithms
//
//  Created by Shelly Gupta on 12/14/21.
//

import Foundation

func twoSum(_ nums:[Int], _ target: Int) -> [Int] {
    var dict = [Int:Int]()
    
    for (index, num) in nums.enumerated() {
        let complement = target - num
        
        if let complementIndex = dict[complement] {
            return [complementIndex, index]
        }
        dict[num] = index
    }
    
    return []
}
