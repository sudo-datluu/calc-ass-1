//
//  Utility.swift
//  calc
//
//  Created by David on 27/2/2024.
//  Copyright © 2024 UTS. All rights reserved.
//

import Foundation

// Class for utility
class Ultility {    

    // Exit the program with message
    static func exitProgram(_ message: String, _ isExit: Bool = true) {
        print(message)
        if isExit {
            exit(1)
        }
    }
}
