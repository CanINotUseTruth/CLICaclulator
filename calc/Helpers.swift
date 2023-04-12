//
//  Helpers.swift
//  calc
//
//  Created by Toby Rutherford - 14323808
//

import Foundation

class Helpers {
    
    // Converts String to Int and Back to String
    // This helps with correcting the unary operator + on single inputs
    func correctString(input:String) -> String {
        return String(Int(input)!);
    }
    
    // Checks if input of args array with count 0 is in valid format
    // returns true if number can be converted to Int
    func checkSingleInput(inputArg:String) -> Bool {
        if (Int(inputArg) == nil){
            return false;
        }
        return true;
    }
    
    // Separates the arguments array into operators and values and sends them to individual checks
    // returns true if operator and number checks both return true
    func checkInputs(inputArgs:[String]) -> Bool {
        var numArr:[String] = [inputArgs[0]];
        var operatorArr:[String] = [];
            
        for i in 1...inputArgs.count - 1 {
            if( i % 2 == 0){
                numArr.append(inputArgs[i]);
            } else {
                operatorArr.append(inputArgs[i]);
            }
        }
        
        if(checkNumbers(inputArr: numArr) && checkOperators(inputArr: operatorArr)){
            return true;
        }
        return false;
    }
    
    // Checks if the operators match the valid operators for the program
    // returns true if all operators are in the valid list
    func checkOperators(inputArr:[String]) -> Bool {
        let validOperators = ["x", "*", "/", "%", "+", "-"];
        for item in inputArr {
            if (!validOperators.contains(item)){
                return false;
            }
        }
        return true;
    }
    
    // Checks if the values can be converted to Int
    // Returns true if all numbers can be converted to Int
    func checkNumbers(inputArr:[String]) -> Bool {
        for item in inputArr {
            if (Int(item) == nil){
                return false;
            }
        }
        return true;
    }
    
    // Returns true if there is no divide character followed by a 0
    func checkDivideByZero(inputArgs:[String]) -> Bool {
        for i in stride(from: 1, to: args.count - 2, by: 2) {
            if((inputArgs[i] == "/" || inputArgs[i] == "%") && inputArgs[i + 1] == "0") {
                return false;
            }
        }
        return true;
    }
    
    // Locates the operator that is of the lowest priority from right to left
    func findLowestPriorityOperation(inputArgs:[String]) -> Int {
        
        if(inputArgs.count == 3) {
            return 1;
        }
        
        let lowPriorityOperators:[String] = ["+", "-"];
        for i in stride(from: inputArgs.count - 2, to: 0, by: -2) {
            if(lowPriorityOperators.contains(inputArgs[i])) {
                return i;
            }
        }

        let highPriorityOperators:[String] = ["x", "*", "/", "%"];
        for i in stride(from: inputArgs.count - 2, to: 0, by: -2) {
            if(highPriorityOperators.contains(inputArgs[i])) {
                return i;
            }
        }
        
        fatalError("Reached LPO with less than 3 elements in input array!")
    }
    
    // Returns left hand side of array
    func separateLeftHandSide(inputArgs:[String], separationIndex:Int) -> [String] {
        var leftHandSide:[String] = [];
        for i in stride(from: 0, to: separationIndex, by: 1) {
            leftHandSide.append(inputArgs[i]);
        }
        return leftHandSide;
    }
    
    // Returns right hand side of array
    func separateRightHandSide(inputArgs:[String], separationIndex:Int) -> [String] {
        var rightHandSide:[String] = [];
        for i in stride(from: separationIndex + 1, to: inputArgs.count, by: 1) {
            rightHandSide.append(inputArgs[i]);
        }
        return rightHandSide;
    }
}
