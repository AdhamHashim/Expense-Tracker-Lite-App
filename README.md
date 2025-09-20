📦 Custom Clean Architecture Template for Flutter
This repository provides a highly customizable and scalable Clean Architecture boilerplate for Flutter applications. It is designed to help developers build maintainable, testable, and modular apps by applying best practices in software architecture.

🔧 Features
✅ Clean Architecture Layers: Presentation, Domain, and Data layers are clearly separated.

✅ Modular Structure: Supports code reusability and scalability.

✅ Dependency Injection: Easy service management using get_it.

✅ State Management: Supports BLoC / Cubit (or other plugable options).

✅ Repository Pattern: Abstract data sources for flexibility and testability.

✅ Error Handling: Centralized failure management and clean result modeling.

✅ Easy to Extend: Ideal for medium to large-scale projects.

📁 Folder Structure
bash
نسخ
تحرير
lib/
│
├── core/                # Common utilities and base classes
├── features/            # Feature-wise module separation
│   └── feature_name/
│       ├── data/
│       ├── domain/
│       └── presentation/
├── injection_container.dart
└── main.dart
🚀 Getting Started
Clone the repo.

Run flutter pub get.

Start adding your features inside the features/ directory.

🧱 Tech Stack
Flutter

BLoC / Cubit (or your choice of state management)

GetIt (Dependency Injection)

Multi_Result (Optional - functional programming helpers)

Equatable

Dio (for networking)

📌 Why Use This Template?
This template is intended to reduce boilerplate and encourage separation of concerns from the start of your Flutter project. It is perfect for developers who want a head start on building production-level apps using clean architectural principles.


## Image :

![Logo](assets/icons/app_icon.png)


## Localization Generator:

### Run this Command to generate localization files
```bash
dart run generate/strings/main.dart
```

## Assets Generator:
### Run this command to activate assets generator
```bash
dart pub global activate flutter_gen
```

### Run this Command to generate app icons
```bash
dart run build_runner build
```
 
