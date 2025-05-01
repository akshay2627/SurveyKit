Pod::Spec.new do |s|
  s.name             = 'SurveyKit'
  s.version          = '0.0.1'
  s.summary          = 'A lightweight and themable iOS SDK for 10-question surveys.'
  s.description      = <<-DESC
SurveyKit is a native iOS SDK that provides a customizable UI to present 10 survey questions with multiple-choice answers and theme support for easy integration into any app.
  DESC

  s.homepage         = 'https://github.com/akshay2627/SurveyKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Your Name' => 'your@email.com' }
  s.source           = { :git => 'https://github.com/akshay2627/SurveyKit.git', :tag => s.version }

  s.platform         = :ios, '13.0'
  s.swift_version    = '5.0'
  s.source_files     = 'SurveyKit/**/*.{swift}'
end