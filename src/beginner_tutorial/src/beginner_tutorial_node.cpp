#include <ros/ros.h>
#include "beginner_tutorial/BeginnerTutorial.h"

int main(int argc, char** argv)
{
    ros::init(argc, argv, "beginner_tutorial");
    ros::NodeHandle nodeHandle("~");

    BeginnerTutorial rosPackage(nodeHandle);

    ros::spin();
    return 0;
}