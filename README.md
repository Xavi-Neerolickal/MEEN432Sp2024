Week 3 Project Two Report:

In Project Two, the deliverables were to utilize MATLAB and Simulink to develop a race car around a track with two curves and two straights forming a NASCAR-like track. Developing our "lateral dynamic" and "Driver" systems in Simulink, our race car was able to navigate the track created. In our work in week 1, our track did not perform well enough. As a result, we started our track from scratch by dividing it into four sections. After completing this, we added the "Driver" and " Lateral dynamic" codes to the Simulink. Developing these, we ran into more issues regarding the track path and the Simulink was generating more errors. 

In Week 3, we incorporated the "raceStat" and "init" files to provide the vehicle's statistics. Using these statistics, we improved the Simulink performance where the car ran through the track while rotating with less errors. 

## Final Submission Feedback (80/85)
In this feedback I will be going through each of the main components of the Simulink model and provide any corrections that should be made.
1) Drive Schedule: No comments
2) Driver Model: No comments
3) Battery: There are some issues regarding the calculation of the following variables: Icell and SOC
- The calculation for Icell should be dividing the current coming from the motor by the number of cells in parallel, i.e., Icell = I / numcellsParallel
- For the calculation of SOC, we are utilizing the battery capacity, however we need to make sure we are converting the capacity correctly. The capacity that's given in the init file is the total battery capacity in units of Amp-hr. To utilize the capacity in the SOC equation, we first need to divide the total battery capacity by the number of cells in parallel to get the capacity per cell, then multiply by 3600 to convert from Amp-hr to Amp-s
4) Electric Motor: No comments
5) Transmission: No comments
6) Wheel Model: No comments
7) Vehicle Model: No comments
8) Brake Model: No comments

Regarding the script, for the future I would suggest having only one initialization file that contains all the car/battery/motor data needed for the simulation.
After making the changes I suggest, and messing with the PID controller, I was able to get the vehicle to match the drive cycle for both urban and highway.
Also I would suggest just having 1 single model and changing the stop time and drive schedule data from within the script that way you dont have to worry about maintaining two separate models.
