# Flutter Learnings

## Installation Process following [This](https://dev.to/0xdonut/how-to-install-flutter-on-macos-using-homebrew-and-asdf-3loa)

- I used asdf to install ruby(2.7.1), dart(2.8.3) and flutter(1.7.2-stable)
- Android Studio from their website. pretty straightforward
- Xcode from the Mac app store
- Xcode instalation is weird, downloads are slow and it broke my local git instalation for some reason.
- To fix git I had to do `xcode-select --install`, which in turn prompted me to install the xcode developer toolchain???
- The above step also didn't work, so I run `sudo xcode-select --reset` which fixed git.
- Now I tried `flutter doctor`, which gave me some things to change
- - `flutter doctor --android-licenses` to accept a lot of licenses
- - `sudo gem install cocoapods` for cocoapods followed by `pod setup`
- - Install flutter plugin on Android studio (which in turn installs dart plugin)
- - After connecting both an iPhone and an Android device via usb and trusting the computer on them, it flutter doctor recognized the connection

## First Flutter project

Created a flutter app and run it on all connected devices

```
flutter create my_app
cd my_app
flutter run -d all
```

This failed because of some signining of certificates from xcode

On xcode, I had to add my apple account and created a signing certificate.

André knows about this.

The problem was that I did not understand the interface of XCode and could not find the project settings by myself.
I had to change the name of the target bundle, that apparently has to be universally unique.

Setting it to com.wunder.flutterTest did the trick.

And with the 

```
flutter run -d all
```

command I was able to run the demo project on a two physical phones and one simulator device.

## Flutter from Visual Studio Code

First thing The Dart plugin was complaining that it could not find the Flutter SDK
I had to add the path to my currently installed `asdf` to the `~/.zshrc` file

```
export FLUTTER_ROOT="$/asdf/where/flutter/should/go/here"
```

This is a little sad because it bypasses the asdf local configuration. :shrug:

After setting the path correctly, I was able to create the flutter app.
Before being able to run it on the iOS physical device, I had to once again go into xcode and
change the BundleID of the project and add the signing team once again.

## Writing the First Flutter App! [Here](https://codelabs.developers.google.com/codelabs/first-flutter-app-pt1/)









