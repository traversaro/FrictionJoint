%% Example to use this scripts
% This file is usefull to understand the functionality about all object
% included on this folder

%% Load object Motor
% Set all information about motor and robot when you would like to
% experiments
experiment = ExperCollector('iCubGenova01');
% Load joints
experiment = experiment.addMotor('leg','left','ankle','pitch');
experiment = experiment.addMotor('leg','right','ankle','pitch');
%experiment = experiment.addMotor('leg','left','ankle','roll');
%experiment = experiment.addMotor('leg','right','ankle','roll');
% List to load in ---
disp(experiment.getWBIlist());

setenv('YARP_DATA_DIRS', '/Users/Raffaello/iit/codyco-superbuild/build/install/share/codyco');
localName = 'simulink_joint_friction';
setenv('YARP_ROBOT_NAME', experiment.robot);

robotName = 'icub';
Ts = 0.01;

%% Save in file
name = 'idle';
path = experiment.data_path;
SaveData;
clear name path;

%% Split in more files
for i=1:size(experiment.joint,2)
    data = load([experiment.data_path name '.mat']);
    time = data.time;
    q = data.q(:,i);
    qD = data.qD(:,i);
    qDD = data.qDD(:,i);
    tau = data.tau(:,i);
    PWM = data.PWM;
    if exist('Current','var')
        save([experiment.joint(i).path name '.mat'],'q','qD','qDD','tau','PWM','Current','time');
    else
        save([experiment.joint(i).path name '.mat'],'q','qD','qDD','tau','PWM','time');
    end
    clear q qD qDD tau PWM Current time data;
end