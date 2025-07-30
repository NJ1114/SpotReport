# SpotReport

SpotReport is an app that allows users to report damage detected on public infrastructure.

The app is targeted at young to older adults, benefiting the community by raising awareness of damage in the area that may affect them.

## Core Features

- Submit damage reports with:
  - Category of the damage
  - Location details using the `geolocator` and `geocoding` package
  - Descriptions
  - Upload photos using the `image_picker` package
- View history of user's previously submitted reports
- User Authentication via Firebase Authentication
- Data storage via Firebase Firestore

## Tech Stack

- **Language:** Dart
- **Framework:** Flutter
- **Databases:** Firebase Firestore
- **Platforms/Services:** Firebase (Authentication & Firestore)
- **Packages:**
  - `geolocator`
  - `geocoding`
  - `image_picker`
  - `firebase_auth`
  - `cloud_firestore`

## Devices Developed For and Tested

- iOS Xcode simulator
- Android Emulator
- Chrome Web

## Installation & Run Locally

```bash
# Clone the repository
git clone https://github.com/NJ1114/SpotReport.git

# Navigate to the project directory
cd SpotReport

# Install dependencies
flutter pub get

# Run in simulator, emulator or browser
flutter run
```

## Usage

## Future Development

- **Social Interaction:** Add a feature to allow users to see other reports from other users in the current viscinity of their device.