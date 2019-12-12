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

Set paths to SDK locations:

    $ export PROPERTIES_FILE=./projects/android/local.properties
    $ touch $PROPERTIES_FILE
    $ echo "sdk.dir=<ANDROID_SDK_DIRECTORY>" > $PROPERTIES_FILE
    $ echo "ndk.dir=<ANDROID_NDK_DIRECTORY>" > $PROPERTIES_FILE

Build Android shared libraries:

    $ make android
