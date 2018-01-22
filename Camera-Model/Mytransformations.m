%Forward
t = [0;0;0.5];
R = eye(3,3);
Zero = zeros(3,1);
T1 = [R t; Zero',1];
showTransformation(T1);

%To the left 35º
pause();
t = [0;0;0];
yaw = 0; pitch = degtorad(35); roll = 0;

cy = cos(yaw); sy = sin(yaw);
cp = cos(pitch); sp = sin(pitch);
cr = cos(roll); sr = sin(roll);

Rx = [1,0,0;0,cy,-(sy);0,sy,cy];
Ry = [cp,0,sp;0,1,0;-(sp),0,cp];
Rz = [cr,-(sr),0;sr,cr,0;0,0,1];
R = Rx*Ry*Rz;
T2 = [R t; Zero', 1];

showTransformation(T2);

%Go up by 0.5 meters and look down
pause();

t = [0;0.5;0];
yaw = degtorad(35); pitch = 0; roll = 0;

cy = cos(yaw); sy = sin(yaw);
cp = cos(pitch); sp = sin(pitch);
cr = cos(roll); sr = sin(roll);

Rx = [1,0,0;0,cy,-(sy);0,sy,cy];
Ry = [cp,0,sp;0,1,0;-(sp),0,cp];
Rz = [cr,-(sr),0;sr,cr,0;0,0,1];
R = Rx*Ry*Rz;
T3 = [R t; Zero', 1];

showTransformation(T3);
pause();