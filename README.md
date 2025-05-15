# InYourFace

![InYourFace Banner](https://via.placeholder.com/1200x300/5e72e4/ffffff?text=InYourFace)

> "Keep your most important tasks right in your face, where you can't ignore them."

InYourFace is a task management app designed to make your important tasks highly visible on your device's home screen and lock screen, helping you stay focused on what matters most.

## Table of Contents

- [Current Features](#current-features)
- [Planned Features](#planned-features)
- [Technical Implementation](#technical-implementation)
- [Installation](#installation)
- [Usage](#usage)
- [Development](#development)
  - [Project Structure](#project-structure)
  - [Contributing](#contributing)
- [License](#license)

## Current Features

### Core Functionality
- **Task Management**
  - Add up to 3 priority tasks
  - Mark tasks as completed with checkbox
  - Delete tasks when no longer needed
  - Simple, distraction-free interface

### Persistence
- Tasks are saved using `shared_preferences` for data persistence
- Tasks remain after app restart

### Home Screen Widget
- Home screen widget displaying your top priority tasks
- Real-time widget updates when you modify tasks in the app
- Visual indication (strikethrough) for completed tasks
- Timestamp showing when the widget was last updated
- Launching the app when tapping on the widget

### UI/UX
- Dark theme for better visibility and reduced eye strain
- Clean, minimalist interface focused on your tasks
- Smooth animations for task interactions

## Planned Features

### Enhanced Widget Functionality
- **Lock Screen Integration**
  - Make tasks visible on lock screen
  - Add ability to mark tasks as complete directly from lock screen
- **Widget Customization**
  - Adjustable widget opacity/background color
  - Font size and style options
  - Custom widget themes (dark/light/custom)

### Advanced Task Features
- **Task Categories**
  - Group tasks by project or category
  - Color-coding for different task types
- **Due Dates & Reminders**
  - Set due dates for tasks
  - Configurable notifications/reminders
  - Visual indicators for upcoming/overdue tasks
- **Task Priority Levels**
  - Set importance levels for different tasks
  - Sort by priority

### User Experience Improvements
- **Progress Tracking**
  - Daily/weekly completion statistics
  - Streaks for consistent task completion
  - Visual progress indicators
- **Expanded Storage**
  - Cloud synchronization
  - Task history and archive
- **Personalization**
  - Custom themes and color schemes
  - Adjustable maximum number of tasks

### Integration Features
- **Calendar Integration**
  - Sync with device calendar
  - Import events as tasks
- **Voice Input**
  - Add tasks via voice commands
- **Smart Assistant Integration**
  - Integration with digital assistants

## Technical Implementation

### Flutter App
- Cross-platform Flutter application targeting Android (initially)
- Material Design UI components with custom styling
- State management using Flutter's built-in StatefulWidget
- Task data model with JSON serialization/deserialization

### Data Storage
- `shared_preferences` for local data persistence
- JSON data structure for tasks

### Android Widget
- Native Android widget implementation 
- `home_widget` Flutter plugin for Flutter-to-Widget communication
- Custom widget layout with dynamic content
- Widget refresh via app interaction

## Installation

### Prerequisites
- Flutter SDK (3.0 or higher)
- Android Studio with Android SDK 31 (Android 12) or higher
- Git

### Getting Started
1. Clone this repository:
   ```bash
   git clone https://github.com/celilygt/InYourFace.git
   cd InYourFace
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

### Adding the Widget
After installing the app:
1. Long press on your Android home screen
2. Select "Widgets"
3. Find "InYourFace" in the widget list
4. Drag and place it on your home screen

## Usage

### Managing Tasks
1. **Adding Tasks**: Type in the text field at the top and press the + button (or hit Enter)
2. **Completing Tasks**: Tap the checkbox beside a task to mark it as complete
3. **Deleting Tasks**: Tap the trash icon to remove a task

### Widget Interaction
- The widget automatically updates when you modify tasks in the app
- Tap on the widget to open the InYourFace app

## Development

### Project Structure
```
in_your_face/
├─ lib/                     # Dart source code
│  ├─ main.dart             # App entry point and main UI
│  ├─ task_model.dart       # Task data model
├─ android/                 # Android-specific code
│  ├─ app/src/main/
│     ├─ kotlin/celilygt/in_your_face/
│        ├─ MainActivity.kt              # Main activity
│        ├─ VisibleTasksWidgetProvider.kt # Widget provider
│     ├─ res/
│        ├─ drawable/       # Drawable resources
│        ├─ layout/         # Widget layouts
│        ├─ xml/            # Widget configuration
├─ ios/                     # iOS-specific code
├─ test/                    # Test directory
```

### Building from Source
1. Make sure you have Flutter installed and set up
2. Clone the repository
3. Run `flutter pub get` to install dependencies
4. Run `flutter build apk` for an Android build or `flutter build ios` for an iOS build

### Testing the Widget
For widget testing:
1. Build and install the app (`flutter run`)
2. Add the widget to your home screen
3. Create, complete, and delete tasks in the app to see the widget update

## License

This project is licensed under the MIT License - see the LICENSE file for details.

---

## Contact

Celil Yigit - [GitHub](https://github.com/celilygt)

Project Link: [https://github.com/celilygt/InYourFace](https://github.com/celilygt/InYourFace)
