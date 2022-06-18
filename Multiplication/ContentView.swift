//
//  ContentView.swift
//  Multiplication
//
//  Created by Vanüsha on 18.06.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var isGameActive = false
    
    @State private var maxMultiplier = 10
    @State private var amountOfTasks = 10
    @State private var questionsLeft = 10
    
    @State private var questionAmounts = [5, 10, 20]
    
    @State private var a = 1
    @State private var b = 1
    @State private var answers = [-1, -1, -1]
    @State private var points = 0
    
    var body: some View {
        if isGameActive {
            VStack {
                Text("Points: \(points)")
                    .font(.subheadline)
                
                Spacer()
                
                Text("\(a) x \(b)")
                    .font(.largeTitle)
                
                Spacer()
                
                VStack(spacing: 10) {
                    OptionButton(number: answers[0]) { gotResult(answer: answers[0]) }
                    OptionButton(number: answers[1]) { gotResult(answer: answers[1]) }
                    OptionButton(number: answers[2]) { gotResult(answer: answers[2]) }
                }
            }
            .padding()
        } else {
            NavigationView {
                Form {
                    Section {
                        Stepper("Multiplier up to \(maxMultiplier)", value: $maxMultiplier, in: 2...12)
                    } header: {
                        Text("Choose maximum multiplier for the game")
                    }
                    
                    Section {
                        Picker("Amount of tasks", selection: $amountOfTasks) {
                            ForEach(questionAmounts, id: \.self) { number in
                                Text("\(number) tasks")
                            }
                        }
                        .pickerStyle(.segmented)
                    } header: {
                        Text("Choose amount of tasks")
                    }
                    .toolbar {
                        Button("Begin", action: beginButtonPressed)
                    }
                    .navigationTitle("Settings")
                }
            }
        }
    }
    
    func beginButtonPressed() {
        isGameActive = true
        points = 0
        questionsLeft = amountOfTasks
        updateValues()
    }
    
    func gotResult(answer: Int) {
        if answer == a * b {
            points += 1
        } else {
            points -= 1
        }
        questionsLeft -= 1
        
        if questionsLeft == 0 {
            isGameActive = false
        } else {
            updateValues()
        }
    }
    
    func updateValues() {
        a = Int.random(in: 1...maxMultiplier)
        b = Int.random(in: 1...maxMultiplier)
        
        answers = [a * b]
        answers.append(Int.random(in: 1...maxMultiplier) * Int.random(in: 1...maxMultiplier))
        answers.append(Int.random(in: 1...maxMultiplier) * Int.random(in: 1...maxMultiplier))
        answers.shuffle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
