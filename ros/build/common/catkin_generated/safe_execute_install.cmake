execute_process(COMMAND "/home/dave/sdc_final_project/ros/build/common/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/dave/sdc_final_project/ros/build/common/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
