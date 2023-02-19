# Compiling the blink_example program


## Run the docker image

To proceed, you need to spawn a Docker container using the pipico_build_tool image that we built earlier and mount the **blink_example** directory from this repository as a volume.   

```bash
sudo docker run -it -v FULL_PATH/pipico_build_setup/blink_example/:/app pipico_build_tool
```
> 💡 Please note that on certain operating systems, using a relative path with the -v switch may not work as intended. It is therefore highly recommended to use the full path to the **blink_example** folder instead.


## Build our code using the docker container 

> ⚠️ The below commands have to be executed in the docker container's  bash prompt.

In the shell prompt of the **docker container** verify if the volume has been mounted successfully by executing:

```bash
 ls
```
should show some output like this:

```bash
CMakeLists.txt  main.c  pico_sdk_import.cmake readme.md
``` 

To build our program, we will first create a new directory called **build** in the container. Next, we will run **CMake** in this directory to generate the necessary makefile and configuration files. Finally, we will run the **make** command to build our program in the container.

```bash
mkdir build
cd build
cmake ..
make
```

## Copying the program to Pi Pico board

After building the OLED example, you can locate the resulting **blink_example.uf2** file in the **blink_example/build/** directory on your machine. This file can also be found inside the docker container at **app/build/blink_example.uf2**. 

Once you have this file, connect your Pi Pico board to your computer by holding down the 'bootsel' button and releasing it once the board is connected. Then, all you need to do is copy the **blink_example.uf2** file to your Pi Pico. You should see the board's LED blink.