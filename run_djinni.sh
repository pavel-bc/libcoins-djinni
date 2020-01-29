#! /usr/bin/env bash
 
BASE_DIR=$(cd "`dirname "0"`" && pwd)

# Output directories
CPP_OUT="$BASE_DIR/generated-src/cpp"
JNI_OUT="$BASE_DIR/generated-src/jni"
OBJC_OUT="$BASE_DIR/generated-src/objc"
JAVA_OUT="$BASE_DIR/generated-src/java/com/blockchain/libcoins"

# Namespaces
JAVA_PKG="com.blockchain.libcoins"
CPP_NS="libcoins"
OBJC_NS="LibCoins"
DJINNI_FILE="libcoins.djinni"

# Naming style
JNI_CLASS="LibCoinsFooBar"
JNI_FILE="LibCoinsFooBar"
JNI_FIELD="mFooBar"
 
# Run generator
deps/djinni/src/run \
   --java-out $JAVA_OUT \
   --java-package $JAVA_PKG \
   --ident-java-field $JNI_FIELD \
   --cpp-out $CPP_OUT \
   --cpp-namespace $CPP_NS \
   --jni-out $JNI_OUT \
   --ident-jni-class $JNI_CLASS \
   --ident-jni-file $JNI_FILE \
   --objc-out $OBJC_OUT \
   --objc-type-prefix $OBJC_NS \
   --objcpp-out $OBJC_OUT \
   --idl $DJINNI_FILE
