<div align="center">
  <h1>Alumni Connect</h1>
  <p>A feature-rich social and professional networking platform built with Flutter, designed to bridge the gap between alumni and their alma mater.</p>

  <p>
    <a href="https://flutter.dev/">
      <img src="https://img.shields.io/badge/Framework-Flutter-02569B?logo=flutter" alt="Framework: Flutter">
    </a>
    <a href="https://firebase.google.com/">
      <img src="https://img.shields.io/badge/Backend-Firebase-FFCA28?logo=firebase" alt="Backend: Firebase">
    </a>
    <a href="https://github.com/tulsieroyt/alumni_app/blob/main/LICENSE">
      <img src="https://img.shields.io/github/license/tulsieroyt/alumni_app?color=green" alt="License">
    </a>
    <a href="https://github.com/tulsieroyt/alumni_app/pulls">
      <img src="https://img.shields.io/badge/PRs-Welcome-brightgreen.svg" alt="PRs Welcome">
    </a>
  </p>
</div>

## Overview

**Alumni Connect** is a complete, full-stack mobile application designed to help educational institutions build and maintain a vibrant and engaged alumni community. The app provides a centralized platform for networking, sharing opportunities, and staying updated with institutional news and events, all powered by a robust Firebase backend.

## Key Features

*   **Secure User Authentication:** Safe and easy onboarding with Firebase Authentication (Email/Password, Social Logins).
*   **Comprehensive Alumni Directory:** Search, filter, and connect with fellow alumni based on name, graduation year, profession, etc.
*   **Detailed User Profiles:** Showcase academic and professional achievements, contact information, and more.
*   **News & Events Feed:** Keep the community engaged with the latest news, articles, and upcoming events from the institution.
*   **Job Board:** A dedicated section for alumni to post and discover career opportunities within the network.
*   **Real-Time Notifications:** Push notifications (via FCM) to alert users about new messages, job postings, or events.
*   **Cross-Platform Functionality:** A single, beautiful codebase that runs seamlessly on both Android and iOS.

## Application Screenshots

<img src="https://github.com/user-attachments/assets/76d25cf6-738c-43a1-a996-d184fd0eac49" width="200" height="400">
<img src="https://github.com/user-attachments/assets/4ec2bb5e-323a-47cc-8373-938c1b859bfc" width="200" height="400">
<img src="https://github.com/user-attachments/assets/bf95a7e6-6580-4e32-a51a-279ae4cbe78e" width="200" height="400">
<img src="https://github.com/user-attachments/assets/a5329fc7-daa4-487a-a436-73c89143d1fd" width="200" height="400">
<img src="https://github.com/user-attachments/assets/323538c4-aee7-4d6a-baeb-0768ee50e262" width="200" height="400">
<img src="https://github.com/user-attachments/assets/46cf39a1-52c8-48d5-b812-b999939ba12a" width="200" height="400">
<img src="https://github.com/user-attachments/assets/f93f4a38-7c39-4ef2-8132-62c6ea77bbdd" width="200" height="400">
<img src="https://github.com/user-attachments/assets/61ad6469-0ff7-42d6-a402-7607881fabec" width="200" height="400">

## Tech Stack & Architecture

*   **Framework:** **Flutter**
*   **Language:** **Dart**
*   **Backend-as-a-Service (BaaS):** **Firebase**
    *   **Authentication:** Firebase Authentication
    *   **Database:** Cloud Firestore (for real-time data)
    *   **Storage:** Firebase Cloud Storage (for profile pictures, etc.)
    *   **Notifications:** Firebase Cloud Messaging (FCM)
*   **State Management:** GetX

## Getting Started

To get a local copy up and running, follow these essential steps.

### Prerequisites

*   **Flutter SDK:** Ensure you have the latest stable version installed. [Flutter Install Guide](https://flutter.dev/docs/get-started/install).
*   **Firebase Account:** A free Firebase account is required.

### Firebase Setup & Installation

**This is a critical step.** The app will not function without being connected to a Firebase project.

1.  **Clone the Repository**
    ```sh
    git clone https://github.com/tulsieroyt/alumni_app.git
    cd alumni_app
    ```

2.  **Install the Firebase CLI & FlutterFire CLI**
    ```sh
    # If you don't have them, install and login
    npm install -g firebase-tools
    firebase login
    dart pub global activate flutterfire_cli
    ```

3.  **Configure Firebase**
    *   From the root of your project (`alumni_app/`), run the configuration command. It will prompt you to select a Firebase project (or create a new one) and will automatically generate the necessary configuration files for all platforms.
    ```sh
    flutterfire configure
    ```

4.  **Enable Firebase Services in the Console**
    *   Go to the [Firebase Console](https://console.firebase.google.com/).
    *   **Authentication:** Enable the sign-in methods you wish to support (e.g., Email/Password, Google).
    *   **Firestore:** Create a Cloud Firestore database and start in **Test mode**.
    *   **Storage:** Enable Firebase Cloud Storage.

5.  **Install Dependencies & Run**
    ```sh
    flutter pub get
    flutter run
    ```

## Project Structure

The codebase is organized into a clean and scalable architecture.

```
lib/
├── firebase_options.dart   # Auto-generated by FlutterFire
├── main.dart               # Application entry point
├── models/                 # Data models (e.g., User, Post, Job)
├── screens/                # UI screens/pages (e.g., LoginScreen, HomeScreen, ProfileScreen)
├── services/               # Backend logic (e.g., AuthService, DatabaseService)
└── widgets/                # Reusable UI components
```

## Contributing

Contributions are what make the open-source community an amazing place to learn and create. Any contributions you make are **greatly appreciated**.

1.  Fork the Project.
2.  Create your Feature Branch (`git checkout -b feature/AmazingFeature`).
3.  Commit your Changes (`git commit -m 'feat: Add some AmazingFeature'`).
4.  Push to the Branch (`git push origin feature/AmazingFeature`).
5.  Open a Pull Request.

## License

Distributed under the MIT License. See the [`LICENSE`](https://github.com/tulsieroyt/alumni_app/blob/master/LICENSE) file for more information.

---

<div align="center">
  <p>This project was created with care by Tulsie Chandra Barman. Feel free to connect!</p>
</div>
