//
//  SurveyTheme.swift
//  SurveyKit
//
//  Created by Akshay Garg on 01/05/25.
//

import UIKit

public struct SurveyTheme {
    public let primaryColor: UIColor
    public let backgroundColor: UIColor
    public let buttonColor: UIColor

    public init(primaryColor: UIColor, backgroundColor: UIColor, buttonColor: UIColor) {
        self.primaryColor = primaryColor
        self.backgroundColor = backgroundColor
        self.buttonColor = buttonColor
    }
}
