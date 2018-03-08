function low = find_unstable(low,step,time)

for A=low:step:100
    if unstable([0 time],[0.04 0],time*100,0,A)
        low = A;
        return
    end
end