//
//  SurveyViewController.swift
//  SurveyKit
//
//  Created by Akshay Garg on 01/05/25.
//

import UIKit

public class SurveyViewController: UIViewController {

    public var questions: [SurveyQuestion] = []
    private var currentIndex = 0
    private var answers: [SurveyAnswer] = []
    private var theme: SurveyTheme!
    private var onComplete: ((SurveyResult) -> Void)?

    private let questionLabel = UILabel()
    private let optionsStackView = UIStackView()
    private let nextButton = UIButton(type: .system)

    public override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        showQuestion(at: currentIndex)
    }

    func configure(
        questions: [SurveyQuestion],
        theme: SurveyTheme,
        onComplete: @escaping (SurveyResult) -> Void
    ) {
        self.questions = questions
        self.theme = theme
        self.onComplete = onComplete
    }

    private func setupUI() {
        view.backgroundColor = theme.backgroundColor
        title = "Survey"

        questionLabel.font = .systemFont(ofSize: 20, weight: .medium)
        questionLabel.textColor = theme.primaryColor
        questionLabel.numberOfLines = 0
        questionLabel.translatesAutoresizingMaskIntoConstraints = false

        optionsStackView.axis = .vertical
        optionsStackView.spacing = 12
        optionsStackView.translatesAutoresizingMaskIntoConstraints = false

        nextButton.setTitle("Next", for: .normal)
        nextButton.backgroundColor = theme.buttonColor
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.layer.cornerRadius = 8
        nextButton.addTarget(self, action: #selector(nextTapped), for: .touchUpInside)
        nextButton.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(questionLabel)
        view.addSubview(optionsStackView)
        view.addSubview(nextButton)

        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            questionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            questionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            optionsStackView.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 20),
            optionsStackView.leadingAnchor.constraint(equalTo: questionLabel.leadingAnchor),
            optionsStackView.trailingAnchor.constraint(equalTo: questionLabel.trailingAnchor),

            nextButton.topAnchor.constraint(equalTo: optionsStackView.bottomAnchor, constant: 40),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 120),
            nextButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }

    private func showQuestion(at index: Int) {
        let question = questions[index]
        questionLabel.text = question.question
        optionsStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }

        for option in question.options {
            let button = UIButton(type: .system)
            button.setTitle(option, for: .normal)
            button.setTitleColor(theme.primaryColor, for: .normal)
            button.layer.borderColor = theme.primaryColor.cgColor
            button.layer.borderWidth = 1
            button.layer.cornerRadius = 6
            button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12)
            button.addTarget(self, action: #selector(optionSelected(_:)), for: .touchUpInside)
            optionsStackView.addArrangedSubview(button)
        }
    }

    @objc private func optionSelected(_ sender: UIButton) {
        guard let option = sender.title(for: .normal) else { return }
        let question = questions[currentIndex]

        answers.removeAll { $0.questionId == question.id }
        answers.append(SurveyAnswer(questionId: question.id, selectedOption: option))

        for view in optionsStackView.arrangedSubviews {
            if let btn = view as? UIButton {
                btn.backgroundColor = (btn == sender) ? theme.primaryColor.withAlphaComponent(0.2) : .clear
            }
        }
    }

    @objc private func nextTapped() {
        if currentIndex < questions.count - 1 {
            currentIndex += 1
            showQuestion(at: currentIndex)
        } else {
            dismiss(animated: true) {
                self.onComplete?(SurveyResult(answers: self.answers))
            }
        }
    }
}
