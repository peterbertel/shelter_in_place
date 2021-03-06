# App Architecture
The purpose of this documentation is to help developers better understand the architecture of the app, including the backend authentication, data storage, and the various pages in the Flutter app.

## Contents
- [Pages in the Flutter App](#pages-in-the-flutter-app)

## Pages in the Flutter App
- [main.dart](#main.dart)
- [social_distancing.dart](#social_distancing.dart)
- [questions_controller.dart](#questions_controller.dart)
- [activities.dart](#activities.dart)
- [feelings.dart](#feelings.dart)
- [note.dart](#note.dart)
- [new_summary.dart](#new_summary.dart)

### main.dart
This defines the main app widget and defines all the routes for the app.

### social_distancing.dart
The initial question page of the app, asking if the user practiced social distancing today. Depending on whether the user clicks the Yes or No button, the value of the `socialDistance` key in the `dayModel` model will either be updated with `true` or `false`. After making the selection, the app will navigate to `questions_controller.dart`.

### questions_controller.dart
This page will display each of the questions as the user clicks the `Next` button at the bottom on the screen. Each of the pages for the questions are imported as packages at the top of the page (activities.dart, feelings.dart, note.dart). These three packages are referenced when their corresponding are initialized as the `children` of the Scaffold body.

### activities.dart
This widget asks the user which activities they completed by displaying checkboxes for each activity. For each activity a user selects, the values in the `answers` hash map corresponding to each of those activities will be set to `true`. The `Constants.activities` list is set in the `shared_const.dart` file.

### feelings.dart
This widget asks the user for the various feelings they experienced throughout the day. Like `activities.dart`, each feeling is displayed as a checkbox. Selecting a feeling will also populate the `answers` hash map, setting the value for that feeling to `true`. The `Constants.feelings` list is set in the `shared_const.dart` file.

### note.dart
This page asks the user to input a note about the day. The string value of the note will be set to the `dayModel.note` hash map index. After clicking the `Next` button on this screen, the app will navigate to the summary page, `new_summary.dart`.

### new_summary.dart
This page displays a list of widgets for each day explicitly defined in this file, starting with an entry with today's date. Each widget contains summary information defined in `single_day_summary.dart`, which includes a list of activities and feelings and a note from that day. Each day is assigned a certain smiley face based on the aggregate score of feelings for that day. The scores for each feeling are defined in `mood_const.dart`.