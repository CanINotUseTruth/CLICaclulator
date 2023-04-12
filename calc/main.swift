//
//  main.swift
//  calc
//
//  Created by Toby Rutherford - 14323808
//

import Foundation;

var args = ProcessInfo.processInfo.arguments;
args.removeFirst(); // remove the name of the program

// Initialize a Calculator object
let calculator = Calculator();

// Initialize a Helper object
let helper = Helpers();

// Result string variable created
let result: String;

// Performs intial checks on inputs to ensure they meet requirements
switch args.count {
    case 0:
        fatalError("No arguments given!")
    case 1:
        if(!helper.checkSingleInput(inputArg: args[0])){
            fatalError("Not a valid number!");
        }
        result = helper.correctString(input: args[0]);
    case 2:
        fatalError("Invalid amount of arguments!");
    default:
        if(!helper.checkInputs(inputArgs: args)){
            fatalError("Arguments are not in the correct format!")
        }
        if(!helper.checkDivideByZero(inputArgs: args)) {
            fatalError("Can not divide by zero!")
        }
        result = calculator.calculate(args: args);
}

print(result);
