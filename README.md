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

    $ make install-ios

## Android

Set environment variables to correct SDK/NDK locations:

- `ANDROID_SDK_ROOT`
- `ANDROID_NDK_ROOT`

Build Android shared libraries:

    $ make android

Create Android virtual device (if necessary):

    $ make virtual-device

Boot Android emulator:

    $ make emulator

Install app to device:

    $ make install-android
