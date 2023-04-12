//
//  Calculator.swift
//  calc
//
//  Created Toby Rutherford - 14323808
//
// WIP - Implement errors as close as to where they occur?
// Perhaps use a enum and custom error??

import Foundation

class Calculator {
    
    // Gives access to all helper functions to better organise code into distinct functions
    let helper = Helpers();
    
    // Adds two numbers
    func add(no1: Int, no2: Int) -> Int {
        return no1 + no2;
    }
    
    // Subtracts two numbers
    func subtract(no1: Int, no2: Int) -> Int {
        return no1 - no2;
    }
    
    // Multiplies two numbers
    func multiply(no1: Int, no2: Int) -> Int {
        return no1 * no2;
    }
    
    // Divides two numbers
    func divide(no1: Int, no2: Int) -> Int {
        guard no2 != 0 else {
            fatalError("Division by zero!");
        }
        return no1 / no2;
    }
    
    // Gets remainder of division of two numbers
    func modulo(no1: Int, no2: Int) -> Int {
        guard no2 != 0 else {
            fatalError("Division by zero!");
        }
        return no1 % no2;
    }

    // Runs recursive calculation of arithmetic string
    func calculate(args: [String]) -> String {
        
        /* If args.count is 1 returns the final value in the
         recursive tree to return through and solve to answer */
        if(args.count == 1) { return args[0] }
        
        // Finds lowest priority operation
        let indexLPO:Int = helper.findLowestPriorityOperation(inputArgs: args);
        
        /* Separate LHS (Left Hand Side) and RHS (Right Hand Side) of
         input array on the seperation point of the Lowest Priority Operator */
        let arrLHS:[String] = helper.separateLeftHandSide(inputArgs: args, separationIndex: indexLPO);
        let arrRHS:[String] = helper.separateRightHandSide(inputArgs: args, separationIndex: indexLPO);
        
        /* Switch selects operation to call based on symbol at the index point of LPO
         Each returns further calculate functions until they equal a single value */
        switch args[indexLPO] {
        case "x":
            return String(multiply(no1: Int(calculate(args: arrLHS))!, no2: Int(calculate(args: arrRHS))!));
        case "/":
            return String(divide(no1: Int(calculate(args: arrLHS))!, no2: Int(calculate(args: arrRHS))!));
        case "%":
            return String(modulo(no1: Int(calculate(args: arrLHS))!, no2: Int(calculate(args: arrRHS))!));
        case "+":
            return String(add(no1: Int(calculate(args: arrLHS))!, no2: Int(calculate(args: arrRHS))!));
        case "-":
            return String(subtract(no1: Int(calculate(args: arrLHS))!, no2: Int(calculate(args: arrRHS))!));
        default:
            fatalError("Could not complete operation!")
        }
    }
}
