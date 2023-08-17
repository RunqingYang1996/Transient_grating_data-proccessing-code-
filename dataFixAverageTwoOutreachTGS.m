Transient_grating_data proccessing code 

clear all
tic

%imports 2 files the positive and negative measurements
[fileNamePos, folder] = uigetfile('*.txt', 'Select Positive data file');    %select the file                                                                                 
PositiveData=importdata([folder,fileNamePos],'\t',1);%imports the data
[fileNameNeg, folder] = uigetfile('*.txt', 'Select Negative data file');    %select the file                                                                                 
NegativeData=importdata([folder,fileNameNeg],'\t',1);%imports the data


%import all data to arrays t and amp.

posLength=length(PositiveData.data(:,2))
negLength=length(NegativeData.data(:,2))

time=PositiveData.data(:,1)+0.5e-6; % adjust time scale here to start at zero
%time(:,2)=NegativeData(:,1);
data(:,1)=PositiveData.data(:,2)- mean(PositiveData.data(1:10,1));
data(:,2)=NegativeData.data(:,2)- mean(NegativeData.data(1:10,1));

%fix the signal, subtract pos-neg-------
signalFixed = (data(:,1)-data(:,2));
%---------------------------------------

%time shifts and subtract base line noise------------
%{
[maxAmp maxN] = max(signalFixed);
timeShift=0;
time= time-time(timeShift+maxN);%shift the data so the max is at 0 seconds
signalFixed = signalFixed -mean(signalFixed(1:?10));%subtract average noise of the base line
%}
%-------------------------------------------------
%
%normalize the amplitude----
%signalFixed = signalFixed/max(signalFixed);
dataFixed(:,1)=time;
dataFixed(:,2)=signalFixed;
%-----------

figure
hold on
%Note) X: (s) Y: (V)
 %plot(t,signalFixed/max(signalFixed));
 plot(dataFixed(:,1)/1e-6,data(:,1)/1e-3,'--','color','r','LineWidth',1.0);
 plot(dataFixed(:,1)/1e-6,data(:,2)/1e-3,'--','color','k','LineWidth',1.0);
 plot(dataFixed(:,1)/1e-6,dataFixed(:,2)/1e-3,'color','b','LineWidth',1.0);
 legend('Positive','Negative','Difference');
 axis tight;
 ax=gca;
 ax.XLabel.String = ('Time (\mus)');
  ax.YLabel.String = ('Signal (mV)');
 set(gca,'FontSize',14);
 
 %plot(averageNeg,'r');
hold off



%write the fixed signal on a new file--------------------

%fixtag='fixed-baseLine';
fixtag='';
% check for 'fixed' directory and if not present, create one
if isunix
    %newdir='fixed-baseLine/';
    newdir='fixed/';
else
    %newdir='\fixed-baseLine\';
    newdir='fixed/';
end
testdir=horzcat(folder,newdir);
if isdir(testdir)==0;
    mkdir(testdir);
end
 
finfile=strcat(folder,newdir,fixtag,fileNamePos);
dlmwrite(finfile,dataFixed,'delimiter','\t','precision',10,'newline','pc')
fclose('all');                  
toc
