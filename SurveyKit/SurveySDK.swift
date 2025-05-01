//
//  SurveySDK.swift
//  SurveyKit
//
//  Created by Akshay Garg on 01/05/25.
//

import UIKit

public class SurveySDK {
    public static func presentSurvey(
        from viewController: UIViewController,
        questions: [SurveyQuestion],
        theme: SurveyTheme,
        onComplete: @escaping (SurveyResult) -> Void
    ) {
        let surveyVC = SurveyViewController()
        surveyVC.configure(questions: questions, theme: theme, onComplete: onComplete)
        let nav = UINavigationController(rootViewController: surveyVC)
        nav.modalPresentationStyle = .formSheet
        viewController.present(nav, animated: true)
    }
}
