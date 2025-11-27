# SeAProS

# FAQ

## How do I use this?

1. Run `git clone git@github.com:MattheDev53/6744-Setup.ps1.git .` on a flash drive
2. Run `main.ps1`
3. Follow the instructions from there

### How do I set up offline functionality?

Not fully implemented yet (working on it)

### How do I install custom Fonts/Cursors?

1. Copy the `example.ps1`
2. Write a script to install it
3. Add the option to `selector.ps1`
4. Test
5. PR if wanted

## The script won't run on a fresh install because of a policy error

Try running the following as an Administrator

```ps1
Set-ExecutionPolicy -ExecutionPolicy Undefined -Scope LocalMachine
```

## Why is it called SeAProS?

It's an acronym

```
   _____      ___    ____            _____
  / ___/___  /   |  / __ \_________ / ___/
  \__ \/ _ \/ /| | / /_/ / ___/ __ \\__ \ 
 ___/ /  __/ ___ |/ ____/ /  / /_/ /__/ / 
/____/\___/_/  |_/_/   /_/   \____/____/  

[Se]mi
[A]utonomous
[Pro]visioning
[S]ystem
```

# Why did you use Powershell?

I did this for a couple reasons

1. Portability (on Windows)
    - Powershell is available from the instant you boot into a fresh install of Windows, meaning this script can be run on any Windows PC
2. Compilation, lack of
    - Powershell being an interpreted language means that it is fast to test and ship
3. Expansion
    - Originally this started out as a project for me to set up Windows Dev Laptops easily, but this could be expanded to install much more.

# How did you get VSCodium and VSCode Insiders to work with the WPILib Installer?

The WPILib installer takes in a `.zip` file that looks something like this

```
.
├── appx
├── bin
├── chrome_100_percent.pak
├── chrome_200_percent.pak
├── Code.exe
├── Code.VisualElementsManifest.xml
├── d3dcompiler_47.dll
├── ffmpeg.dll
├── icudtl.dat
├── libEGL.dll
├── libGLESv2.dll
├── LICENSES.chromium.html
├── locales
├── policies
├── resources
├── resources.pak
├── snapshot_blob.bin
├── tools
├── v8_context_snapshot.bin
├── vk_swiftshader.dll
├── vk_swiftshader_icd.json
└── vulkan-1.dll
```

Luckily, the WPILib installer only really cares about two files

```
.
├── bin
│   └── code.cmd
└── Code.exe
```

As long as these two files are present with their proper names, the installation will be a success.

However if we look inside of VSCodium...

```
.
├── bin
│   └── codium.cmd
└── VSCodium.exe
```

This initially seems bad, but it's actually not. We can just *rename* the files to match what they would be. This works perfectly. Without `code.cmd` the WPILib Installer fails, and without `Code.exe` the shortcuts don't work (they can be modified later, but eh)
