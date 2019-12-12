# coins-lib

## Building

Build C libraries:

    $ make core

## iOS

Configure your XCode custom paths for signing:

    $ defaults write com.apple.dt.Xcode IDEApplicationwideBuildSettings -dict-add DEVELOPMENT_TEAM <MY_CERTIFICATE_ID>
    $ defaults write com.apple.dt.Xcode IDESourceTreeDisplayNames -dict-add DEVELOPMENT_TEAM "Development Team"

Build iOS static libraries:

    $ make ios

## Android

Update `ndk.dir` in [local.properties](projects/android/TodoApp/local.properties)

Build Android shared libraries:

    $ make android
