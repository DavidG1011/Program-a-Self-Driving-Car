#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
    DESTDIR_ARG="--root=$DESTDIR"
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/dave/sdc_final_project/ros/src/common"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/dave/sdc_final_project/ros/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/dave/sdc_final_project/ros/install/lib/python2.7/dist-packages:/home/dave/sdc_final_project/ros/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/dave/sdc_final_project/ros/build" \
    "/usr/bin/python" \
    "/home/dave/sdc_final_project/ros/src/common/setup.py" \
    build --build-base "/home/dave/sdc_final_project/ros/build/common" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/dave/sdc_final_project/ros/install" --install-scripts="/home/dave/sdc_final_project/ros/install/bin"
