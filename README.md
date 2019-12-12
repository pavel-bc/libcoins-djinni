# coins-lib

## Building

Build C libraries & generation type definitions from IDL:

    $ make core

## CLI

Build: 

    $ make cli

Run:

    $ make cli-exec

## iOS

Set XCode custom path value with your signing certificate ID:

    $ defaults write com.apple.dt.Xcode IDEApplicationwideBuildSettings -dict-add DEVELOPMENT_TEAM <MY_CERTIFICATE_ID>
    $ defaults write com.apple.dt.Xcode IDESourceTreeDisplayNames -dict-add DEVELOPMENT_TEAM "Development Team"

Build iOS static libraries:

    $ make ios

Open & boot a simulator:

    $ make ios-simulator

Deploy build to simulator:

    $ make ios-exec

## Android

Set correct paths to SDK locations:

    $ export PROPERTIES_FILE=./projects/android/local.properties
    $ echo "sdk.dir=<ANDROID_SDK_DIRECTORY>" >> $PROPERTIES_FILE
    $ echo "ndk.dir=<ANDROID_NDK_DIRECTORY>" >> $PROPERTIES_FILE

Build Android shared libraries:

    $ make android
