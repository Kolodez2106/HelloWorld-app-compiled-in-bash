#!/bin/bash

rm -v -f -r ./obj
rm -v -f -r ./bin
rm -v -f -r ./key
mkdir ./obj
mkdir ./bin
mkdir ./key
aapt package -v -f -m -S ./src/res/ -J ./src/src/ -M ./src/AndroidManifest.xml -I /usr/lib/android-sdk/platforms/android-23/android.jar # you may need to replace "/usr/lib/android-sdk/platforms/android-23/android.jar" here and in the subsequent commands
javac -d ./obj/ -source 1.7 -target 1.7 -classpath /usr/lib/android-sdk/platforms/android-23/android.jar -sourcepath ./src/src/ ./src/src/org/kolodez/HelloWorld/*
/usr/lib/android-sdk/build-tools/27.0.1/dx --dex --output=./bin/classes.dex ./src/obj/
aapt package -f -M ./src/AndroidManifest.xml -S ./src/res/ -I /usr/lib/android-sdk/platforms/android-23/android.jar -F ./bin/HelloWorld.unsigned.apk ./bin # it is important that the ./bin/ directory does not contain any files except for classes.dex when this command starts
keytool -genkeypair -validity 10000 -dname "CN=Kolodez, OU=Kolodez, O=Kolodez, C=US" -keystore ./key/mykey.keystore -storepass mypass -keypass mypass -alias myalias -keyalg RSA
jarsigner -keystore ./key/mykey.keystore -storepass mypass -keypass mypass -signedjar ./bin/HelloWorld.signed.apk ./bin/HelloWorld.unsigned.apk myalias
zipalign -f 4 ./bin/HelloWorld.signed.apk ./bin/HelloWorld.apk
