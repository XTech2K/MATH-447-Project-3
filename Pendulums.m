%% Project 3: Pendulums
% *Team members: Aidan Curran, Xander*
%% Background
% Pendulums. Carry out Computer Problems 6.3.4 - 6.3.8. 
% (Problem 6.3.6 asks you to make the inverted pendulum stable through parametric resonance. 
% Problem 6.3.8 asks you to build the double pendulum.) 
% For a grand finale, try to stabilize the double pendulum.
%% 6.3.4
% Adapt pend.m to build a forced, damped version of the pendulum. Run the Trapezoid Method in the following: (a) Set damping d = 1 and the forcing parameter A = 10. Set the step size h = 0.005 and the initial condition of your choice. After moving through some transient behavior, the pendulum will settle into a periodic (repeating) trajectory. Describe this trajectory qualitatively. Try different initial conditions. Do all solutions end up at the same ?attracting? periodic trajectory? (b) Now increase the step size to h = 0.1, and repeat the experiment. Try initial condition [?/2,0] and others. Describe what happens, and give a reasonable explanation for the anomalous behavior at this step size.
%% 
% 6.3.4 (a)
%%
% Making a damped forced pendulum setting the
% new values d = 1 and A = 10 and creating setp size h to be equal to
% 0.005. Using matlab animation, you can see that the pendulum gets into a
% rythm in which it does around 2.5 full rotations and then switches
% direction. 
%% 
% 6.3.4 (b)
%%
% This part is the same as before but with an inceased step size of 0.1.
% Here we can see that the pendulum ends up getting into a rhythm where it
% acts like a normal pendulum with no force added to it BUT with a 
% difference in which it swings to the same point on either side.
%% 6.3.5
% Run the forced damped pendulum as in Computer Problem 4, but set A=12. Use the Trapezoid Method with h = 0.005. There are now two periodic attractors that are mirror images of one another. Describe the two attracting trajectories, and find two initial conditions (y1, y2) = (a,0) and (b,0), where |a ? b| ? 0.1, that are attracted to different periodic trajectories. Set A = 15 to view chaotic motion of the forced damped pendulum.
%% 
% pi/2
% pend_force([0 50], [pi/2 0], 10000, 1, 12)
% pi/16
% pend_force([0 50], [pi/16 0], 10000, 1, 12)
% pi/4 - counterclockwise 2.5, clockwise 3.5
% pend_force([0 50], [pi/4 0], 10000, 1, 12)
% 3pi/4 - roughly the same but stops in opposite corners
% pend_force([0 50], [3*pi/4 0], 10000, 1, 12)
% the attracting projectories end up being about 3.5 rotations followed by
% about 2.5 rotations. The difference in initial conditions can change both
% where the bob stops as well as whether the rotations are clockwise versus
% counterclockwise
%%
