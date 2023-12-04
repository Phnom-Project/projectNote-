## adb 
- adb devices
- adb -s [emulator-name] [command]
- adb -s emulator-5554 shell
```
adb -s emulator-5554 push frida-server /data/local/tmp
adb shell #Entering into shell
su #Super user mode
chmod 777 /data/local/tmp/ #Grantint RWX access
exit
```
