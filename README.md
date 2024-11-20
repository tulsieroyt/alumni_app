
# Alumni Management System

An **Alumni Management System** built using Flutter and Firebase, designed to streamline communication and engagement between alumni and their alma mater. This application facilitates networking, event management, announcements, and more.

---

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Technologies Used](#technologies-used)
- [Installation](#installation)
- [Configuration](#configuration)
- [Usage](#usage)
- [Examples](#examples)
- [Troubleshooting](#troubleshooting)
- [Contributors](#contributors)
- [License](#license)
- [Acknowledgments](#acknowledgments)

---

## Introduction

This project is a mobile-based Alumni Management System designed to:
- Help educational institutions stay connected with their alumni.
- Facilitate networking among alumni.
- Organize and manage events, announcements, and job postings.
- Provide a centralized platform for alumni engagement.

The app leverages **Flutter** for cross-platform compatibility and **Firebase** for backend services including authentication, database, and cloud functions.

---

## Features

- **Authentication:**
  - Secure login and registration for alumni using Firebase Authentication.
- **Event Management:**
  - Create, manage, and RSVP for alumni events.
- **Announcements:**
  - Share important news and updates with alumni.
- **Networking:**
  - Connect with fellow alumni through a directory.
- **Job Board:**
  - Post and browse job opportunities.
- **Push Notifications:**
  - Real-time updates for announcements and events.

---

## Technologies Used

- **Frontend:**
  - [Flutter](https://flutter.dev/) (Dart)
- **Backend:**
  - [Firebase](https://firebase.google.com/)
    - Firebase Authentication
    - Firestore Database
    - Firebase Cloud Functions
    - Firebase Storage
- **Others:**
  - Push Notifications (Firebase Cloud Messaging)
  - State Management (GetX)

---

## Installation

### Prerequisites

- Flutter SDK installed ([installation guide](https://flutter.dev/docs/get-started/install)).
- Firebase project setup ([Firebase Console](https://console.firebase.google.com/)).
- Android Studio or Visual Studio Code with Flutter plugin.

### Steps

1. Clone the repository:
   ```bash
   https://github.com/tulsieroyt/alumni_app.git
   ```
2. Navigate to the project directory:
   ```bash
   cd alumni_app
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Configure Firebase:
   - Download the `google-services.json` (for Android) and `GoogleService-Info.plist` (for iOS) from your Firebase project.
   - Place these files in the respective directories:
     - `android/app/google-services.json`
     - `ios/Runner/GoogleService-Info.plist`
5. Run the project:
   ```bash
   flutter run
   ```

---

## Configuration

Update the `firebase_options.dart` file with your Firebase project settings using the [FlutterFire CLI](https://firebase.flutter.dev/docs/cli).

---

## Usage

1. **Login/Register:** Create an account or log in using your registered credentials.
2. **Explore Features:** Access events, announcements, job boards, and the alumni directory.
3. **Admin Panel (if applicable):** Authorized users can create announcements, manage events, and monitor alumni engagement.

---

## Examples

### Alumni Directory
Manage and browse a directory of alumni, enabling networking and collaboration.

### Post Management
Create, manage normal and job posts.

---


## Screenshots
<img src="https://github.com/user-attachments/assets/76d25cf6-738c-43a1-a996-d184fd0eac49" width="200" height="400">
<img src="https://github.com/user-attachments/assets/4ec2bb5e-323a-47cc-8373-938c1b859bfc" width="200" height="400">
<img src="https://github.com/user-attachments/assets/bf95a7e6-6580-4e32-a51a-279ae4cbe78e" width="200" height="400">
<img src="https://github.com/user-attachments/assets/a5329fc7-daa4-487a-a436-73c89143d1fd" width="200" height="400">
<img src="https://github.com/user-attachments/assets/323538c4-aee7-4d6a-baeb-0768ee50e262" width="200" height="400">
<img src="https://github.com/user-attachments/assets/46cf39a1-52c8-48d5-b812-b999939ba12a" width="200" height="400">
<img src="https://github.com/user-attachments/assets/f93f4a38-7c39-4ef2-8132-62c6ea77bbdd" width="200" height="400">
<img src="https://github.com/user-attachments/assets/61ad6469-0ff7-42d6-a402-7607881fabec" width="200" height="400">


## Troubleshooting

### Firebase Connection Issues:
- Ensure your Firebase configuration files are correctly placed.
- Verify that your Flutter SDK is updated.

### Build Errors:
- Run `flutter clean` and then `flutter pub get`.
- Check your Flutter and Dart versions.

### Authentication Problems:
- Confirm that email/password authentication is enabled in your Firebase console.

---

## Contributors

- **Tulsie Chandra Barman** - [GitHub Profile](https://github.com/your-profile)

Contributions are welcome! Feel free to submit a pull request or raise issues.

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## Acknowledgments

- Thanks to the Flutter and Firebase communities for their excellent documentation and support.
- Inspiration from similar alumni management systems.

For further queries, feel free to contact: `tulsieroyt@gmail.com`.
