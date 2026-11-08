# Temperature Converter App 🌡️

A simple and user-friendly Temperature Converter application developed using Flutter. This application allows users to convert temperatures between Celsius and Fahrenheit with accurate results.

## Features

- Convert Celsius to Fahrenheit (°C → °F).
- Convert Fahrenheit to Celsius (°F → °C).
- Easy-to-use dropdown menu for selecting conversion types.
- Input temperature values using a text field.
- Calculate converted temperatures with a single button.
- Display results up to 2 decimal places.
- Input validation for empty and invalid values.
- Clean and responsive user interface.
- Built with Flutter and Material Design 3.

## Technologies Used

- **Framework:** Flutter
- **Programming Language:** Dart
- **UI:** Material Design 3
- **State Management:** StatefulWidget and setState

## Project Structure

```text
lib/
├── main.dart
├── app.dart
├── models/
│   └── conversion_type.dart
├── screens/
│   └── home_screen.dart
├── utils/
│   └── temperature_converter.dart
└── widgets/
    ├── conversion_dropdown.dart
    └── result_card.dart
```

## Conversion Formulas

**Celsius to Fahrenheit**

F = (C × 9/5) + 32

**Fahrenheit to Celsius**

C = (F - 32) × 5/9

## Installation and Setup

1. Download and extract the project.
2. Open the project folder in Visual Studio Code or Android Studio.
3. Open the terminal in the project directory.
4. Run the following command to install dependencies:

```bash
flutter pub get
```

5. Connect an Android device or start an emulator.
6. Run the application:

```bash
flutter run
```

## Input Validation

The application validates user input before performing calculations.

- Displays an error message if the input field is empty.
- Displays an error message if the entered value is not a valid number.
- Accepts positive and negative temperature values.
- Displays the converted result only after valid input.

## Testing

Run the following command to execute the included tests:

## Restrictions

- No Firebase or Supabase.
- No database or backend integration.
- No external API required.

## Developer

**Md Gazi Maynul Hassan Moin**

Developed as a Flutter application project to demonstrate basic Flutter UI development, input validation, dropdown selection, state management, and mathematical operations.

---

