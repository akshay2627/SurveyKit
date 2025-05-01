# SurveyKit

SurveyKit is a lightweight and customizable native iOS SDK for displaying a set of 10 survey questions with multiple-choice answers. It supports theming so you can match your app’s look and feel.

## ✨ Features

- 📋 Pre-built survey with 10 questions
- 🎨 Customizable colors and fonts
- 📱 Native iOS UI, Swift-based
- ⚙️ Easy integration via CocoaPods

## 📦 Installation

Add this to your `Podfile`:

```ruby
pod 'SurveyKit', '~> 0.0.6'

Then run:
pod install

Usage
import SurveyKit

let questions = [
    SurveyQuestion(id: "q1", question: "How satisfied are you with our service?", options: ["Very Satisfied", "Satisfied", "Neutral", "Dissatisfied"]),
    SurveyQuestion(id: "q2", question: "Would you recommend us?", options: ["Yes", "No"]),
    // Add up to 10 questions...
]

let theme = SurveyTheme(
    primaryColor: .systemBlue,
    backgroundColor: .white,
    buttonColor: .systemBlue
)

let surveyVC = SurveyViewController()
surveyVC.configure(questions: questions, theme: theme) { result in
    // Handle completion
    for answer in result.answers {
        print("\(answer.questionId): \(answer.selectedOption)")
    }
}

present(surveyVC, animated: true)

Requirements
iOS 13.0+

Swift 5.0
