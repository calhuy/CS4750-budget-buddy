# budget_buddy

Flutter Project Prototype for budgeting app

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


Hi! Welcome to my simple application in Flutter.

It was designed to be a budgeting application without all the clutter/linking bank accounts/having direct access to private information.

The asset folder is optional, it was initially used to create a background image with a saved image, but as I programmed it, I realized that using the listView object wouldn't work.

The library folder contains the bulk of the implementation.

We have our page folder, which contains all the different screens that the app has.
The util folder, which contains the SharedPreference dependencies needed to save local storage.
And finally, our main.dart file; which runs our program.

The screens are consisted of a listview class that contains widget children which can further be broken down into our individual UI pieces.
This ranges from buttons, text fields, text boxes, everything text.

The util folder is easily one of the most complicated files in this project because of the SharedPreferences dependecy.
By using SharedPreferences, the application can save data to local storage, so this app is aimed to be used offline.

Due to this, we're able to also create a button that can clear data, at the expense of re-opening the app.

Most of the UI creation was complicated to learn but having the app being able to store local data is a major success!

I hope you enjoy my simple project and feel free to play with it if you'd like.