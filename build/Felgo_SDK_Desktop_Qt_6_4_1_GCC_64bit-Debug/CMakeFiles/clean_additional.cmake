# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles/Felgo_resources_1_autogen.dir/AutogenUsed.txt"
  "CMakeFiles/Felgo_resources_1_autogen.dir/ParseCache.txt"
  "CMakeFiles/appPVZ_autogen.dir/AutogenUsed.txt"
  "CMakeFiles/appPVZ_autogen.dir/ParseCache.txt"
  "Felgo_resources_1_autogen"
  "appPVZ_autogen"
  )
endif()
