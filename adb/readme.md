-  python<version> -m venv <virtual-environment-name>
## powershell
- wget "http://www.contoso.com" -outfile "file"
## adb 
```shell
#list device
adb devices 

#select device and command
adb -s [emulator-name] [command]  
# example
adb -s emulator-5554 shell

# get android architec
adb shell getprop ro.product.cpu.abi

# push file to android device
adb -s emulator-5554 push frida-server /data/local/tmp
```
### android shell
```shell
# If running sucessfully, we can check with ps and grep
ps | grep frida

# change permission
chmod +x [filename]
```
### frida
```shell
# show app identifier
frida-ps -Uia
```
#### Objection
```shell
objection -g com.ali.x
```
### Regex
```shell
# value between two string
# ex : find ".json" file
/\.(.*)json/g 
```
```
adb -s emulator-5554 push frida-server /data/local/tmp
adb shell #Entering into shell
su #Super user mode
chmod 777 /data/local/tmp/ #Grantint RWX access
exit
```
