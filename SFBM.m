n=10;
l=16;
w=zeros(n,4);
w(1,:)=[3 0 16 7];
w(2,:)=[3 8 16 -63 ];
w(3,:)=[3 0 8 -3.25 ];
w(4,:)=[0 4 4 -6];
w(5,:)=[0 6 6 -10.6];
w(6,:)=[0 8 8 4];
w(7,:)=[0 0 4 6];

pw_function =0;
shear=0;
syms x;
for i=1:n
    d=w(i,1);
    a=w(i,2);
    b=w(i,3);
    c=w(i,4);
    if d==2
    pw_function = pw_function+piecewise(x >= a & x <= b, c, 0);
   
    end
    if d==3
    pw_function = pw_function+piecewise(x >= a & x <= b, c.*(x-a), 0);
    end
    if d==4
    pw_function = pw_function+piecewise(x >= a & x <= b, c.*(b-x), 0);
    end

end


% disp(pw_function);
 shear1=int(pw_function,[0,x]);
 shear=shear1;
 for i=1:n
    d=w(i,1);
    a=w(i,2);
    b=w(i,3);
    c=w(i,4);
    if d==1
    shear =shear +piecewise(x>=a,c,0) ;
    end
 end
bear=+int(shear1,[0,x]);
for i=1:n
    d=w(i,1);
    a=w(i,2);
    b=w(i,3);
    c=w(i,4);
    if d==1
    bear =bear +piecewise(x>=a,c.*(x-a),0) ;
    end
    if d==5
    bear =bear +piecewise(x>=a,c,0) ;
    end
end
 


fplot(bear, [0, l],0);% shear in first for SFD, bear in first for BMD
 xline(0);
yline(0);yline(2000);
 xlabel('x');
 ylabel('f(x)');
 title('Graph');
grid on;



disp(bear);
%disp(bear);