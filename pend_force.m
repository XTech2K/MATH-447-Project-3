% Program 6.3 Animation program for pendulum
% Inputs: time interval inter,
%  initial values ic = [y(1,1) y(1,2)], number of steps n
% Calls a one-step method such as trapstep.m
% Example usage: pend([0 10],[pi/2 0],200)
function pend_force(inter,ic,n,d,A)
h=(inter(2)-inter(1))/n;  % plot n points in total
y(1,:)=ic;                % enter initial conds in y
t(1)=inter(1);
set(gca,'xlim',[-1.2 1.2],'ylim',[-1.2 1.2], ...
  'XTick',[-1 0 1],'YTick',[-1 0 1])
bob=animatedline('color','r','Marker','.','markersize',40);
rod=animatedline('color','b','LineStyle','-','LineWidth',3);         
axis square               % make aspect ratio 1 - 1
for k=1:n
  t(k+1)=t(k)+h;
  y(k+1,:)=trapstep(t(k),y(k,:),h,d,A);
  xbob = sin(y(k+1,1)); ybob = -cos(y(k+1,1));
  xrod = [0 xbob]; yrod = [0 ybob];
  clearpoints(bob);addpoints(bob,xbob,ybob);
  clearpoints(rod);addpoints(rod,xrod,yrod);
  drawnow; pause(h)
end

function y = trapstep(t,x,h,d,A)
%one step of the Trapezoid Method
z1=ydot(t,x,d,A);
g=x+h*z1;
z2=ydot(t+h,g,d,A);
y=x+h*(z1+z2)/2;

function z=ydot(t,y,d,A)
g=9.81;length=1;
z(1) = y(2);
z(2) = -(g/length)*sin(y(1)) - d*y(2) + A*sin(t);