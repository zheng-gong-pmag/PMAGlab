function [DecX,IncX]=IntersecGC(Strike1,Dip1,Strike2,Dip2)

[Inc,Dec]=gcxgc(0,Strike1,90-Dip1,0,Strike2,90-Dip2);
[IncX,id]=max(Inc);
DecX=Dec(id);

end