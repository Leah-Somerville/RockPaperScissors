//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Leah Somerville on 2/15/24.
//

import SwiftUI

struct ContentView: View {
    
//  VARIABLES
    var playOptions = ["🪨", "📄", "✂️"]
    @State private var currentChoice: String = "🪨"
    @State private var currentChoiceIndex: Int = 0
    @State var winLose = Bool.random()
    @State private var score = 0
    
    @State private var attempts = 0
    @State private var keepGoing = false
    @State private var attemptsTitle = ""
    
//  BODY
    var body: some View {
        ZStack{
            LinearGradient(colors: [Color(red: 0.5, green: 0.5, blue: 0.5),.black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Section{
                    Text("Move: \(currentChoice)")
                    Text("Goal: \(winOrLose())").foregroundColor(winLose == true ? Color.green : Color.red)
                    Text("Score: \(score)")
                }
                .font(.largeTitle)
                    
                HStack {
                    Button("🪨") {
                        correctIncorrect("Rock")
                    }
                    .font(.system(size: 75))
                    Spacer()
                    
                    Button("📄") {
                        correctIncorrect("Paper")
                    }
                    .font(.system(size: 75))
                    Spacer()
                    
                    Button("✂️"){
                        correctIncorrect("Scissors")
                    }
                    .font(.system(size: 75))
                }.padding()
            }
            .foregroundColor(.white)
            .padding()
            .alert(attemptsTitle, isPresented: $keepGoing) {
                Button("Reset", action: resetFunc)
            } message: {
                Text("Your final score is \(score). Would you like to reset?")
            }
        }
    }
    
    
//  FUNCTIONS
    func getChoice(){
        currentChoice = playOptions[Int.random(in: 0..<3)]
    }
    
   func winOrLose() -> String{
       if winLose == true {
           return "Win"
       } else{
           return "Lose"
       }
    }
    
    func correctIncorrect(_ choice: String) {
        if winLose == true {
            if currentChoice == "🪨" {
                if choice == "Paper"{
                    score += 1
                } else {
                    score -= 1
                }
            } else if currentChoice == "📄"{
                if choice == "Scissors"{
                    score += 1
                } else{
                    score -= 1
                }
            } else {
                if choice == "Rock"{
                    score += 1
                } else {
                    score -= 1
                }
            }
        } else {
            if currentChoice == "🪨" {
                if choice == "Scissors"{
                    score += 1
                } else {
                    score -= 1
                }
            } else if currentChoice == "📄"{
                if choice == "Rock"{
                    score += 1
                } else {
                    score -= 1
                }
            } else {
                if choice == "Paper"{
                    score += 1
                } else {
                    score -= 1
                }
            }
        }
        
        attempts += 1
        if attempts == 10 {
            keepGoing = true
        }
        
        getChoice()
        winLose.toggle()
    }
    
    func resetFunc() {
        score = 0
        attempts = 0
        keepGoing = false
    }
}

#Preview {
    ContentView()
}
