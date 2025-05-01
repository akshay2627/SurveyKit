//
//  SurveyResult.swift
//  SurveyKit
//
//  Created by Akshay Garg on 01/05/25.
//

public struct SurveyResult {
    public let answers: [SurveyAnswer]

    public init(answers: [SurveyAnswer]) {
        self.answers = answers
    }
}
