//
//  Parser.swift
//  calc
//
//  Created by David on 27/2/2024.
//  Copyright © 2024 UTS. All rights reserved.
//

import Foundation
class Parser {
    
    let operators: [String] = ["+", "-", "x", "/", "%"]
    var prev = false
    var inputs : [Any] = []
    
    func parseArgs (args: [String]) -> [Any] {
        for arg in args {
            if !prev {self.parseNum(numStr: arg)}
            else {self.parseOp(op: arg)}
        }
        return self.inputs
    }
    
    func parseOp (op: String) {
        if (!operators.contains(op)) {Ultility.exitProgram("Invalid operation: " + op)}
        self.inputs.append(op)
        self.prev = false
    }
    
    func parseNum (numStr: String) {
        if let num = Int(numStr) {
            self.inputs.append(num)
            self.prev = true
            return
        }
        Ultility.exitProgram("Invalid number")
    }
}
