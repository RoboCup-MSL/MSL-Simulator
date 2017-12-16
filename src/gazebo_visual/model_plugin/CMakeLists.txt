cmake_minimum_required(VERSION 2.8.3)
project(robot_plugin)
SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=gnu++11")

# Load catkin and all dependencies required for this package
find_package(catkin REQUIRED COMPONENTS 
  rospy
  roscpp
  std_msgs
  geometry_msgs
  sensor_msgs
  gazebo_ros  
  nubot_common
)

find_package(Protobuf REQUIRED)
find_package(gazebo REQUIRED)
find_package(Boost REQUIRED COMPONENTS system)

link_directories(${GAZEBO_LIBRARY_DIRS})
include_directories(${Boost_INCLUDE_DIR} ${catkin_INCLUDE_DIRS} ${GAZEBO_INCLUDE_DIRS})

message("gazebo include path: ${GAZEBO_INCLUDE_DIRS}")				

add_library(robot_plugin src/robot_plugin.cc)
target_link_libraries(robot_plugin ${catkin_LIBRARIES} ${GAZEBO_LIBRARIES} ${Boost_LIBRARIES} ${PROTOBUF_LIBRARIES} pthread)

add_library(ball_plugin src/ball_plugin.cc)
target_link_libraries(ball_plugin ${catkin_LIBRARIES} ${GAZEBO_LIBRARIES})

add_executable(robot_teleop_keyboard src/robot_teleop_keyboard.cc)
add_dependencies(robot_teleop_keyboard  ${catkin_EXPORTED_TARGETS})
target_link_libraries(robot_teleop_keyboard ${catkin_LIBRARIES})

# include (FindPkgConfig)
# if (PKG_CONFIG_FOUND)
#	pkg_check_modules(GAZEBO gazebo)
# endif()
