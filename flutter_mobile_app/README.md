# Flutter Mobile App

Playful mobile companion app for this project, built with:

- Flutter
- Riverpod (`flutter_riverpod`)
- Feature-first clean architecture (`domain`, `data`, `presentation`)

## Features

1. Love Interest Analyzer
- Multi-step quiz
- Score + level + confidence explanation
- Red flags and next-move actions

2. Zodiac Compatibility
- Two exact DoB selectors
- Sun sign resolution for both people
- Compatibility score, level, chemistry/challenge insights
- Sign-level behaviors and habits

## Architecture

`lib/` is organized by feature and layers:

- `core/`
  - Shared theme and UI building blocks (`GlassPanel`, `CosmicBackground`)
- `features/home/`
  - Entry screen with navigation cards
- `features/love_interest/`
  - `domain`: entities, repository contract, use case
  - `data`: repository implementation + scoring logic
  - `presentation`: Riverpod providers, state/controller, quiz/result screen
- `features/zodiac/`
  - `domain`: entities, repository contract, use case
  - `data`: sign data + compatibility logic
  - `presentation`: Riverpod providers, state/controller, compatibility screen

## Run

```bash
cd flutter_mobile_app
flutter pub get
flutter run
```

## Quality Checks

```bash
flutter analyze
flutter test
```
