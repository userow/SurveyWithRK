//
//  ViewController.swift
//  SurveyWithRK
//
//  Created by Pavlo Vasylenko on 21.10.2024.
//

import UIKit
import ResearchKit

class HomeViewController: UIViewController {

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
        startButton.setTitle("Start ResearchKit Survey", for: .normal)
        startButton.addTarget(self, action: #selector(startTask), for: .touchUpInside)

        startButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(startButton)

        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        let surveyResultsButton = UIButton(type: .system)
        surveyResultsButton.setTitle("View Saved Survey Results", for: .normal)
        surveyResultsButton.addTarget(self, action: #selector(showSurveyResults), for: .touchUpInside)

        surveyResultsButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(surveyResultsButton)

        NSLayoutConstraint.activate([
            surveyResultsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            surveyResultsButton.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 40)
        ])

    }

    // MARK: - Actions

    @objc private func startTask() {
        guard let survey = SurveyBuilder.buildInterestsSurvey(delegate: self) else { return }

        // To prevent dismissal of the survey by swipe down
        survey.isModalInPresentation = true
        present(survey, animated: true, completion: nil)
    }

    @objc private func showSurveyResults() {
        let surveyResultsVC = SurveyResultsViewController()
        navigationController?.pushViewController(surveyResultsVC, animated: true)
    }
}

extension HomeViewController: ORKTaskViewControllerDelegate {

    // MARK: - ORKTaskViewControllerDelegate

    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {
        if reason == .completed {
            let taskResult = taskViewController.result

            // Receiving name
            let nameResult = taskResult.stepResult(forStepIdentifier: "nameStep")?.firstResult as? ORKTextQuestionResult
            guard let name = nameResult?.textAnswer else { return }

            // Receiving age
            let ageResult = taskResult.stepResult(forStepIdentifier: "ageStep")?.firstResult as? ORKNumericQuestionResult
            guard let age = ageResult?.numericAnswer?.intValue else { return }

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

            // printing UserDTO for assurance
            print("subjectDTO: \(subjectDTO)")

            // Passing SubjectDTO to ApiService for processing
            self.apiService.sendEvent(withSubject: subjectDTO)
        }

        taskViewController.dismiss(animated: true, completion: nil)
    }

}
