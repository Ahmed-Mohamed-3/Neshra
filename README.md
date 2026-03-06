# Neshra

**Neshra** is a Flutter news application built with a strong focus on **software architecture**, not just feature delivery.

A lot of developers build a News App as a practice project. I did too — but the goal here was different.
This project was an intentional exercise in applying **Clean Architecture**, respecting **SOLID principles**, designing a maintainable codebase, and handling real-world concerns such as **offline support**, **error handling**, **dependency management**, **theming**, and **localization**.

---

## Why this project?

The purpose of this project was not simply to display news on the screen.
The real objective was to answer questions like:

- How should responsibilities be separated across layers?
- How can business logic stay independent from UI and data sources?
- How do we build a structure that is easy to maintain and extend?
- How can failures be modeled clearly instead of being scattered across the app?
- How should an app behave when there is no internet connection?

**Neshra** was built as a practical implementation of those ideas.

---

## Core Goals

- Apply **Clean Architecture** correctly
- Follow **SOLID principles** in a practical way
- Keep the codebase **scalable**, **testable**, and **maintainable**
- Separate concerns between UI, business logic, and data access
- Build a predictable **error-handling flow**
- Support **offline-first behavior** through local caching
- Provide a better user experience with **system-based theming** and **localization**

---

## Features

- Fetch news data from a remote source
- Cache data locally and use it when the device is offline
- Browse content through organized presentation layers
- Support **Dark Theme** and **Light Theme** based on the device theme
- Support **Localization** for multi-language experience
- Responsive UI handling
- Loading states with shimmer effects
- Splash screen and polished user experience touches

---

## Architecture Overview

The project follows **Clean Architecture** with a feature-first structure.
Each feature is divided into clear layers:

### 1. Data Layer
Responsible for:
- Remote data sources
- Local data sources
- Models
- Repository implementations

### 2. Domain Layer
Responsible for:
- Repository abstractions
- Use cases
- Core business rules

### 3. Presentation Layer
Responsible for:
- UI screens and widgets
- State management with Cubit
- Mapping app state into user-visible behavior

### 4. Core Layer
Contains shared modules such as:
- Dependency injection
- Networking
- Error models
- Caching utilities
- Theme setup
- Shared extensions

This structure helps keep the app modular and reduces coupling between layers.

---

## Engineering Decisions

### Clean Architecture is more than folders
This project was not structured this way for appearance only.
Each layer has a defined responsibility and depends only on what it should depend on.
That makes the code easier to reason about and safer to evolve.

### Repository Pattern
The repository layer acts as the boundary between the app's domain logic and its data sources.
This makes it possible to switch between remote and local sources without affecting the rest of the app.

### Use Cases
Instead of placing business logic directly inside Cubits or screens, the app uses dedicated use cases.
That keeps the presentation layer focused on state and rendering, not business rules.

### Functional Error Handling
Failures are modeled explicitly using a failure-based approach with `Either`, rather than relying on loosely managed exceptions.
This makes success and failure paths more predictable across the app.

### Offline Support
If internet is unavailable, the app can fall back to locally cached data.
This was added as an architectural decision, not as a quick patch.
The goal was to separate **where data comes from** from **how the app decides which source to use**.

### Dependency Injection
Dependencies are registered and resolved through a proper DI setup.
This reduces tight coupling and improves maintainability.

---

## Tech Choices and Why They Matter

Instead of adding packages just for the sake of using them, each tool in the project serves a specific architectural purpose:

- **flutter_bloc / Cubit** → keeps state management predictable and presentation logic organized
- **Dio** → builds a clean and extensible networking layer
- **Hive** → provides lightweight local persistence for caching
- **get_it + injectable** → supports dependency inversion and cleaner object wiring
- **fpdart** → helps model result/failure flows more clearly
- **connectivity_plus** → supports online/offline behavior decisions
- **easy_localization** → enables localization support in a maintainable way
- **flutter_screenutil** → improves UI adaptability across screen sizes
- **shimmer** → improves loading-state UX
- **lottie** → adds better motion and visual feedback where needed

---

## Project Structure

```text
lib/
├── core/
│   ├── cashing/
│   ├── di/
│   ├── error/
│   ├── extention/
│   ├── network/
│   └── theme/
│
├── features/
│   ├── app_settings/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   ├── home/
│   │   ├── data/
│   │   │   ├── data_source/
│   │   │   │   ├── local/
│   │   │   │   └── remote/
│   │   │   ├── models/
│   │   │   └── repository/
│   │   ├── domain/
│   │   │   ├── repository/
│   │   │   └── use_cases/
│   │   └── presentation/
│   │       ├── cubit/
│   │       ├── screens/
│   │       └── widgets/
│   │
│   └── splash/
│       └── presentation/
│           └── screens/
│
└── main.dart
```

This structure reflects a feature-based implementation of Clean Architecture, with shared logic extracted into `core` and app behavior split clearly by responsibility.

---

## State Management Flow

The presentation layer uses **Cubit** to expose states to the UI.
Cubits do not directly know how data is fetched.
Instead, they trigger **use cases**, which depend on **repository abstractions**, while actual data access happens inside repository implementations.

This keeps the flow clear:

**UI → Cubit → Use Case → Repository → Data Source**

---

## Error Handling Strategy

A major focus in this project was building a cleaner failure flow.

Instead of scattering `try/catch` logic throughout the UI layer:

- exceptions are raised in the data layer where needed
- exceptions are mapped into failures
- failures are returned in a controlled way
- the presentation layer reacts to state, not raw exceptions

This makes the app easier to maintain and gives the user more consistent behavior.

---

## Theming and Localization

The project includes:

- **Dark Theme / Light Theme** support based on the current device theme
- **Localization** support to make the app ready for multilingual use

These were treated as part of the product structure from the beginning, not as last-minute enhancements.

---

## Getting Started

### Prerequisites

Make sure you have:

- Flutter SDK installed
- Dart SDK installed
- A connected emulator or physical device

### Installation

```bash
git clone https://github.com/Ahmed-Mohamed-3/Neshra.git
cd neshra
flutter pub get
```

### Generate required files

Because the project uses code generation for dependency injection and Hive adapters, run:

```bash
dart run build_runner build 
```

### Run the app

```bash
flutter run
```

---

## Assets

The project uses the following asset folders:

- `assets/images/`
- `assets/translations/`
- `assets/lottie/`

---

## What this project taught me

This project reinforced an important idea:

> Building an app that works is one thing.
> Building an app that remains understandable, maintainable, and extendable is something else.

Through **Neshra**, the goal was to practice writing code that is not only functional, but also structured in a way that makes future change safer and easier.

---

## Future Improvements

Possible next steps for the project:

- Add unit tests for use cases and repositories
- Add widget tests for presentation logic
- Improve cache invalidation strategy
- Add search and filtering features
- Add pagination for larger datasets
- Improve accessibility and UI polishing

---

## Author

Built by **Ahmed Mohamed** as a practical Flutter architecture project.

**LinkedIn:** [Ahmed Mohamed](https://www.linkedin.com/in/ahmed-mohamed-1b43b6265)
