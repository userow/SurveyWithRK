//
//  ViewController.swift
//  SurveyWithRK
//
//  Created by Pavlo Vasylenko on 21.10.2024.
//

import UIKit
import ResearchKit

class ViewController: UIViewController, ORKTaskViewControllerDelegate {

    // MARK: - Properties

    let apiService: ApiServiceProtocol

    // MARK: - Lifecycle

    init(apiService: ApiServiceProtocol) {
        self.apiService = apiService
        super.init(nibName: nil, bundle: nil)  // standard ViewController initializer
    }

    // for compatibility with UIViewController
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .white
        title = "ResearchKit Example"

        let startButton = UIButton(type: .system)
        startButton.setTitle("Start ResearchKit Task", for: .normal)
        startButton.addTarget(self, action: #selector(startTask), for: .touchUpInside)

        startButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(startButton)

        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    // MARK: - Actions

    @objc private func startTask() {
        guard let survey = SurveyBuilder.buildInterestsSurvey(delegate: self) else { return }
        present(survey, animated: true, completion: nil)
    }

    // MARK: - ORKTaskViewControllerDelegate

    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {
        if reason == .completed {
            let taskResult = taskViewController.result

            // Receiving name
            let nameResult = taskResult.stepResult(forStepIdentifier: "nameStep")?.firstResult as? ORKTextQuestionResult
            guard let name = nameResult?.textAnswer else { return }

            // Receiving age
            let ageResult = taskResult.stepResult(forStepIdentifier: "ageStep")?.firstResult as? ORKNumericQuestionResult
            guard let age = ageResult?.numericAnswer else { return }

            // Receiving email
            let emailResult = taskResult.stepResult(forStepIdentifier: "emailStep")?.firstResult as? ORKTextQuestionResult
            guard let email = emailResult?.textAnswer else { return }

            // Receiving Interests
            let interestsResult = taskResult.stepResult(forStepIdentifier: "interestsStep")?.firstResult as? ORKChoiceQuestionResult
            guard let selectedInterests = interestsResult?.choiceAnswers as? [String] else { return }

            // Making of array of InterestsDTO
            var interestsDTO = [InterestDTO]()
            selectedInterests.forEach { interest in
                interestsDTO.append(InterestDTO(name: interest))
            }

            // Making SubjectDTO object
            let subjectDTO = SubjectDTO(name: name, age: age, email: email, interests: interestsDTO)

            // usingUserDTO for further processing
            print("subjectDTO: \(subjectDTO)")

            // TODO: Pass subjectDTO to DataService for storing
            
        }

        taskViewController.dismiss(animated: true, completion: nil)
    }

}
