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
```
