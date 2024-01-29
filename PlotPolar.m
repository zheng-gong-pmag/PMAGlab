function polarfig=PlotPolar(trend,plunge)

num=length(trend);

trendr=trend*pi/180;
rho=nan(num,1);

polarfig=figure;
set(polarfig,'Position',[300,300,600,600]);

for i=1:num   
    
    if plunge(i)>0
        rho(i)=90-plunge(i);
        polarplot(trendr(i),rho(i),'o','MarkerFaceColor','red','MarkerEdgeColor','black','MarkerSize',8,'LineWidth',1);
    else
        rho(i)=90+plunge(i);
        polarplot(trendr(i),rho(i),'o','MarkerEdgeColor','red','MarkerSize',8,'LineWidth',1);
    end
    
end

ax = gca;
ax.ThetaZeroLocation = 'top'; ax.ThetaDir = 'clockwise';
ax.ThetaTickLabel = {'N','','','E','','','S','','','W','',''};
ax.FontSize=15;
ax.FontWeight='bold';
ax.RTick = (0:15:90); 
ax.LineWidth = 1;
ax.RTickLabel = {'','','','','','',''};
ax.RLim=[0 90];

end