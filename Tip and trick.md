Convert decimal to hex using python

````py
result = int(hex(11208704838),16) & 0xffffffff
f'{result:08x}'
````

**Compiling arm on ubuntu**

install 
sudo apt install binutils-aarch64-linux-gnu


aarch64-linux-gnu-as -o a.o [the name of your source file]
aarch64-linux-gnu-gcc -static -o [the name of the executable] a.o



**Compiling intel assembly**

Compile a assembly and c codes which execute the assembly with a give augments
````
gcc -masm=intel -m32 -c test_modified.S -o test_modified.o
gcc -m32 -c solve.c -o solve.o
gcc -m32 test_modified.o solve.o -o solve
````

*Simpler version*
```

as -o chall.o chall.s
gcc -o chall chall.o
```


*GNU linker* 
```

as -o chall.o chall.s
ld -o chall chall.o
```


```
as --32 -o asm_code.o asm_code.asm
ld -o asm_code asm_code.o
```

# Adding burp cert to android

1. Start proxy software
2. Config proxy
3. Set proxy for the emulator
4. Intercept traffic
5. Import CA cert
6. Trust Ca cert 
7. Itercept HTTPS traffic
8. If SSL pinning try Frida or Objection


Requirements:

- Android studio for virtual phone
- Burp suite

1. Start up burp suite and open the burp browser and go to http://burp ,click the *CA Certificate* to download burp cert. Rename it from *Cacert.der* to *Cacert.crt* 
 - Create a proxy listerner on *all interfaces* using port *8082*.

2. Start you virtual phone within Android studio, once started drag the crt file from your computer onto the virtual phone and it will upload the file to the device automatically. 

3. Install the crt on the phone by going to *settings* > *Sercurity* > *Encryption & Credentials* > *Install Certifcates* > *Install anyway*. Now browse to the *Download* folder

4. On the virtual device settings click the ellipses icon on the right options panel. Choose Settings > Proxy and add your Burp proxy settings we set up in the first step. Click Apply to apply the changes. This will allow your emulated device to proxy traffic to Burp.


# Install app on android without App store

Go to F-Droid.org and download the APK file now drag the file from your computer to the device and it will automatically install F-droid.


# Patching Android Application

1. Decompile Source Code: apktool d -r <target.apk>
```
apktool d myapp.apk -o output
```
2. Download frida-gadget for your CPU Architecture

[Frida releases](https://github.com/frida/frida/releases)

3. Unzip File, and rename file to frida-gadget.so

```
unxz frida-gadget-9.1.26-android-arm.so.xz
```

4. Inject Frida-gadget into Android App under: /lib/<CPUArch-For-Your-Device>
*And rename to libfrida-gadget.so*

```
cp frida_libs/armeabi/frida-gadget-9.1.26-android-arm.so out_dir/lib/armeabi/libfrida-gadget.so
```

5. Add the Internet permission to the manifest if it’s not there already, so that Frida gadget can open a socket.

```
<uses-permission android:name="android.permission.INTERNET" />
```

6. Add reference to frida-gadget to SMALI code, in a known exported activity or otherwise accessible Activity *usually MainActivity.smali, or OnboardingActivity.smali* const-string v0, "frida-gadget" invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)

```
const-string v0, "frida-gadget" 
invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
```




7. Recompile Application 

```
apktool b -o <target.apk> <output_file.apk> 
```

8. Sign with your key, and zipalign the app

```
keytool -genkey -v -keystore custom.keystore -alias mykeyaliasname -keyalg RSA -keysize 2048 -validity 10000
```
```
jarsigner -sigalg SHA1withRSA -digestalg SHA1 -keystore mycustom.keystore -storepass mystorepass repackaged.apk mykeyaliasname
```
```
jarsigner -verify repackaged.apk
```
```
zipalign 4 repackaged.apk repackaged-final.apk
```

An easier way to patch the APK is using objection, 

```
objection patchapk <target apk>
```


Once the application have been patch you can iteract with application using:

```
objection explore
```

To disable sslpinning run the following command within objection

```
android sslpinning disable
```