//
//  Calculator.swift
//  calc
//
//  Created by Jacktator on 31/3/20.
//  Copyright © 2020 UTS. All rights reserved.
//

import Foundation

class Calculator {
    var numbers : [Int] = []
    var ops : [String] = []
    var isOpsPrev = false
    
    var inputs : [Any] = []
    
    func executePrioOp (num: Int) -> Int {
        var num = num
        let lastOp = self.ops.popLast()!
        let lastNum = self.numbers.popLast()!
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
        return num
    }
    
    func executeOps() {
        var isExecute = false
        for input in inputs {
            if var num = input as? Int {
                if isExecute { num = executePrioOp(num: num) }
                self.numbers.append(num)
            }
            else if let op = input as? String {
                self.ops.append(op)
                isExecute = (op == "-" || op == "+") ? false : true
            }
        }
    }

    func executePostOp() -> Int {
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
        return self.numbers[0]
    }
    
    func calculate(args: [String]) -> Int {
        let parser = Parser()
        inputs = parser.parseArgs(args: args)
        executeOps()
        return executePostOp()
    }
}
