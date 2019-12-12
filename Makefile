# Parameters
BUILD_DIR       = ./DerivedData
PRODUCTS_DIR    = $(BUILD_DIR)/Build/Products
PROJECT_CLI		= ./projects/cli/TodoApp
PROJECT_ANDROID = ./projects/android/TodoApp
PROJECT_IOS 	= ./projects/ios/TodoApp
NDK_LOCATION    = $(shell dirname `which ndk-build`)

# Core
./build_ios/libtodoapp.xcodeproj: libtodoapp.gyp ./deps/djinni/support-lib/support_lib.gyp todolist.djinni
	sh ./run_djinni.sh
	deps/gyp/gyp --depth=. -f xcode -DOS=ios --generator-output ./build_ios -Ideps/djinni/common.gypi ./libtodoapp.gyp

core: ./build_ios/libtodoapp.xcodeproj

# iOS & OSX
cli:
	xcodebuild -workspace $(PROJECT_CLI)/TodoApp.xcworkspace -scheme TodoApp -configuration 'Debug' -sdk macosx -derivedDataPath $(BUILD_DIR)

ios: ./build_ios/libtodoapp.xcodeproj
	xcodebuild -workspace $(PROJECT_IOS)/TodoApp.xcworkspace -scheme TodoApp -configuration 'Debug' -sdk iphonesimulator -derivedDataPath $(BUILD_DIR)

# Android
GypAndroid.mk: libtodoapp.gyp ./deps/djinni/support-lib/support_lib.gyp todolist.djinni
	sh ./run_djinni.sh
	ANDROID_BUILD_TOP=$(NDK_LOCATION) deps/gyp/gyp --depth=. -f android -DOS=android -Ideps/djinni/common.gypi ./libtodoapp.gyp --root-target=libtodoapp_jni

android: GypAndroid.mk
	cd $(PROJECT_ANDROID) && ./gradlew app:assembleDebug
	@echo "APKs produced at:"
	@python deps/djinni/example/glob.py ./ '*.apk'

# Cleanup
clean: clean-android
	rm -rf ./build_ios 
	rm -rf ./generated-src

clean-android:
	cd $(PROJECT_ANDROID) && sh ./gradlew clean
	cd $(PROJECT_ANDROID) && rm -rf ./build
	cd $(PROJECT_ANDROID) && rm -rf ./app/build

# Run shortcuts
ios-simulator:
	open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app

cli-exec:
	$(PRODUCTS_DIR)/Debug/TodoApp

ios-exec:
	xcrun simctl install booted $(PRODUCTS_DIR)/Debug-iphonesimulator/TodoApp.app
