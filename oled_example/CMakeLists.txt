cmake_minimum_required(VERSION 3.12)

# Pull in SDK (must be before project)
include(pico_sdk_import.cmake)
project(hello_world_oled) 

set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

if (PICO_SDK_VERSION_STRING VERSION_LESS "1.3.0")
    message(FATAL_ERROR "Raspberry Pi Pico SDK version 1.3.0 (or later) required. Your version is ${PICO_SDK_VERSION_STRING}")
endif()

set(CMAKE_ASM_COMPILER arm-none-eabi-gcc)
# Initialize the SDK
 
pico_sdk_init()

add_compile_options(-Wall
        -Wno-format          # int != int32_t as far as the compiler is concerned because gcc has int32_t as long int
        -Wno-unused-function # we have some for the docs that aren't called
        -Wno-maybe-uninitialized
        )

#add_subdirectory(${CMAKE_SOURCE_DIR}/pico-ssd1306/example EXCLUDE_FROM_ALL)
add_executable(hello_world_oled
        main.c   pico-ssd1306/ssd1306.c
        )


target_include_directories(hello_world_oled
        PUBLIC
            ${CMAKE_CURRENT_LIST_DIR}/pico-ssd1306
    )
    
target_link_libraries(hello_world_oled  pico_stdlib  hardware_i2c  )

pico_add_extra_outputs(hello_world_oled)