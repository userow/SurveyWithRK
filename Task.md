# iOS Developer Test Project

## Project Overview:

Create a simple iOS application that collects user information through a form, processes and stores the data using data models, and showcases interoperability between Objective-C and Swift. The app should utilize the following frameworks and technologies:

- ResearchKit: For creating the form and data collection interface.
- Mantle: For model serialization and deserialization to and from JSON.
- Realm DB: For local data storage.
- Objective-C and Swift: The project should include both languages and demonstrate how they interact within the app.

## Task Requirements:

1. User Interface & Data Collection:
- Use ResearchKit to create a survey form that collects the following information:
- Name (Text input)
- Age (Number input)
- Email Address (Text input with email validation)
- Interests (Select multiple options from a list)
- Implement proper input validation (e.g., valid email format, age should be a positive integer).

2. Data Models:
- Design complex data models to represent the user information and survey responses.
- Ensure that the models include nested objects or relationships to demonstrate complexity.
- For example, an User object that contains an array of Interest objects.
- Use Mantle to serialize the models to JSON and deserialize JSON back to models.
- Save the serialized JSON strings locally (e.g., in a file or as a string in Realm).

3. Data Storage:
- Store the collected data locally using Realm DB.
- Implement functionality to retrieve and display the stored data in a list or table view within the app.
- Allow users to tap on a list item to see detailed information.

4. Language Interoperability:
- The project must include both Objective-C and Swift code:
- For example, write the data models in Objective-C and the UI in Swift, or vice versa.
- Demonstrate how Objective-C and Swift code interact within the app

5. Serialization & Deserialization
- Implement functionality to:
- Serialize the user data models to JSON using Mantle.
- Deserialize JSON back into data models.
- Demonstrate this by:
- Saving the JSON representation of the user data.
- Loading the JSON and converting it back into models to display in the app

6. Error Handling & User Feedback:
- Implement error handling for data storage, retrieval, and serialization operations.
- Provide user feedback for successful submissions and handle any potential errors gracefully.

7. Documentation & Code Quality
- Write clean, well-organized code with comments explaining key sections.
- Include a README file that explains:
- How to build and run the project.
- Any assumptions made or third-party libraries used.
- A brief explanation of your architectural choices.

## Deliverables:
-A link to GitHub repo
- Ensure no proprietary code or intellectual property is included.

## Evaluation Criteria:
- Functionality: The app meets all the specified requirements and functions correctly.
- Code Quality: Cleanliness, organization, and readability of the code; proper use of comments.
- Use of Technologies: Effective use of ResearchKit, Mantle, Realm DB, and interoperability between Objective-C and Swift.
- Complexity Handling: Ability to design and manage data models.
- Error Handling: Proper handling of potential errors and providing meaningful user feedback.
- Documentation: Clarity and completeness of the README file and in-code comments.
- Time Management: Ability to deliver a functional app within the 4-5 hour timeframe.

## Instructions:
- Please commit every logical part of the code, so using commits we can track your performance trough time
- Focus on delivering a working prototype that showcases your skills with the specified technologies.
- Do not include any proprietary code or resources.
- Submit your completed project by publishing it on public GitHub repo and sending the link to this repo in email.

We look forward to seeing your solution and assessing how your skills align with our project’s needs. Good luck!
