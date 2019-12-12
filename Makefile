PROJECT_IOS 	= ./projects/ios
PROJECT_ANDROID = ./projects/android/TodoApp
NDK_LOCATION    = $(shell dirname `which ndk-build`)

./build_ios/libtodoapp.xcodeproj: libtodoapp.gyp ./deps/djinni/support-lib/support_lib.gyp todolist.djinni
	sh ./run_djinni.sh
	deps/gyp/gyp --depth=. -f xcode -DOS=ios --generator-output ./build_ios -Ideps/djinni/common.gypi ./libtodoapp.gyp

iosg: ./build_ios/libtodoapp.xcodeproj
	xcodebuild -workspace $(PROJECT_IOS)/TodoApp.xcworkspace -scheme TodoApp -configuration 'Debug' -sdk iphonesimulator

GypAndroid.mk: libtodoapp.gyp ./deps/djinni/support-lib/support_lib.gyp todolist.djinni
	sh ./run_djinni.sh
	ANDROID_BUILD_TOP=$(NDK_LOCATION) deps/gyp/gyp --depth=. -f android -DOS=android -Ideps/djinni/common.gypi ./libtodoapp.gyp --root-target=libtodoapp_jni

android: GypAndroid.mk
	cd $(PROJECT_ANDROID) && ./gradlew app:assembleDebug
	@echo "APKs produced at:"
	@python deps/djinni/example/glob.py ./ '*.apk'

core: ./build_ios/libtodoapp.xcodeproj

clean:
	rm -rf ./build_ios 
	rm -rf ./generated-src
	cd $(PROJECT_ANDROID) && sh ./gradlew clean
	cd $(PROJECT_ANDROID) && rm -rf ./build
	cd $(PROJECT_ANDROID) && rm -rf ./app/build