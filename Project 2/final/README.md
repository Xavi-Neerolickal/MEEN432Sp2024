Week 3 Project Two Report:

Project 2 required the simulation of the a race car along a track with two straight sections and one
curved section. The first week required the creation of the track and the vehicle. We were able to create 
the track and vehicle to move along the track, however, it was not rotating and it kept bouncing between
the straight lines. 

We fixed this issue by week 2. However, the created track quickly was deemed unsuitable for the 
week 2 deliverables. Hence, we divided up the track into four sectors and rotated the car using a 
different rotate function at the end of the code. This allowed us to refer to the simulink data that 
we needed without issue. We then created the Simplest Driver MATLAB code with just three inputs that 
estimated the lateral velocity and heading using k and the equation for psi. The desired velocity was 
calibrated using the lateral dynamics subsystem and the rotation/transform function was incorporated 
to get the values in the XY graph. 

In week 3, we added the raceStat.m files. We apologize for the weird file name, however, we had a habit
of putting the values in teams, downloading each others code to see which works best. Hence, the name
was used to distinguish the files and time constraints held us back from changing the name again before
uploading. We do wish to make some changes and upload it again since the current file provides 
an incomplete track although it completes the track in the fastest time. 

To run the file, download each files and run 'init.m' first, followed by the others. 

## Final Week Feedback (69/85)
Looking through the driver model, I noticed some errors in the way that delta_f was being calculated. The simple equation for delta_f on the curved sections is L/R where L is the length of the wheelBase of the vehicle (lf + lr) and R is the radius of the curve. It looks like instead of using the wheelBase for L, pi*R was used instead which does not make much sense. Another issue is with the race track and the path of vehicle. Starting from (0,0) the max X coordinate should be 1100 meters (straightaway length + radius) and the max Y coordinate should be 400 meters (2 x radius). The racetrack and vehicle path that was plotted is not correct as the vehicle travels outside of the track by almost 600 meters passed the max X and almost 1200 meters passed the max Y of the track. For the individual members to succeed in Project 4, I would advise each member to work on the driver model from Project 2 and try to utilize a path following controller (Pure Pursuit) while working through Project 3. A more sophisticated model will allow for the vehicle to move faster depending on where it is on the track which will be important for Project 4, as each member will need to combine this model with the Project 3 model to create a vehicle that can move around the track as fast as possible while simulating the lateral and longitudinal dynamics of the vehicle.  
