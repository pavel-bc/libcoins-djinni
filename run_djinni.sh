#! /usr/bin/env bash
 
BASE_DIR=$(cd "`dirname "0"`" && pwd)

CPP_OUT="$BASE_DIR/generated-src/cpp"
JNI_OUT="$BASE_DIR/generated-src/jni"
OBJC_OUT="$BASE_DIR/generated-src/objc"
JAVA_OUT="$BASE_DIR/generated-src/java/com/blockchain/todolist"

JAVA_PKG="com.blockchain.todolist"
CPP_NS="todolist"
OBJC_NS="TDA"
DJINNI_FILE="todolist.djinni"
 
deps/djinni/src/run \
   --java-out $JAVA_OUT \
   --java-package $JAVA_PKG \
   --ident-java-field mFooBar \
   \
   --cpp-out $CPP_OUT \
   --cpp-namespace $CPP_NS \
   \
   --jni-out $JNI_OUT \
   --ident-jni-class NativeFooBar \
   --ident-jni-file NativeFooBar \
   \
   --objc-out $OBJC_OUT \
   --objc-type-prefix $OBJC_NS \
   \
   --objcpp-out $OBJC_OUT \
   \
   --idl $DJINNI_FILE
