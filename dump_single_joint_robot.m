%% Example to use this scripts
% This file is usefull to understand the functionality about all object
% included on this folder

%% Load object Motor
% Set all information about your robot.
% - Name of robot
% - folder where you want save the data
% - codyco-superbuild folder (try to put "getenv('CODYCO_SUPERBUILD_ROOT')" )
robot = Robot('iCubGenova04', 'experiments', '/Users/Raffaello/iit/codyco-superbuild');
% Setup robot configuration:
% Variables:
% - worldRefFrame
% - robot_fixed
robot = robot.setConfiguration('root_link','true');

%% Add motors to test
robot.joints = robot.getJoint('l_hip_roll');
% or you can add a coupled joints
% robot.joints = robot.getCoupledJoints('l_shoulder');

%% Configure your computer
% Set all variables:
% - Name of joint list with your list of joints
% - If true, automatic set yarp namespace
robot.configure('JOINT_FRICTION','false');
robot.buildFolders();

%% Open Simulink
open('FrictionIdentification.slx');