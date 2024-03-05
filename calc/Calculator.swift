//
//  Calculator.swift
//  calc
//
//  Created by Jacktator on 31/3/20.
//  Copyright © 2020 UTS. All rights reserved.
//

import Foundation

class Calculator {
    var numbers : [Int] = [] // save the numbers in an array
    var ops : [String] = [] // save the operators in an array
    var inputs : [Any] = [] // save the vanila input
    
    // Execute modulo, division and multiply operators first
    func executePrioOp (num: Int) -> Int {
        // Merge 2 of the last num
        var num = num
        let lastNum = self.numbers.popLast()!
        
        // Get the last operator and execute to corresponding case
        let lastOp = self.ops.popLast()!
        if lastOp == "/" {
            if num == 0 {
                Ultility.exitProgram("Division by zero")
            }
            num = lastNum / num
        } else if lastOp == "x" {
            num = lastNum * num
        } else {
            if num == 0 {
                Ultility.exitProgram("Division by zero")
            }
            num = lastNum % num
        }
        // Return the result
        return num
    }
    
    // Execute the operators
    func executeOps() {
        var isExecute = false
        // Iterate the input
        for input in inputs {
            // If input is number, execute priOps
            if var num = input as? Int {
                if isExecute { num = executePrioOp(num: num) }
                self.numbers.append(num)
            }
            // If input is the operator, save minus and plus ops only
            // Execute modulo, division and multiply immidiately
            else if let op = input as? String {
                self.ops.append(op)
                isExecute = (op == "-" || op == "+") ? false : true
            }
        }
    }
    
    // Execute remaining plus and minus ops
    func executePostOp() -> Int {
        // Just iterate from first to last
        // Execute to corresponding case
        while self.ops.count > 0 {
            let op = self.ops.removeFirst()
            let num1 = self.numbers.removeFirst()
            let num2 = self.numbers.removeFirst()
            if op == "+" {
                self.numbers.insert(num1 + num2, at: 0)
            } else {
                self.numbers.insert(num1 - num2, at: 0)
            }
        }
        // Remaining number is the result
        return self.numbers[0]
    }
    
    // For example we have this inputs: [12, +, 6, *, 8, /, 2, - 4]
    func calculate(args: [String]) -> Int {
        // Parse input to check whether it is valid
        let parser = Parser()
        inputs = parser.parseArgs(args: args) 
        
        // Iterate and execute prior ops
        // We would get:
        // numbers = [12, 24, 4]. Number 24 is get from 6 * 8 / 2
        // ops = [+, -]
        executeOps()
        
        // Calculate the remaining by get 2 numbers and 1 operator in each iteration
        return executePostOp()
    }
}
