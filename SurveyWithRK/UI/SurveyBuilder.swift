//
//  SurveyBuilder.swift
//  SurveyWithRK
//
//  Created by Pavlo Vasylenko on 21.10.2024.
//

import ResearchKit

class SurveyBuilder {

    // Builds a survey and returns VC
    static func buildInterestsSurvey(delegate: ORKTaskViewControllerDelegate) -> ORKTaskViewController? {
        guard let task = SurveyBuilder.createSurveyTask() else { return nil }

        let taskViewController = ORKTaskViewController(task: task, taskRun: nil)
        taskViewController.delegate = delegate

        return taskViewController
    }

    // Builds task for survey
    private static func createSurveyTask() -> ORKTask? {
        // Step 1 - Name
        let namePattern = "^[ A-Za-z'-]{2,50}$"
        guard let nameRegEx = try? NSRegularExpression(pattern: namePattern) else { return nil }

        let nameAnswerFormat = ORKTextAnswerFormat(validationRegularExpression: nameRegEx, invalidMessage: "Name should be 2 to 50 symbols long")
        nameAnswerFormat.maximumLength = 50
        nameAnswerFormat.multipleLines = false
        let nameStep = ORKQuestionStep(identifier: "nameStep", title: "Your name", text: "Enter your name", answer: nameAnswerFormat)
        nameStep.isOptional = false

        // Step 2 - Age
        let ageAnswerFormat = ORKNumericAnswerFormat(style: .integer, unit: "years")
        ageAnswerFormat.minimum = NSNumber(value: 1)
        ageAnswerFormat.maximum = NSNumber(value: 120)
        let ageStep = ORKQuestionStep(identifier: "ageStep", title: "Your age", text: "Enter your age", answer: ageAnswerFormat)
        ageStep.isOptional = false

        // Step 3 - Email
        let emailAnswerFormat = ORKEmailAnswerFormat()
        let emailStep = ORKQuestionStep(identifier: "emailStep", title: "Email", text: "Enter your email", answer: emailAnswerFormat)
        emailStep.isOptional = false

        // Step 4 - Interests
        let interestsChoices = [
            ORKTextChoice(text: "Music", value: "music" as NSString),
            ORKTextChoice(text: "Sports", value: "sports" as NSString),
            ORKTextChoice(text: "Travel", value: "travel" as NSString),
            ORKTextChoice(text: "Reading", value: "reading" as NSString),
            ORKTextChoice(text: "Gaming", value: "gaming" as NSString)
        ]
        let interestsAnswerFormat = ORKTextChoiceAnswerFormat(style: .multipleChoice, textChoices: interestsChoices)
        let interestsStep = ORKQuestionStep(identifier: "interestsStep", title: "Interests", text: "Enter your interests", answer: interestsAnswerFormat)
        interestsStep.isOptional = false

        return ORKOrderedTask(identifier: "surveyTask", steps: [nameStep, ageStep, emailStep, interestsStep])
    }

}
