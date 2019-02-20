cmake_minimum_required(VERSION 3.1)

find_package(Catch2 2 REQUIRED)

add_executable(test_catch2 test_catch2.cpp)

target_link_libraries(test_catch2 Catch2::Catch2)

include(CTest)
include(ParseAndAddCatchTests)
ParseAndAddCatchTests(test_catch2)
