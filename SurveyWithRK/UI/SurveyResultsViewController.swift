//
//  SurveyResultsViewController.swift
//  SurveyWithRK
//
//  Created by Pavlo Vasylenko on 23.10.2024.
//

import UIKit
import Realm

class SurveyResultsViewController: UITableViewController {
    
    // MARK: - Properties

    // Array to hold decoded SubjectDTO objects
    var subjects: [SubjectDTO] = []

    // MARK: - lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup the table view
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "SubjectCell")

        // Load subjects using DataService
        loadSubjects()
    }
    
    // Fetch and decode subjects using DataService
    func loadSubjects() {
        let dataService = DataService()

        // Fetch all subjects from Realm and decode them
        subjects = dataService.fetchAllSubjects()

        // Reload the table view after loading data
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subjects.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubjectCell", for: indexPath)

        // Configure the cell with subject data
        let subject = subjects[indexPath.row]

        let interests = subject.interests.map { $0.name }.joined(separator: ", ")

        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = """
\(subject.name)
Age: \(subject.age)
Email: \(subject.email)
Interests: \(interests)
"""

        return cell
    }
}
