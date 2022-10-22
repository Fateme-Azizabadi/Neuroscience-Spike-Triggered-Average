%%
clc;
clear;

%% Loading .mat file and preparing it 
load('Stimulus.mat');

stim=Stimuli.Stimulus;
Fs=Stimuli.Fs;
Spike_Times=Stimuli.Spike_Times;
resp=zeros(1,length(stim));

for i = 1:length(Spike_Times)
    temp=round(Spike_Times(i)*Fs);
    resp(temp)=1;
    
end 

%% 1.1 
% Plotting 10 Second of Stimulus and its response(Spike)
time=50:1/Fs:60;
figure 
ax = subplot(2,1,1);
plot(time,stim(50*Fs:60*Fs), 'Color', 'k')
ax.XLim             = [50 60]; 
grid on
ax.XLabel.String  	= 'Time [s]';
ax.YLabel.String  	= 'Sound Level(dB)';
ax = subplot(2,1,2); 
plot(time,resp(50*Fs:60*Fs), 'Color', 'r')
ax.XLim             = [50 60]; 
grid on
ax.XLabel.String  	= 'Time [s]';
ax.YLabel.String  	= 'Spike';
%% 1.2 
windowSize = 0.2*Fs;
resp (1: windowSize )=0; % discard  in first window
nEvs = sum( resp ); % binary vector , we can simply add to find number of events
evIdx = find ( resp ); % gives indexes of spikes ( where a 1 was found )

ste=[];
% For each event
for w = 1:nEvs
    % Find the indexes of the time window preceding the event
    wIdx = evIdx(w)-windowSize : evIdx(w)-1; 
    ste(w,:)= stim(wIdx);
end


% Plotting Spike Triggered Stimulus Ensemble
figure
x=-0.2:1/Fs:0;
y=1:nEvs;
imagesc(x,y,ste)
colormap('hot');
colorbar;
xlabel('time [sec]');
ylabel('Spike Triggered Stimulus Ensemble');


se=[];
% For each event
for w = 1:(length(stim)-windowSize) 
    se(w,:)= stim(w:windowSize+w);
end


% Plotting  Stimulus Ensemble
figure
x=-0.2:1/Fs:0;
y=1:length(stim);
imagesc(x,y,se)
colormap('hot');
colorbar;
xlabel('time [sec]');
ylabel('Stimulus Ensemble');

%% 1.3
windowSize = 0.2*Fs;
resp (1: windowSize )=0; % discard  in first window
nEvs = sum( resp ); % binary vector , we can simply add to find number of events
evIdx = find ( resp ); % gives indexes of spikes ( where a 1 was found )

avg = zeros(1,windowSize);
% For each event
for w = 1:nEvs
    % Find the indexes of the time window preceding the event
    wIdx = evIdx(w)-windowSize : evIdx(w)-1; 
    % Add the stim from this window to the average
    avg = avg + stim(wIdx);
end

avg=avg./sum(resp);
figure
plot ( x(1:40),avg);
xlabel('Time [s]');
ylabel('Sound Level[dB]');
title('Linear Filter (STA)');
grid on 


