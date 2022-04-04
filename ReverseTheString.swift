//
// ReverseTheString.swift
//
// created by Ketia Gaelle Kaze
// created on 2022-03-29
// version 1.0
// copyright(c) 2022 Ketia Gaelle Kaze. All rights reserved.
// Reverse the string program reads a text
// file that has strings in it and then 
// uses a recursive function to display 
// the reversed strings into an output file.

import Foundation

// function for reversing the input
func reverse(value: String) -> String {
  if value == "" {
    return value
  } else {
    return reverse(value: String(Array(value)[1...])) + String(Array(value)[0])
  }
}

// declaring constants and variables
let userInput = "/home/runner/Unit2-01-Swift/input.txt"
let text = ""
var newValue: String
var reverseString = ""
let stringArray: [String]
var arrayToString: String = ""

// reads file with user strings to an array
let userInputFile: String = try String(contentsOfFile: userInput)
let arrayUserInputFile: [String] = userInputFile.components(separatedBy: "\n")

// call function and passes string at correct index
for counter in 0..<arrayUserInputFile.count {
  newValue = reverse(value: arrayUserInputFile[counter])
  if counter != arrayUserInputFile.count - 1 {
    reverseString.append(newValue + "\n")
  } else {
    reverseString.append(newValue)
  }
}

// convert list of reversed to an array
let reverseStringArray: [String] = reverseString.components(separatedBy: "\n")

// writes the new reversed string to the output file
try text.write(to: URL(fileURLWithPath: "/home/runner/Unit2-01-Swift/output.txt"), atomically: false, encoding: .utf8)

if let fileWriter = try? FileHandle(forUpdating: URL(fileURLWithPath: "/home/runner/Unit2-01-Swift/output.txt")) {

  // add each string to the output file
  for string in 0..<reverseStringArray.count {
    if string != reverseStringArray.count-1 {
      arrayToString = reverseStringArray[string] + "\n"
      } else {
      arrayToString = reverseStringArray[string]
      }
      fileWriter.seekToEndOfFile()
      fileWriter.write(arrayToString.data(using: .utf8)!)
    }
  fileWriter.closeFile()
  }

print("Assigned reversed strings to the output file.")
