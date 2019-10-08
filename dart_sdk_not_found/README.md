# Failed to load asset at path: packages/build_web_compilers/src/dev_compiler/dart_sdk.js

Reference app for [issue 42247](https://github.com/flutter/flutter/issues/42247).

## Setup

Clone the `flutter-issues` repository and navigate to the appropriate directory.

```sh
git clone git@github.com:davidcavazos/flutter-issues.git
cd flutter-issues/dart_sdk_not_found
```

## To reproduce bug

Run the app in Chrome.

```sh
flutter run -d chrome -v
```

After the build, just before the service is ready, the following error appears:

```
[        ] Attempting to connect to browser instance..
[+4714 ms] Failed to load asset at path: packages/build_web_compilers/src/dev_compiler/dart_sdk.js.

                    Status code: 404

                    Headers:
                    {
                      "date": "Tue, 08 Oct 2019 17:15:29 GMT",
                      "content-length": "9",
                      "x-frame-options": "SAMEORIGIN",
                      "content-type": "text/plain; charset=utf-8",
                      "x-xss-protection": "1; mode=block",
                      "x-content-type-options": "nosniff",
                      "server": "dart:io with Shelf",
                      "via": "1.1 shelf_proxy"
                    }

                    Content:
                    Not Found
```

The web app works as expected, but this slows down the startup process for ~5 seconds.

## Flutter doctor

```
> flutter doctor -v
[✓] Flutter (Channel master, v1.10.14-pre.15, on Mac OS X 10.14.6 18G95, locale en-US)
    • Flutter version 1.10.14-pre.15 at /Users/dcavazos/local/flutter
    • Framework revision 83e5a8a0e4 (47 minutes ago), 2019-10-08 18:32:10 +0200
    • Engine revision 819b0cae0c
    • Dart version 2.6.0 (build 2.6.0-dev.0.0 8ba6f7e2eb)

 
[✓] Android toolchain - develop for Android devices (Android SDK version 29.0.2)
    • Android SDK at /Users/dcavazos/Library/Android/sdk
    • Android NDK location not configured (optional; useful for native profiling support)
    • Platform android-29, build-tools 29.0.2
    • Java binary at: /Applications/Android Studio.app/Contents/jre/jdk/Contents/Home/bin/java
    • Java version OpenJDK Runtime Environment (build 1.8.0_202-release-1483-b49-5587405)
    • All Android licenses accepted.

[✓] Xcode - develop for iOS and macOS (Xcode 10.1)
    • Xcode at /Applications/Xcode.app/Contents/Developer
    • Xcode 10.1, Build version 10B61
    • CocoaPods version 1.8.1

[✓] Chrome - develop for the web
    • Chrome at /Applications/Google Chrome.app/Contents/MacOS/Google Chrome

[✓] Android Studio (version 3.5)
    • Android Studio at /Applications/Android Studio.app/Contents
    • Flutter plugin version 39.0.3
    • Dart plugin version 191.8423
    • Java version OpenJDK Runtime Environment (build 1.8.0_202-release-1483-b49-5587405)

[✓] IntelliJ IDEA Community Edition (version 2019.2.1)
    • IntelliJ at /Applications/IntelliJ IDEA CE.app
    • Flutter plugin version 39.0.5
    • Dart plugin version 192.6262.58

[✓] VS Code (version 1.38.1)
    • VS Code at /Applications/Visual Studio Code.app/Contents
    • Flutter extension version 3.5.1

[✓] Connected device (2 available)
    • Chrome          • chrome          • web-javascript • Google Chrome 77.0.3865.90
    • Headless Server • headless-server • web-javascript • Flutter Tools

• No issues found!
```
