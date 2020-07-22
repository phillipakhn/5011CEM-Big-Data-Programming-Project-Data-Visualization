
clc
clear all
load('LatScaled.mat')   %Loading .mat files that contain data
load('LonScaled.mat')
load('o3Scaled.mat')

%o3Scaled format is = Time Model,700(Lon),400(Lat),Time (25 hours)

disp('There are total of 7 models');
modelnumber=0;
x1=0;
while modelnumber<=0 || modelnumber>7 % CHECKING ERROR
if x1==1
    disp('You entered wrong Input')
end
modelnumber=input('Please Enter Model No: ')
x1=1;
end


%%
% Create some data
[X] = double(LatScaled); % create X value
[Y] = double(LonScaled);% create Y values
clear LatScaled
clear LonScaled

for i=1:25
    clf;
Z = double(O3Scaled(modelnumber,:,:,i));
Z=reshape(Z,700,400);  %700 rows and 400 columns
%Z=transpose(Z);

% Display the raw data
figure(1)
mesh(X,Y,Z)   %UNDO IT
title(sprintf('Mesh figure at time %d:00 ', (i-1)));
pause(0)
% The data you will have from the NetCDF files will be X, Y and Z where
% X & Y are the Lat and Lon values in a vector form
% Z represents the ozone in a 2D array
% The data provided here as X, Y, Z is in the corresponding formats.
end




%% Create a display of the data
% create a mesh of values
[X] = 30.05:0.1:69.95; % create X value
[Y] = -24.95:0.1:44.95;% create Y values
[X,Y] = meshgrid(X, Y);

%City Advance visibility

Visibilitycities='.';
vis=input('Do you want to improve cites visibility Y/N = ','s');
if vis=='Y'
    Visibilitycities='O';
else if vis=='N'
    Visibilitycities='.';
    
else
    disp('Using default in system');
    pause(0.1)
    end
end

statusCB=0;
while (statusCB ~=1 && statusCB  ~=2 && statusCB ~=3 && statusCB ~=4) 
%COLOR BLINDNESS CODE

disp('');
disp('Please Enter:')
disp('1 for Red-Green Color Blindness');
disp('2 for Blue-Yellow Color Blindness');
disp('3 for Total Color Blindness ');
disp('4 for Normal Vision ');
statusCB=input(' Status = ');
%https://davidmathlogic.com/colorblind/#%23000000-%23E69F00-%2356B4E9-%23009E73-%23F0E442-%230072B2-%23D55E00-%23CC79A7

if statusCB==1   %Contrasting colors for deuteranopia and protanopia
C1=[255,194,10];
C1=C1/255;
C2=[12,123,220];
C2=C2/255;
C3=[75, 0, 146];
C3=C3/255;
C4=[153, 79, 0];
C4=C4/255;
xxx= 'bluish ';
yyy='black';

else if statusCB==2
    C1=[211,95,183];
C1=C1/255;
C2=[220,50,32];
C2=C2/255;
xxx= ' light turquoise';
yyy=' light red/brown';
C3=[26, 255, 26];
C3=C3/255;
C4=[153, 79, 0];
C4=C4/255;



    else if statusCB==3
C1=[0,0,0];
C2=[1,1,1];
C3=[1,1,1];
xxx='light intensity';
C4=[1,1,1];
yyy=' bright Points';


        else if statusCB==4
    C1=[0.5 0.7 0.5];
C2='blue';
xxx='blue';
C3='blue';
C4='red';
yyy=' red';
            else
                clc;
                disp('Wrong input')
                pause(0.5);
                
end

        end
    end
end
end

for i=1:25

Z = double(O3Scaled(modelnumber,:,:,i));
Z=reshape(Z,700,400);


figure(2);
clf
% Create the map
worldmap('Europe'); % set the part of the earth to show

load coastlines
plotm(coastlat,coastlon)

land = shaperead('landareas', 'UseGeoCoords', true);
geoshow(gca, land, 'FaceColor', C1)

lakes = shaperead('worldlakes', 'UseGeoCoords', true);
geoshow(lakes, 'FaceColor', C2)

rivers = shaperead('worldrivers', 'UseGeoCoords', true);
geoshow(rivers, 'Color', C3)


cities = shaperead('worldcities', 'UseGeoCoords', true);
geoshow(cities, 'Marker', Visibilitycities, 'Color', C4)

% Plot the data
surfm(X, Y, Z, 'EdgeColor', 'none',...
    'FaceAlpha', 0.5) % edge colour outlines the edges, 'FaceAlpha', sets the transparency

title(sprintf('Ozone activity at time %d:00 ', (i-1)));
str = 'Lakes and Rivers = ';
str=strcat(str,xxx);
str2= 'Cities = Marker with Color ';
str2=strcat(str2,yyy);
str3='Ozone can be scene as variation of colors over map';
dim = [.1 .5 .3 .3];
dim2 = [.1 .54 .34 .34];
dim3= [.1 .58 .38 .38];
annotation('textbox',dim,'String',str,'FitBoxToText','on');
annotation('textbox',dim2,'String',str2,'FitBoxToText','on');
annotation('textbox',dim3,'String',str3,'FitBoxToText','on');
pause(0.5)


end