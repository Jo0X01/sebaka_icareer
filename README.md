# Sebaka 

A Flutter restaurant discovery app built with clean architecture.

## Features

- User signup with form validation
- Token-based authentication (persisted via SharedPreferences)
- Dio networking with pretty logging in debug mode
- BLoC/Cubit state management
- GetIt dependency injection

## Project Structure

```
lib/
├── core/
│   ├── di/           # Dependency injection (GetIt)
│   ├── networking/   # Dio, API constants, error handling
│   ├── routes/       # App router and route names
│   ├── services/     # TokenStorage
│   ├── utils/        # Validators
│   └── widgets/      # Shared UI components
├── features/
│   ├── home/         # Home screen
│   └── signup/       # Signup feature (data, cubit, ui)
├── main.dart
└── sebaka_app.dart
```

## Getting Started

```bash
flutter pub get
flutter run
```
