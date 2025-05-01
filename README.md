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

let surveyVC = SurveyViewController()
surveyVC.themeColor = UIColor.systemBlue // Optional theming

surveyVC.questions = [
    SurveyQuestion(id: "q1", question: "How do you feel today?", options: ["Good", "Okay", "Bad"]),
    SurveyQuestion(id: "q2", question: "How often do you exercise?", options: ["Daily", "Weekly", "Rarely"]),
    // ...up to 10
]

present(surveyVC, animated: true, completion: nil)


Requirements
iOS 13.0+

Swift 5.0
