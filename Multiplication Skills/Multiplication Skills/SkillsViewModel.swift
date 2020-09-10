//
//  MultiplicationViewModel.swift
//  Multiplication Skills
//
//  Created by Kha-Yu Cheam on 9/5/20.
//  Copyright © 2020 kac6294. All rights reserved.
//

import Foundation

class SkillsViewModel: ObservableObject {
    @Published var skillsModel = SkillsModel()
    
    // Intents from view
    var gameState: State {skillsModel.gameState}
    
    var totalQuestions: Int {skillsModel.totalQuestions}
    var totalCorrect: Int {
        var total: Int = 0
        for question in skillsModel.questionsAnswered {
            if question == .correct { total += 1 }
        }
        return total
    }
    var questionsAnswered: [AnswerState] {skillsModel.questionsAnswered}
    
    var currentQuestion: Int {skillsModel.currentQuestion}
    var multiplicand: Int {skillsModel.multiplicand}
    var multiplier: Int {skillsModel.multiplier}
    var answers: [Int] {skillsModel.answers}
    var correctAnswer: Int {skillsModel.multiplicationProblems[currentQuestion].correctAnswer}
    var selectedAnswer: Int = 0
    var symbol: String {skillsModel.symbol}
    
    var buttonLabel: String {skillsModel.buttonLabel}
    
    func advanceGameState() {
        skillsModel.advanceGameState()
    }
    
    func checkCorrectGuess(guess : Int) {
        selectedAnswer = guess
        skillsModel.checkCorrectGuess(guess: guess)
    }
    
    func getAnswerState(question index: Int) -> AnswerState {
        if questionsAnswered.count == 0 {
            return .unknown
        } else {
            return questionsAnswered[index]
        }
    }
}
