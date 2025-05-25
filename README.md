# Mobile Application Development Project for COMP3130

This repository will contain your Flutter mobile app
project for COMP3130.

This project is aiming to produce an app that allows users to submit reports on damaged public infrastructure. It will utilise multiple features such as user authentication, location services and photo services to provide an innovative and practical experience for users of the app. The final MVP implementation will be a functional app that shows the core features to display the apps purpose.

## SpotReport Summary

SpotReport is an app that allows users to report damage detected on public infrastructure. The core functionalities of the app allow users to report damage by submitting photos of the damage, its location, descriptions and the type of damage. Furthermore, an additional functionality is report history, displaying all the previously submitted reports by the user. The app is targeted at young to older adults, benefiting the community by raising awareness of damages in the area that may affect them.

## Design Changes

In development, there were a few changes in the design of the app with a mix of major and minor changes.

A significant design change was the login screen, this was based on the feedback given where the phone authentication would've been too complex with the requirements of a server. The change was to a simple email and password login screen. Additionally, with the change it would now require proper registration of an account with the password, so a register sub-screen was also added.

The location field in the report screen has the same purpose but the input has been adjusted with a button from the icon which automatically fills the location in the text field. This utilises the location services but the text field still functions, so users have a choice to either autofill or input themselves.

For the report history changes, after reassessing the description of the individual reports, the status was removed as whilst the concept is useful, there is currently no possibility to know where the status is coming from. This was replaced with the damage type but the line placement was also switched with the date reported.

The initial design of the SpotReport app included a home dashboard screen but it was noted the MVP would not include that screen. However, a placeholder home screen was created to allow the navigation bar to function properly.

The last design change was the app name in the app bar for all the screens, as it was noticeable that the identification of the app was unknown. It's consistent on all the screens similar to the language button.

## Devices Developed For and Tested

While developing SpotReport, three devices were used to test the app: Xcode iOS simulator,  Android simulator and Chrome browser. However, the iOS simulator was utilised the most because the Android simulator had a few issues with device performance.

## Extra Information

Android simulator did run the few times I tested the app, but it wasn't often as it caused my device to slow down in performance significantly.

Update: Due to plugin and Gradle conflicts, the Android build for the build.gradle.kts file in the root project was unable to be fixed. Reloading, commenting and inputing possible fixes weren't fixing the file and it continued to persist with the same error causing the android to not build. However, Web is working to the assignment requirements.

The add a photo button was kept on the reporting screen but due to Firebase storage not being available, saving photos permanently is not possible.
