//
//  main.swift
//  calc
//
//  Created by Jesse Clark on 12/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation

// grab the arguments
var args = ProcessInfo.processInfo.arguments
args.removeFirst() // remove the name of the program

//let args = ["2", "+", "4", "x", "3", "-", "6"]

// Initialize a Calculator object
let calculator = Calculator();

// Calculate the result
let result = calculator.calculate(args: args);

print(result)
