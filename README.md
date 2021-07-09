# WinIRISBuild

1. Get the IRIS 64 bit installer for windows and place in this directory.

2. Fix the Dockerfile, replace IRISHealth-2021.1.0.215.0-win_x64.exe with the name of your donloaded installer.

3. build your docker image. 

    docker build -t va/iris:2021.1 .