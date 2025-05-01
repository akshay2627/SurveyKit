//
//  SurveyAnswer.swift
//  SurveyKit
//
//  Created by Akshay Garg on 01/05/25.
//

public struct SurveyAnswer {
    public let questionId: String
    public let selectedOption: String

    public init(questionId: String, selectedOption: String) {
        self.questionId = questionId
        self.selectedOption = selectedOption
    }
}
