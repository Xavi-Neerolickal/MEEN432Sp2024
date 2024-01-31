How to run:
Download the MATLAB code. 
Download the Simulink Block 
Open both files.
Run the file in the MATLAB code
13 graphs will be made, the last one can be cancelled out
The graphs are a straight line because according to the EOM, the damping torque cancels the input torque causing there to be zero angular accelaration and angular velocity to be one. 

## Week 1 Feedback (5/5):
Make sure to take a second look at the code as a team before submitting! I will not penalize the team for this, but on line 13 the wrong Simulink model is named which causes the script unable to run. I fixed the issue and ran the simulation and I have a few notes. For plotting, make sure you are adding an appropriate title to the graphs so that I am able to distingush which belong to what solver and what time step. For simulating using the sim function, I would suggest embedding the function into the for loops for Week 2, as you will now be changing the conditions of the systems along with the solvers. 
