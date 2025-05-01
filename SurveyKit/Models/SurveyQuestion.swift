//
//  SurveyQuestion.swift
//  SurveyKit
//
//  Created by Akshay Garg on 01/05/25.
//

public struct SurveyQuestion {
    public let id: String
    public let question: String
    public let options: [String]

    public init(id: String, question: String, options: [String]) {
        self.id = id
        self.question = question
        self.options = options
    }
}
