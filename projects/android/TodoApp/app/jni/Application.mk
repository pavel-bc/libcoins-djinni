APP_ABI := all
APP_OPTIM := release
APP_PLATFORM := android-29

# GNU libc++ is the only Android STL which supports C++11 features
APP_STL := c++_static
APP_BUILD_SCRIPT := jni/Android.mk
APP_MODULES := libtodoapp_jni
