# ROS-tutorial

#### CREATE A ROS WORKSPACE
```
source /opt/ros/melodic/setup.bash
mkdir -p ~/tutorial_ws/src
cd ~/tutorial_ws/
catkin build
```

#### CREATE A PACKAGE
```
cd src
catkin_create_pkg beginner_tutorial std_msgs sensor_msgs roscpp 
```

#### CMAKE
```
find_package(OpenCV REQUIRED)


include_directories(
  include


add_executable(${PROJECT_NAME}_node src/beginner_tutorial_node.cpp
                                    src/beginnerTutorial.cpp)

//uncomment
add_dependencies(${PROJECT_NAME}_node ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})  


target_link_libraries(${PROJECT_NAME}_node
        ${catkin_LIBRARIES}
        ${OpenCV_LIBRARIES}
)


add_message_files(
   FILES
   CustomMessage.msg
#   Message2.msg
)

-> in find_package message_generation
-> in pck.xml message_generation

catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES beginner_tutorial
  CATKIN_DEPENDS roscpp sensor_msgs std_msgs message_generation
#  DEPENDS system_lib
)


```


#### Launching

roscore
rosbag play bag.bag -l -r 0.2


rosrun image_transport republish compressed in:=camera_1  raw out:=camera_1


plotjuggler




