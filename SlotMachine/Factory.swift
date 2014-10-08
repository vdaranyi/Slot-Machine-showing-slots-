//
//  Factory.swift
//  SlotMachine
//
//  Created by Vincent on 07/10/2014.
//  Copyright (c) 2014 VD. All rights reserved.
//

import Foundation
import UIKit

class Factory {
    class func createSlots() -> [[Slot]] {
        var slots: [[Slot]] = []
        let kNumberOfContainers = 3
        let kNumberOfSlots = 3
        
        for var containerNo = 0; containerNo < kNumberOfContainers; containerNo++ {
            var slotArray: [Slot] = []
            for var slotNo = 0; slotNo < kNumberOfSlots; slotNo++ {
                var slot = Factory.createSlot(slotArray)
            }
            slots.append(slotArray)
            println("Created SlotsArray")
        }
        println("DONE: \(slots)")
        return slots
    }
    
    class func createSlot (currentCards: [Slot]) -> Slot {
        var currentValues: [Int] = []
        
        for slot in currentCards {
            currentValues.append(slot.value)
        }
        
        var randomNo = Int(arc4random_uniform(UInt32(13)))
        
        while contains(currentValues, randomNo) {
            randomNo = Int(arc4random_uniform(UInt32(13)))
        }
        
        var slot:Slot
        
        switch randomNo {
        case 0:
            slot = Slot(value: 1, image: UIImage(named: "Ace"), isRed: true)
        case 1:
            slot = Slot(value: 2, image: UIImage(named: "Two"), isRed: true)
        case 2:
            slot = Slot(value: 3, image: UIImage(named: "Three"), isRed: true)
        case 3:
            slot = Slot(value: 4, image: UIImage(named: "Four"), isRed: true)
        case 4:
            slot = Slot(value: 5, image: UIImage(named: "Five"), isRed: false)
        case 5:
            slot = Slot(value: 6, image: UIImage(named: "Six"), isRed: false)
        case 6:
            slot = Slot(value: 7, image: UIImage(named: "Seven"), isRed: true)
        case 7:
            slot = Slot(value: 8, image: UIImage(named: "Eight"), isRed: false)
        case 8:
            slot = Slot(value: 9, image: UIImage(named: "Nine"), isRed: false)
        case 9:
            slot = Slot(value: 10, image: UIImage(named: "Ten"), isRed: true)
        case 10:
            slot = Slot(value: 11, image: UIImage(named: "Jack"), isRed: false)
        case 11:
            slot = Slot(value: 12, image: UIImage(named: "Queen"), isRed: false)
        case 12:
            slot = Slot(value: 13, image: UIImage(named: "King"), isRed: true)
        default:
            slot = Slot(value: 0, image: UIImage(named: "Ace"), isRed: true)
            
        }
        println("Slot value: \(slot.value)")
        return slot
    }
    
}