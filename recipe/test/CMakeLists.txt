cmake_minimum_required(VERSION 3.1)
project(catch2_test)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

find_package(Catch2 2 REQUIRED)

add_executable(test_catch2 test_catch2.cpp)

target_link_libraries(test_catch2 Catch2::Catch2)

include(CTest)
include(ParseAndAddCatchTests)
ParseAndAddCatchTests(test_catch2)
