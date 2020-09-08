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
    var totalCorrect: Int {skillsModel.totalCorrect}
    var questionsAnswered: [AnswerState] {skillsModel.questionsAnswered}
    
    var currentQuestion: Int {skillsModel.currentQuestion}
    var multiplicand: Int {skillsModel.multiplicand}
    var multiplier: Int {skillsModel.multiplier}
    var answers: [Int] {skillsModel.answers}
    var symbol: String {skillsModel.symbol}
    
    var buttonLabel: String {skillsModel.buttonLabel}
    
    func advanceGameState() {
        skillsModel.advanceGameState()
    }
}
