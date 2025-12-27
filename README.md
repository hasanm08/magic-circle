# Magic Circle 🪄

A premium Flutter application that fetches random images and creates an immersive experience by adaptively changing the background color to match the image's dominant colors using custom K-Means clustering.

## 📱 Demo

### Video Demonstration
![App Walkthrough](Demo/Screen%20Recording%202025-12-27%20at%2009.21.54.mov)

### Screenshots
<p align="center">
  <img src="Demo/Simulator%20Screenshot%20-%20iPhone%2016%20Pro%20-%202025-12-27%20at%2009.05.25.png" width="30%" />
  <img src="Demo/Simulator%20Screenshot%20-%20iPhone%2016%20Pro%20-%202025-12-27%20at%2009.13.43.png" width="30%" />
  <img src="Demo/Simulator%20Screenshot%20-%20iPhone%2016%20Pro%20-%202025-12-27%20at%2009.17.26.png" width="30%" />
</p>

## ✨ Features

- **Adaptive Background**: The screen color dynamically updates based on the image's dominant colors.
- **Smooth Transitions**: Uses `AnimatedCrossFade` and `AnimatedContainer` for buttery-smooth state transitions and color changes.
- **Custom Color Extraction**: High-performance K-Means clustering algorithm for dominant color extraction from raw image bytes.
- **Modern UI**: Clean, minimal design with soft shadows and rounded corners.
- **Robust State Management**: Powered by `flutter_bloc` and `freezed` for immutable, predictable state handling.
- **Efficient Networking**: `dio` for API calls and `cached_network_image` for smart caching.

## 🏗️ Architecture

- **BLoC Pattern**: Clean separation of business logic and UI.
- **Freezed**: Union types for Events and States to ensure exhaustive pattern matching and immutability.
- **Dependency Injection**: `get_it` for a unified service locator.
- **Responsive Design**: Adapts to various screen sizes using `MediaQuery` constraints.

## 📂 Project Structure

```text
lib/
├── core/
│   ├── di/           # Service Locator setup
│   └── router/       # GoRouter configuration
├── data/
│   ├── models/       # ImageModel definition
│   └── repositories/ # ImageRepository for API interaction
├── logic/
│   ├── bloc/         # ImageBloc, Event, and State (Freezed)
│   └── dominant_color.dart # K-Means implementation
└── presentation/
    └── screens/      # ImageScreen and ImageScreenView
```

## 🧪 Testing

The project includes unit tests for the BLoC logic to ensure reliability.

```bash
flutter test
```

## 🚀 Getting Started

1. Clone the repository.
2. Install dependencies: `flutter pub get`.
3. Generate Freezed files: `flutter pub run build_runner build --delete-conflicting-outputs`.
4. Run the app: `flutter run`.
