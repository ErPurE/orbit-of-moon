%% 地球公转展示
orbit=VideoWriter('orbit.avi')
orbit.FrameRate=(T/s+1)/18;
open(orbit)
for i = 1:T/s+1
    subplot(3,2,[1,2,3,4])
    plot(X(i),Y(i),'*m')  
    hold on
    plot(X(1:i),Y(1:i),'r')
    title('月球绕日轨道')
    axis equal
    drawnow 
    subplot(3,2,5)
    plot(x(i),y(i),'ob')
    hold on
    plot(x(1:i),y(1:i),'r')
    title('地球绕日轨道')
    axis equal
    drawnow    
    subplot(3,2,6)
    ii=rem(i*s/ss,Tm);
    plot(xx(ii),yy(ii),'*m')
    hold on
    plot(xx(1:ii),yy(1:ii),'g')
    title('月球绕地球轨道')
    axis equal
    axis([-4,4,-4,4]*1e8)
    drawnow   
    f(i)=getframe(gcf);
    writeVideo(orbit,f(i))
    clf
end   
close(orbit)