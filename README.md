# Big-Data-Visualization-5011-CEM

To run this code place these files https://github.com/phillipakhn/5011CEM-Big-Data-Programming-Project-Data-Visualization/releases/tag/v1.0.0 along with the Example.m in the same folder then run Example.m from Matlab

	%%%%%%%%%%%%%%%%%%%%%%%%%% CODE DOCUMENTATION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

::::::1st Loop MESH DISPLAY::::::

1. First it loads .mat files that are processed. The mat file contains 
latitude, longitude and Ozone scaled data.

2. Then it asks for selecting the appropriate model, because there are total of 7 models.

3. After selection of model, it converts the data of latitude and longitude into doubles and goes into loop to display 25 hour data.

4. The data in o3scaled is in matrix form (4D) and when it is loaded into variable it gets
transformed into vector form. Which is further reshaped in 700x400 2D matrix.

5. Finally Latitude, longitude and Ozone data is plotted over mesh and is displayed for 25 hours time.


::::::2nd Loop MAP DISPLAY::::::

1. In map the ozonescaled data is reshaped. 

2. Map is loaded (Europe).

3. Coast lines, land areas, cities , lakes and rivers are plotted over the map.

4. Finally using surface plotting (Surfm) Ozone activity is plotted over the map for 25 hour time.

5. The map is labbled. The varying purplish blue color indicates presence of ozone at differnt region during 25 hour duration. The darker the color the more presence. 

6. Map is labled and looped till end.
