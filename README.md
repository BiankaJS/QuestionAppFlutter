# Quiz App - Flutter

This project is a quiz application developed with Flutter. It allows users to answer a series of questions and shows the number of correct answers at the end of the quiz. Additionally, after answering each question, the app displays the correct answer in English.

## Features

- **Dynamic Quiz**: As the user answers, the app automatically transitions to the next question.
- **Correct Answer Count**: At the end of the quiz, a summary displaying the number of correct answers is shown.
- **Correct Answer Display**: After the user answers each question, the app shows the correct answer in English.

## Prerequisites

To run this project in your local environment, you need to have:

- [Flutter](https://flutter.dev/) SDK
- [Dart](https://dart.dev/get-dart) SDK
- A code editor such as [Visual Studio Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio)

## Project Setup

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-username/your-repository.git
   ```

2. **Install Dependencies**:
   Navigate to the project directory and run the following command:
   ```bash
   flutter pub get
   ```

3. **Run the Application**:
   Connect your device or start an emulator and run:
   ```bash
   flutter run
   ```

## Project Structure

```plaintext
lib/
│
├── main.dart               # Main entry point of the application.
├── questions.dart          # File where questions and answers are stored.
├── summary_item.dart       # Logic for handling the quiz.
└── results_screen.dart     # Displays the results at the end of the quiz.
```

## How It Works

1. **Starting the Quiz**:
    - The user starts the quiz, and the first question is displayed.

2. **Question Progression**:
    - When the user selects an answer, the app automatically moves to the next question.
    - After each answer, the app shows the correct answer in English.

3. **Final Results**:
    - After all the questions have been answered, a summary is displayed showing the number of correct answers.
