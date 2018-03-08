% Program 6.3 Animation program for pendulum
% Inputs: time interval inter,
%  initial values ic = [y(1,1) y(1,2)], number of steps n
% Calls a one-step method such as trapstep.m
% Example usage: pend([0 10],[pi/2 0],200)
function pend_double(inter,ic,n,d)
h=(inter(2)-inter(1))/n;  % plot n points in total
y(1,:)=ic;                % enter initial conds in y
t(1)=inter(1);
set(gca,'xlim',[-2.4 2.4],'ylim',[-2.4 2.4], ...
  'XTick',[-1 0 1],'YTick',[-1 0 1])
bob1=animatedline('color','r','Marker','.','markersize',40);
bob2=animatedline('color','g','Marker','.','markersize',40);
rod1=animatedline('color','b','LineStyle','-','LineWidth',3);         
rod2=animatedline('color','k','LineStyle','-','LineWidth',3);         
axis square               % make aspect ratio 1 - 1
for k=1:n
  t(k+1)=t(k)+h;
  y(k+1,:)=trapstep(t(k),y(k,:),h,d);
  xbob1 = sin(y(k+1,1)); ybob1 = -cos(y(k+1,1));
  xbob2 = xbob1+sin(y(k+1,3)); ybob2 = ybob1-cos(y(k+1,3));
  xrod1 = [0 xbob1]; yrod1 = [0 ybob1];
  xrod2 = [xbob1 xbob2]; yrod2 = [ybob1 ybob2];
  clearpoints(bob1);addpoints(bob1,xbob1,ybob1);
  clearpoints(bob2);addpoints(bob2,xbob2,ybob2);
  clearpoints(rod1);addpoints(rod1,xrod1,yrod1);
  clearpoints(rod2);addpoints(rod2,xrod2,yrod2);
  drawnow; pause(h)
end

function y = trapstep(t,x,h,d)
%one step of the Trapezoid Method
z1=ydot(t,x,d);
g=x+h*z1;
z2=ydot(t+h,g,d);
y=x+h*(z1+z2)/2;

function z=ydot(t,y,d)
g=9.81;length=1;
z(1) = y(2);
z(2) = (-3*g*sin(y(1)) - g*sin(y(1) - 2*y(3)) - 2*sin(y(1) - y(3)) * ...
        (y(4)^2 + y(2)^2*cos(y(1) - y(3)))) / (3 - cos(2*y(1)-2*y(3))) ...
       - d*y(2);
z(3) = y(4);
z(4) = (2*sin(y(1) - y(3)) * (2*y(2)^2 + 2*g*cos(y(1)) + y(4)^2*cos(y(1) ...
                                                  - y(3)))) / ...
       (3 - cos(2*y(1)-2*y(3)));
