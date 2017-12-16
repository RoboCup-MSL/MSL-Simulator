# General requirement:
Ubuntu: 16.04
Default Gazebo version: 7.0; a installation script is provided

# Something about robot models
*_red are robots with red color;
*_black are robots with black color;

Red robots and black robots have different body coordiante frames. 

- black robots: x-axis is positively along the kicking mechanism; z-axis upward; y-axis according to righthand rule
- red robots: x-axis is negatively along the kicking mechansim ; z-axis upward; y-axis according to righthand rule

This change of coordiante frame is notified to the model plugin in their model.sdf file with a field called 'flip_cord'. If 'flip_cord=1', it means the coordinate frame needs to be flipped which cooresponds to a red robot. For black robto, this field is 0. (this means both black and robot use the same model plugin but they use different coordiante frame)

You can use the same robot code to control either red robots or black robots. However, if your code controls black robots, then they will shoot the goal on the right side of the field(positive x direction). However, if your code controls red robots, they will shoot the goal on the left side of the field(negative x direction). This means, when two teams are competing, they should chooese different colors of robots-black and red. Using the same color will lead to both team shooting the goal on the same side, and they become teammates. :)

# For robot model developers:
When you design your robot models, please stick to the coordinate frame convention as mentioned above. This means two teams of robots should have coodinate frames which offset 180 degree conter-clockwisely about the z-axis.

# Start the MSL Gazebo

Now a standard MSL soccer field (18m x 12 m), standard goals and square robots are provided. To start Gazebo with the MSL soccer field and several robots, try:

1. Set up correct paths for mdoel plugin, resource, etc..

   `source config`

2. Go to the directory where a world file is (e.g. `src/gazebo_visual/model_plugin/worlds`)

3. `gazebo robotcup15MSL.world`

   For the time being, since model plugin is not completed, you may not see robots on the field because they cannot load their model plugins correctly.