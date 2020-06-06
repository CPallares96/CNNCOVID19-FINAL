clc
clear all
close all
%V = niftiread('coronacases_org_001 - Copy.nii');
% volumeViewer(V);
%XY = V(:,:,200); % XZ = squeeze(V(256,:,:));
XY=imread('testcovid.png');
XY=imresize(XY,[256 256]);
XY=rgb2gray(XY);
%complemento de la imagen
%h=2*[0 , -1, 0;-1 5 -1;0 -1 0]; 
%h = [1 0 0;0 1 0;0 0 1];
h = 1/9*ones(3,3);%Desenfoque ***** 3
% r = randi([-3,3],3,3);
%mostramos las dos imagenes
%r = [-2 2 2;-1 -3 0;1 3 0];
%r=[0,3,3;-5,-5,0;-3,5,1];%filtro protuberancia 
%r2=[-1,-5,3;-1,4,-4;5,5,-3];%filtro protuberancia2 
r=[0,3,3;-5,-5,0;-3,0,1];%filtro protuberancia3 ***** 2
r2=[1,-3,-3;-1,3,-1;0,-2,-2];%filtro invertido *****1
c=convn(XY,r2);%complemento
fig = figure;
imshowpair(XY,c,'montage');
fig = figure;
%protuberancia 3
im1=convn(XY,r);
im2=convn(c,r);
imshowpair(im1,im2,'montage');
fig = figure;
%desenfoque
imshowpair(convn(im1,h),convn(im2,h),'montage');
