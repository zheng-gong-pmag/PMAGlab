function [c]=getCurvature(x,y)

    dx=gradient(x);
    ddx=gradient(dx);
    dy=gradient(y);
    ddy=gradient(dy);

    c=abs(dx.* ddy-dy.*ddx)./((dx.^2 + dy.^2).^(3/2));
    
end