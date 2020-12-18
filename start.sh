#!/bin/bash

adb shell am force-stop org.kolodez.HelloWorld
adb uninstall org.kolodez.HelloWorld
adb install -d ./bin/HelloWorld.apk
adb shell am start -c api.android.intent.LAUNCHER -a api.android.category.MAIN -n org.kolodez.HelloWorld/org.kolodez.HelloWorld.HelloClass
