
%clc
%clear all
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
[X] = 30.05:0.1:69.95; % create X value
[Y] = -24.95:0.1:44.95;% create Y values
% create a mesh of values
Z = peaks(700);
Z = Z(:,151:550);
% Display the raw data
figure(1)
mesh(X,Y,Z)
% The data you will have from the NetCDF files will be X, Y and Z where
% X & Y are the Lat and Lon values in a vector form
% Z represents the ozone in a 2D array
% The data provided here as X, Y, Z is in the corresponding formats.

%% Create a display of the data from the NetCDF files like this
[X,Y] = meshgrid(X, Y);

figure(2);
clf
% Create the map
worldmap('Europe'); % set the part of the earth to show

load coastlines
plotm(coastlat,coastlon)

land = shaperead('landareas', 'UseGeoCoords', true);
geoshow(gca, land, 'FaceColor', [0.5 0.7 0.5])

lakes = shaperead('worldlakes', 'UseGeoCoords', true);
geoshow(lakes, 'FaceColor', 'blue')

rivers = shaperead('worldrivers', 'UseGeoCoords', true);
geoshow(rivers, 'Color', 'blue')

cities = shaperead('worldcities', 'UseGeoCoords', true);
geoshow(cities, 'Marker', '.', 'Color', 'red')

% Plot the data
surfm(X, Y, Z, 'EdgeColor', 'none',...
    'FaceAlpha', 0.5) % edge colour outlines the edges, 'FaceAlpha', sets the transparency

%% Plot contour map
% [X,Y] = meshgrid(X, Y); % this calculation has been carried out above
% already

figure(3);
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

% display the data
NumContours = 10;
contourfm(X, Y, Z, NumContours)

% This is a bit advanced, sets the visibility of the various parts of the
% plot so the land, cities etc shows through.
Plots = findobj(gca,'Type','Axes');
Plots.SortMethod = 'depth';
