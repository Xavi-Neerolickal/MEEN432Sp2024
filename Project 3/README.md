Project 3 WEEK 1 and WEEK 2 Progress Report
INSTRUCTIONS ON HOW TO RUN ARE PROVIDED IN THE README's FOR THE PARTICULAR WEEK
Week 1:

Completed longitudinal vehicle model. We were able to put in the EPA cylce data to the Lookup table in Drive_Schedule subsystem, which we have renamed EPA_Table to make it more readable to us. 
We then worked on the Driver model to make sure that if the sum of the desired velocity and the negative of the actual velocity is positive, the command will go to the acceleration/add torque
block whereas if it is negative, it will go to the braking block. The transmission block for the increase velocity/torque area is currently rudimentary for week 1 and just has a gain and 
intertia added. We changed the braking to reflect angular velocity of the wheel, whether it be rolling or not using the equation provided and the sgn approximation. These were then connected to the wheel
where it was divided by the radius to gain the angular values of the given values to the wheel which is then fed to the vehicle block where the acceleration is calculated. This acceleration is angular
and it is made linear, into velocity, and into distance by using gain and integrator blocks respectively. We tried to setparam() the urban and highway drivedata, however, it provided an error saying 
"setparam not recognized" despite having downloaded the add on. Hence, it is important to run the simulink after making some changes. The simulated line provided in the graph was inside the the error margins for both urban and highway except for a small region when the velocity increases after a huge dip.

Week 2: 

The group worked on completing the electric driver motor and electric driver blocks. We added a electric motor powertrain block inside which we added the motor block. Currently, the motor block aims to convert the 
angular acceleration into inertia using the equation I = Torque/Angular Acceleration. Angular acceleration is figured out by using an integrator to the provided angular velocity. This however, did not seem to 
work since the graph provided just a straight line. We also tried to figure out how to convert the APP % command torque to N-m Torque, but ended up just placing a gain of 1500 similar to the mechanical powertain. 
Online sources required the addition of current and voltage for this which has not been covered in lecture. The electric_drive block accepts the transmission and inertia from the electric motor powertrain block and
the angular acceleration and angular velocity from the wheel block and multiplies it with the first gear ratio provided to get a transmission block change to these values. These values are then fed into the wheel 
block, which has not seen any change and the values from the wheel block are added to the vehicle block. In the vehicle block, the acceleration is calculated just like week one. Utilizing the sum of the 
forces that were found and fed into the block, and the distance that was calculated by utilizing the integrator twice on the acceleration the energy required was calculated by using the dot product matlab 
built function. This is then made into an output of the entire block. As with week 1, we could not figure out setparam(). 
