# Compiling the dino_names_example program


## Run the docker image

To proceed, you need to spawn a Docker container using the pipico_build_tool image that we built earlier and mount the **dino_names_example** directory from this repository as a volume.   

```bash
sudo docker run -it -v FULL_PATH/pipico_build_setup/dino_names_example/:/app pipico_build_tool
```
> 💡 Please note that on certain operating systems, using a relative path with the -v switch may not work as intended. It is therefore highly recommended to use the full path to the **dino_names_example** folder instead.


## Build our code using the docker container 

> ⚠️ The below commands have to be executed in the docker container's  bash prompt.

In the shell prompt of the **docker container** verify if the volume has been mounted successfully by executing:

```bash
 ls
```
should show some output like this:

```bash
CMakeLists.txt  main.cxx  pico_sdk_import.cmake readme.md
``` 

We will need the Eigen library for matrix multiplication in C++. So, we clone the library in the 'app' folder of the container. Also, we will  use the **pico-ssd1306** library from [David Schramm](https://github.com/daschr/pico-ssd1306) to show text on OLED dispaly , so let us fetch the source code of the two libraries from git

```bash
git clone https://gitlab.com/libeigen/eigen.git
git clone https://github.com/daschr/pico-ssd1306
```

To build our program, we will first create a new directory called **build** in the container. Next, we will run **CMake** in this directory to generate the necessary makefile and configuration files. Finally, we will run the **make** command to build our program in the container.

```bash
mkdir build
cd build
cmake ..
make
```

## Connecting the OLED Display

Ensure that the OLED display is connected to Pi Pico:

| Display PIN         | Pi Pico Pin |
|--------------|:-----:|
| VCC |  VCC |
| GND      |  GND |
| SCL      |  GP3 |
| SDA      |  GP2 |

## Copying the program to Pi Pico board

After building the OLED example, you can locate the resulting **dino_names_example.uf2** file in the **dino_names_example/build/** directory on your machine. This file can also be found inside the docker container at **app/build/dino_names_example.uf2**. 

Once you have this file, connect your Pi Pico board to your computer by holding down the 'bootsel' button and releasing it once the board is connected. Then, all you need to do is copy the **dino_names_example.uf2** file to your Pi Pico. You should start seeing randomly generated dinosaur names !