function k=getSlope(x,y)

    dx=diff(x);
    dy=diff(y);
    k=dy./dx;
    
end