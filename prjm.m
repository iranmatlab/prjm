clear;clc;warning off
addpath C:\Users\bijan\Desktop;
image=imread('class.jpg');
%finding RGB
R=image(:,:,1);G=image(:,:,2);B=image(:,:,3);
    %%
%solution
B(B<80)=0;G(B<80)=0;R(B<80)=0;%R(B<65)=0;G(R<90)=0;B(R<200)=0;
binary_image = bwareaopen(R,100);%remove small objects from binary image
se = strel('disk',100);%create morphological structures
binary_image = imclose(R,se);%Morphologically close image
binary_image = imfill(R,'holes');%Fill image regions and holes
figure , imshow(R) , title('fill image')
[B,L] = bwboundaries(binary_image,'noholes'); %Trace region boundaries in binary image             
Count=length(B);%counting length of a specific element
% totalvalues=numel(R);zerotargets=nnz(R);targetpercentage=(zerotargets/totalvalues)*100;disp('targetpercentage is');disp(targetpercentage)
