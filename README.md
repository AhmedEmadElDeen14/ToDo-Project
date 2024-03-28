# ToDo App

ToDo App is a Flutter-based application that allows users to manage their tasks efficiently. Users can create an account using email/password or Google authentication via Firebase. The app utilizes Cloud Firestore to store task data securely, ensuring that each user can only access their own tasks.

## Features

- User authentication: Sign up and sign in using email/password or Google authentication.
- Task management: Add, edit, and delete tasks.
- Cloud storage: All task data is stored securely in Cloud Firestore.
- User privacy: Each user can only access their own tasks, ensuring data privacy.

## Dependencies

- [flutter](https://flutter.dev/)
- [cupertino_icons](https://pub.dev/packages/cupertino_icons)
- [date_picker_timeline](https://pub.dev/packages/date_picker_timeline)
- [flutter_slidable](https://pub.dev/packages/flutter_slidable)
- [google_fonts](https://pub.dev/packages/google_fonts)
- [cloud_firestore](https://pub.dev/packages/cloud_firestore)
- [firebase_core](https://pub.dev/packages/firebase_core)
- [firebase_auth](https://pub.dev/packages/firebase_auth)
- [google_sign_in](https://pub.dev/packages/google_sign_in)
- [provider](https://pub.dev/packages/provider)

## Getting Started

1. Clone this repository.
2. Ensure you have Flutter installed. For installation instructions, refer to the [official Flutter documentation](https://flutter.dev/docs/get-started/install).
3. Set up Firebase project and enable Firestore and authentication.
4. Replace the Firebase configuration in the `android/app/google-services.json` and `ios/Runner/GoogleService-Info.plist` files with your own Firebase project configuration.
5. Run the app on an emulator or physical device.

##Route Academy:
- This project was developed during the Flutter course at Route Academy, where the fundamentals of Flutter, Dart programming, and mobile app development were covered.

