clc;
close all;
addpath('./');  

%% SELECT THE WORKING DIRECTORY
%workingDirectory = uigetdir(pwd, ...
%    'Select thew folder where you want to store the extracted .png files');
%cd(workingDirectory);

%% CREATE RESULT DIRECTORY
%mkdir png
%cd('./png');
    
%% READ THE SOURCE FOLDER
root = uigetdir('./*.*', 'Select the folder containing the sample images');
[imageCount, ims] = loadImsFromFolder(root);
fprintf('Loaded %d images\n', imageCount);