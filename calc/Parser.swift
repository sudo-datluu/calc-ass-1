//
//  Parser.swift
//  calc
//
//  Created by David on 27/2/2024.
//  Copyright © 2024 UTS. All rights reserved.
//

import Foundation
class Parser {
    
    let operators: [String] = ["+", "-", "x", "/", "%"] // allowed operators
    var prev = false // check if the previous input is an operator
    var inputs : [Any] = [] // array of input elements
    
    // Parse agrs and save to inputs
    func parseArgs (args: [String]) -> [Any] {
        for arg in args {
            if !prev {self.parseNum(numStr: arg)}
            else {self.parseOp(op: arg)}
        }
        return self.inputs
    }
    
    // Parse operator
    func parseOp (op: String) {
        if (!operators.contains(op)) {Ultility.exitProgram("Invalid operation: " + op)}
        self.inputs.append(op)
        self.prev = false // Mark the previous input is an operator
    }
    
    func parseNum (numStr: String) {
        if let num = Int(numStr) {
            self.inputs.append(num)
            self.prev = true // Mark the previous input is a number
            return
        }
        Ultility.exitProgram("Invalid number") // If the input is not a number
    }
}
