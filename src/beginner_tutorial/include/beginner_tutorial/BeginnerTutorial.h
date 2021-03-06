//
// Created by federico on 09/05/21.
//

#ifndef BEGINNER_TUTORIAL_BEGINNERTUTORIAL_H
#define BEGINNER_TUTORIAL_BEGINNERTUTORIAL_H

#include <ros/ros.h>
#include <sensor_msgs/Image.h>
#include<iostream>

#include "opencv2/imgproc.hpp"
#include "opencv2/highgui.hpp"

#include <cv_bridge/cv_bridge.h>                // bridge between ros and opencv
#include <image_transport/image_transport.h>    // used to convert compressed images

#include <beginner_tutorial/CustomMessage.h>

class BeginnerTutorial {
public:
    BeginnerTutorial(ros::NodeHandle &nodeHandle);

private:

    /*!
     * Reads and verifies the ROS parameters.
     * @return true if successful
     */
    bool readParameters();

    /*!
     * ROS TOPIC callback method
     * @param msg received
     */
    void topicCallback(const sensor_msgs::ImageConstPtr &msg);

    //! ROS node handle.
    ros::NodeHandle &nodeHandle_;

    //! ROS topic subscriber.
    ros::Subscriber subscriber_;

    //! ROS topic publisher.
    ros::Publisher publisher_;
    ros::Publisher customMessagePublisher_;

    //! ROS topic names
    std::string subscriberTopic_;
    std::string publisherTopicCanny_;

    template<typename T1, typename T2>
    T2 getRequiredRosParam(ros::NodeHandle nh, std::string paramName,
                           T1 defaultValue, bool &has_failed) {
        T1 var;

        if (!nh.getParam(paramName, var)) {
            has_failed = true;
            fprintf(stderr, "%s: ", paramName.c_str());
            fprintf(stderr, "using default value \n");
        }

        nh.template param(paramName, var, defaultValue);
        return T2(var);
    }


};


#endif //BEGINNER_TUTORIAL_BEGINNERTUTORIAL_H
