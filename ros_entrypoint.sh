#!/bin/bash
set -e
source "/opt/ros/$ROS_DISTRO/setup.bash"
source "/ws_third/install/local_setup.bash"
[ -f "/ws/install/local_setup.bash" ] && source "/ws/install/local_setup.bash"
exec "$@"
