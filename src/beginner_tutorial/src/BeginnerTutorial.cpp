//
// Created by federico on 09/05/21.
//

#include "beginner_tutorial/BeginnerTutorial.h"

BeginnerTutorial::BeginnerTutorial(ros::NodeHandle &nodeHandle) : nodeHandle_(nodeHandle) {
    if (readParameters()) {
        ROS_ERROR("Could not read parameters.");
    }

    subscriber_ = nodeHandle_.subscribe(subscriberTopic_, 1, &BeginnerTutorial::topicCallback, this);
    publisher_ = nodeHandle_.advertise<sensor_msgs::Image>(publisherTopicCanny_,1);
    customMessagePublisher_ = nodeHandle_.advertise<beginner_tutorial::CustomMessage>("customMessage",1);
    ROS_INFO("Succesfully launched node.");
}


void BeginnerTutorial::topicCallback(const sensor_msgs::ImageConstPtr &msg) {

    cv_bridge::CvImage img_bridge_1;

    // canny edge detector algorithm
    cv::Mat imgGrayscale;        // grayscale of input image
    cv::Mat imgBlurred;            // intermediate blured image
    cv::Mat imgCanny;            // Canny edge image

    cv_bridge::CvImagePtr cv_ptr;
    try
    {
        cv_ptr = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::BGR8);
    }
    catch (cv_bridge::Exception& e)
    {
        ROS_ERROR("cv_bridge exception: %s", e.what());
        return;
    }


    cv::cvtColor(cv_ptr->image, imgGrayscale, CV_BGR2GRAY);       // convert to grayscale
    cv::GaussianBlur(imgGrayscale,                                         // input image
                     imgBlurred,                                           // output image
                     cv::Size(5, 5),                        // smoothing window width and height in pixels
                     1.5);                                               // sigma value, determines how much the image will be blurred


    cv::Canny(imgBlurred,                       // input image
              imgCanny,                         // output image
              20,                           // low threshold
              150);                          // high threshold

   // ROS MESSAGE OUT IMAGE
    sensor_msgs::Image image_ros;
    image_ros.header.stamp = ros::Time::now();

    img_bridge_1 = cv_bridge::CvImage(image_ros.header, sensor_msgs::image_encodings::MONO8, imgCanny);
    img_bridge_1.toImageMsg(image_ros);

    publisher_.publish(image_ros);


    // PUBLISHING OUT CUSTOM MESSAGE

    beginner_tutorial::CustomMessage my_custom_message;
    my_custom_message.header.stamp = ros::Time::now();

    my_custom_message.im_true = true;
    auto means = cv::mean(cv_ptr->image);
    my_custom_message.means[0] = means[0];
    my_custom_message.means[1] = means[1];
    my_custom_message.means[2] = means[2];
    my_custom_message.means[3] = means[3];

    customMessagePublisher_.publish(my_custom_message);


}

//Easy function
/*
bool BeginnerTutorial::readParameters() {
    if (!nodeHandle_.getParam("subscriber_topic", subscriberTopic_)) return false;
    return true;
}
 */
bool BeginnerTutorial::readParameters() {
    bool hasFailed = false;
    subscriberTopic_ = getRequiredRosParam<std::string, std::string>(nodeHandle_, "subsciber_topic", "/camera_1",
                                                                     hasFailed);
    publisherTopicCanny_ = getRequiredRosParam<std::string, std::string>(nodeHandle_, "image_publisher_topic", "/my_canny",
                                                                         hasFailed);
    return hasFailed;
}
