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

Build iOS static libraries:

    $ make ios

Open & boot a simulator:

    $ make simulator

Install app to device:

    $ make ios-install

## Android

Set correct paths to SDK locations:

    $ export PROPERTIES_FILE=./projects/android/local.properties
    $ echo "sdk.dir=<ANDROID_SDK_DIRECTORY>" >> $PROPERTIES_FILE
    $ echo "ndk.dir=<ANDROID_NDK_DIRECTORY>" >> $PROPERTIES_FILE

Build Android shared libraries:

    $ make android

Run Android emulator:

    $ make emulator

Install app to device:

    $ make android-install
