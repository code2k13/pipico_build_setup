# Compiling C/C++ code for Raspberry Pi Pico
This repository provides a Dockerfile and detailed instructions that make compiling C/C++ programs for the Raspberry Pi Pico a straightforward process. The Dockerfile creates an image that allows you to compile programs for the Pi Pico from any operating system that has Docker installed. This eliminates the need to manually install packages, use OS-specific commands, or configure file paths. By using this Docker image, you can save a significant amount of time that would otherwise be spent on configuration and setup, enabling you to quickly start working on your Pi Pico project.


## Build the Docker image
To use this approach, you will need to have Docker installed on your machine, which is a one-time step. After creating the Docker image, you can use it to compile as many programs as you need. This method is compatible with all operating systems that support Docker, allowing you to seamlessly switch between different platforms without any additional setup or configuration.

Let us first create the docker image using below commands::

```bash
git clone https://github.com/code2k13/pipico_build_setup
cd pipico_build_setup
docker build . -t pipico_build_tool
```
This creates a local docker image called **pipico_build_tool**.

 
## Compiling the examples using the docker image
* [Steps for compiling blink_example](blink_example/readme.md) - Blinks onboard LED.
* [Steps for compiling oled_example](oled_example/readme.md)  - Displays text on OLED display.
* [Steps for compiling dino_names_example](dino_names_example/readme.md) - Generates random dinosaur names using a neural network and displays on OLED display.


## Troubleshooting

If you receive below error 
``` bash
CMake Error: Error required internal CMake variable not set, cmake may not be built correctly.
Missing variable is:
CMAKE_ASM_COMPILE_OBJECT
```

 try deleteing CMake.cache from build directory

```bash
rm CMakeCache.txt 
```

## Attribution
The **pico_sdk_import.cmake** file used in the project is taken from [PiPico SDK repository](https://github.com/raspberrypi/pico-sdk/blob/master/pico_sdk_init.cmake), available under [BSD-3-Clause license](https://github.com/raspberrypi/pico-sdk/blob/master/LICENSE.TXT)


