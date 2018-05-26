# Prerequisites
* git  
* gedit  
* CMake

# how to
* Change the current working directory to the home directory: `cd ~`  
* Download vcpkg using git: `git clone https://github.com/Microsoft/vcpkg`  
* Change the current working directory to the vcpkg directory: `cd ~/vcpkg`  
* Bootstrap vcpkg: `./bootstrap-vcpkg.sh `  
* Enter the `pwd` command and remember its output.  
* Open the `~/.profile` file using gedit: `gedit ~/.profile &`  
* Add something like`export PATH=$PATH:/home/phil/vcpkg` to the end of the file, replacing `/home/phil/vcpkg` with the path you were suppossed to remember.  
* Restart the machine: `sudo /sbin/shutdown -r now`  
* Enter `vcpkg --help` while not in the vcpkg directory to verify the installiation, vcpkg's help should show up.  
* You can show all packages available using `vcpkg search --x-full-desc`  
* Install fmt library as an example: `vcpkg install fmt`  
* The package should tell you about its CMake targets:  
   `find_package(fmt CONFIG REQUIRED)`  
    `target_link_libraries(main PRIVATE fmt::fmt fmt::fmt-header-only)`  
* So your `CMakeLists.txt` file can just look like this:    
```  
 # CMakeLists.txt  
cmake_minimum_required(VERSION 3.0)  
project(test)  

find_package(fmt CONFIG REQUIRED)  

add_executable(main main.cpp)  
target_link_libraries(main PRIVATE fmt::fmt fmt::fmt-header-only)  
```  
(assuming you only have a main.cpp file.  

* Fill your `main.cpp` file with the following content:  
```  
#include <fmt/printf.h>  
  
int main()  
{
    fmt::printf("Hello, %s!\n", "world");  
}  
  
```  
* Create a `build` subdirectory: `mkdir build`  
* Change the current working directory to the `build` subdirectory: `cd build`  
* Use CMake to generate the platform specific build scripts using something like: `cmake .. "-DCMAKE_TOOLCHAIN_FILE=~/vcpkg/scripts/buildsystems/vcpkg.cmake"`  
* Build the application using something like: `cmake --build .`  

