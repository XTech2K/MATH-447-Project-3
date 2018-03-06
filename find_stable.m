function [low,high] = find_stable(low,step,high,time)

for A=low:step:high
    if stable_inverted([0 time],[3.1 0],time*100,0,A)
        low = A;
        break
    end
end

for A=low:step:high
    if ~stable_inverted([0 time],[3.1 0],time*100,0,A)
        high = A - step;
        break
    end
end