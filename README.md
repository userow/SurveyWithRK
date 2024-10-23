# Survey With ResearchKit TestTask

## Description
This repository contains a test task implementing a survey using **ResearchKit**. The project adheres to the [Task Requirements](Task.md).

## Technologies Used
- **Swift**: 56.1%
- **Objective-C**: 41%
- **Ruby**: 2.9%

## How to Build and Run the Project

The project uses **CocoaPods** as a dependency manager. Ensure it is installed before proceeding. If not, refer to the [CocoaPods Getting Started Guide](https://guides.cocoapods.org/using/getting-started.html) for installation instructions.

### Steps to Build:
1. Open Terminal.
2. Navigate to your desired directory.
3. Clone the repository with:
```bash
git clone https://github.com/userow/SurveyWithRK.git
```
4.	Change directory to the project folder:
```bash
cd SurveyWithRK
```
5. Install dependencies using:
```bash
pod install
```
6. If you encounter issues, run:
```bash
pod repo update
```
and repeat step 5.

### Running the Project:
-	After the dependencies are installed, open the .xcworkspace file and build the project using Xcode.

##  Assumptions Made and Architectural Choices
### Libraries Used
- [ReasearchKit](https://github.com/ReasearchKit/ReasearchKit)
- [Mantle](https://github.com/Mantle/Mantle)
- [Realm](https://github.com/realm/realm-swift)

### Assumptions made. A brief explanation of your architectural choices.
Strict Time management terms dictated need to cut down the architecture to MVC fast in development.

Project Structure:

![Project Logo](DOCS/Project-structure.png)

Several Services were created for code cleanliness and responsibility separation.

`UI` directory contains UI related classes - ViewControllers - `HomeViewController` and `SurveyResultsViewController`. `SurveyBuilder.swift` class returns prebuilt ResearchKit `ORKTaskViewController`
`DTO` directory contains DataTransferObjects - `InterestsDTO` and `SubjectDTO` - `MTLModel` subclasses - Mantle objects.
`DATA` directory contains Realm data classes and `DataService` class for retrieving and deserealising from JSON string saved Surveys.
`API` directory contains protocol and mock API implementation - `ApiServiceMock`. It saves Survey results from DTO to Realm.
`ApiServiceMock` is initialized in `SceneDelegate` and passed to `HomeViewController` via it's initializer.

## Usage
On the home screen, you will find two options:
- Start ResearchKit Survey:  Launches a survey powered by ResearchKit.
- View Saved Survey Results:  Displays previously saved survey results.

## Overall User Experience:
To get a quick overview of the app’s functionality and user experience, [watch the demo video.](DOCS/Demo.mp4)

## Contributing
You could suggest improvements to a project by providing a Pull Requiest or by writing to author of a project.

## License
Creative Commons Attribution NonCommercial Share-Alike (CC BY-NC-SA) except 3d party libraries.

Feel free to add or modify sections as needed for your specific project.
