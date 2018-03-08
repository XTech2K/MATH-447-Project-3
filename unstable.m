% Program 6.3 Animation program for pendulum
% Inputs: time interval inter,
%  initial values ic = [y(1,1) y(1,2)], number of steps n
% Calls a one-step method such as trapstep.m
% Example usage: pend([0 10],[pi/2 0],200)
function bool = unstable(inter,ic,n,d,A)
h=(inter(2)-inter(1))/n;  % plot n points in total
y(1,:)=ic;                % enter initial conds in y
t(1)=inter(1);
for k=1:n
  t(k+1)=t(k)+h;
  y(k+1,:)=trapstep(t(k),y(k,:),h,d,A);
  if passedpi(y(k,1),y(k+1,1))
      bool = 1;
      return
  end
end
 bool = 0;

function y = trapstep(t,x,h,d,A)
%one step of the Trapezoid Method
z1=ydot(t,x,d,A);
g=x+h*z1;
z2=ydot(t+h,g,d,A);
y=x+h*(z1+z2)/2;

function z=ydot(t,y,d,A)
g=9.81;length=2.5;
z(1) = y(2);
z(2) = -(d * y(2) + (g/length + A*cos(2*pi*t)) * sin(y(1)));

function bool = passedpi(y1,y2)
y1 = mod(y1+pi, (2*pi));
y2 = mod(y2+pi, (2*pi));
bool = abs(y1-y2) >= pi;