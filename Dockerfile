FROM ros:foxy
RUN apt update
RUN apt install -y ros-foxy-desktop

RUN apt install -y vim htop strace gdb
RUN mkdir -p /ws_third/src

RUN apt install -y ros-foxy-v4l2-camera

RUN apt install -y libi2c-dev
RUN \ 
  cd /ws_third/src && \
  git clone https://github.com/hiwad-aziz/ros2_mpu9250_driver && \
  cd .. && \
  . "/opt/ros/foxy/setup.sh" && \
  colcon build

RUN apt install -y ros-foxy-image-common libboost-serialization-dev
RUN \ 
  cd /ws_third/src && \
  git clone https://github.com/appliedAI-Initiative/orb_slam_2_ros -b ros2 && \
  cd .. && \
  . "/opt/ros/foxy/setup.sh" && \
  rosdep install -i --from-path src --rosdistro foxy -y && \
  colcon build


COPY ros_entrypoint.sh / 

