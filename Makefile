# Directories
BUILD_DIR       = ./DerivedData
PRODUCTS_DIR    = $(BUILD_DIR)/Build/Products
PROJECT_OSX		= ./projects/osx/DemoApp
PROJECT_ANDROID = ./projects/android/DemoApp
PROJECT_IOS 	= ./projects/ios/TodoApp
NDK_LOCATION    = $(shell dirname `which ndk-build`)

# Core
./build_ios/libcoins.xcodeproj: libcoins.gyp ./deps/djinni/support-lib/support_lib.gyp libcoins.djinni
	sh ./run_djinni.sh
	deps/gyp/gyp --depth=. -f xcode -DOS=ios --generator-output ./build_ios -Ideps/djinni/common.gypi ./libcoins.gyp

./build_osx/libcoins.xcodeproj: libcoins.gyp ./deps/djinni/support-lib/support_lib.gyp libcoins.djinni
	sh ./run_djinni.sh
	deps/gyp/gyp --depth=. -f xcode -DOS=mac --generator-output ./build_osx -Ideps/djinni/common.gypi ./libcoins.gyp

core: ./build_ios/libcoins.xcodeproj ./build_osx/libcoins.xcodeproj

# iOS & OSX
cli: ./build_osx/libcoins.xcodeproj
	xcodebuild -workspace $(PROJECT_OSX)/DemoApp.xcworkspace -scheme DemoApp -configuration 'Debug' -sdk macosx -derivedDataPath $(BUILD_DIR)

ios: ./build_ios/libcoins.xcodeproj
	xcodebuild -workspace $(PROJECT_IOS)/TodoApp.xcworkspace -scheme TodoApp -configuration 'Debug' -sdk iphonesimulator -derivedDataPath $(BUILD_DIR)

# Android
GypAndroid.mk: libcoins.gyp ./deps/djinni/support-lib/support_lib.gyp libcoins.djinni
	sh ./run_djinni.sh
	ANDROID_BUILD_TOP=$(NDK_LOCATION) deps/gyp/gyp --depth=. -f android -DOS=android -Ideps/djinni/common.gypi ./libcoins.gyp --root-target=libcoins_jni

android: GypAndroid.mk
	cd $(PROJECT_ANDROID) && ./gradlew app:assembleDebug
	@echo "APKs produced at:"
	@python deps/djinni/example/glob.py ./ '*.apk'

# Cleanup
clean:
	rm -rf ./build_ios
	rm -rf ./build_osx
	rm -rf ./generated-src
	rm -rf ./GypAndroid.mk
	rm -rf libcoins_jni.target.mk		
	rm -rf $(BUILD_DIR)

clean-gradle:
	cd $(PROJECT_ANDROID) && rm -rf ./app/build
	cd $(PROJECT_ANDROID) && rm -rf ./app/libs
	cd $(PROJECT_ANDROID) && rm -rf ./app/obj
	cd $(PROJECT_ANDROID) && sh ./gradlew clean

# Run shortcuts
cli-exec:
	$(PRODUCTS_DIR)/Debug/DemoApp

simulator:
	open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app

virtual-device:
	echo no | avdmanager -s create avd -n Pixel --device pixel -k "system-images;android-28;google_apis_playstore;x86"

emulator:
	emulator -avd Pixel

install-ios:
	xcrun simctl install booted $(PRODUCTS_DIR)/Debug-iphonesimulator/TodoApp.app

install-android:
	adb install $(PROJECT_ANDROID)/app/build/outputs/apk/debug/app-debug.apk

verify:
	@which adb avdmanager emulator ndk-build
