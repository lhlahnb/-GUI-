% function GUIproject()
function GUIproject(image)
clc;

% load("E:\image.mat");
% image=-rand(70,150,3000);
% image=-ones(70,150,3000);
jiemian=figure('Position',[10,10,1200,600],'NumberTitle','off','Name','课题','Color','black');
set(jiemian,'WindowScrollWheelFcn',@ScrollWheel);
PNL1=uipanel('Position',[0.05,0.16,0.9,0.8],'Title','图像','fontsize',16);
PNL2=uipanel('Position',[0.05,0.01,0.9,0.1],'Title','控制窗口','fontsize',16);
y=300;
h=302;
AXES1=axes(PNL1,'Position',[0,0,1,1]);
image_p0=image(:,:,300:500);
image_p0=permute(image_p0,[1,2,3]);
ima_3d=zeros(70,150);%%生成一个二维数组，元素为0，大小为h*w
for tt = 1:size(ima_3d,1);%%查询第一个维度的长度，从1循环到这个数
    for kk=1:size(ima_3d,2);%%查询第二个维度的大小，从1循环到这个数
        ima_3d(tt,kk)=max(squeeze(image_p0(tt,kk,:)));%%二维数组不同的点的地方用MAX来赋值，squeeze把这个东西删掉一个长度为一的方向，变成一个列向量
    end
end
ima_3d=ima_3d-min(min(ima_3d));%%减去整个数组中最小的元素
ima_3d_map=ima_3d./max(max(ima_3d));%%÷整个平面的最大值
axis equal;
axis tight;
figure(1);
imshow(ima_3d_map);
colormap(hot);
caxis([0,0.5]);
n=1;
z=2;
bt1=uicontrol(PNL2,'style','slider','Unit','normalized','Position',[0.1,0.1,0.3,0.8],'Min',0,'Max',3000,'Callback',@kz1,'Value',300);
str1='300';
str2='302';
str3='2';
text1=uicontrol(PNL2,'style','text','Unit','normalized','Position',[0.01,0.1,0.08,0.8],'String',str1,'fontsize',16,'Callback',@qz1);
text2=uicontrol(PNL2,'style','text','Unit','normalized','Position',[0.41,0.1,0.08,0.8],'String',str2,'fontsize',16,'Callback',@qz2);
text3=uicontrol(PNL2,'style','edit','Unit','normalized','Position',[0.7,0.1,0.08,0.8],'String',str3,'fontsize',16,'Callback',@qz3);
text4=uicontrol(PNL2,'style','text','Unit','normalized','Position',[0.6,0.1,0.08,0.8],'String','选择页数','fontsize',16);
    
function kz1(~,~)
        
        z=get(bt1,'Value');
        disp(z);
        z=floor(z);
        h=z;
        n=get(text3,'String');
        n=str2num(n);
        y=h+n;
        str2=num2str(z+n);
        str1=num2str(z);
        set(text1,'String',str1);
        set(text2,'String',str2);
        disp(y)
        disp(h)
        image_p0=image(:,:,h:y);
        image_p0=permute(image_p0,[1,2,3]);
        ima_3d=zeros(70,150);%%生成一个二维数组，元素为0，大小为h*w
        for tt = 1:size(ima_3d,1);%%查询第一个维度的长度，从1循环到这个数
            for kk=1:size(ima_3d,2);%%查询第二个维度的大小，从1循环到这个数
                ima_3d(tt,kk)=max(squeeze(image_p0(tt,kk,:)));%%二维数组不同的点的地方用MAX来赋值，squeeze把这个东西删掉一个长度为一的方向，变成一个列向量
            end
        end
        ima_3d=ima_3d-min(min(ima_3d));%%减去整个数组中最小的元素
        ima_3d_map=ima_3d./max(max(ima_3d));%%÷整个平面的最大值
        axis equal;
        axis tight;
        figure(1);
        imshow(ima_3d_map);
        colormap(hot);
        caxis([0,0.5]);
        
    end
    function qz3(~,~)
        z=get(bt1,'Value');
        z=floor(z);
        h=z;
        n=get(text3,'String');
        n=str2num(n);
        y=h+n;
        str2=num2str(z+n);
        str1=num2str(z);
        set(text1,'String',str1);
        set(text2,'String',str2);
        disp(y)
        disp(h)
        image_p0=image(:,:,h:y);
        image_p0=permute(image_p0,[1,2,3]);
        ima_3d=zeros(70,150);%%生成一个二维数组，元素为0，大小为h*w
        for tt = 1:size(ima_3d,1);%%查询第一个维度的长度，从1循环到这个数
            for kk=1:size(ima_3d,2);%%查询第二个维度的大小，从1循环到这个数
                ima_3d(tt,kk)=max(squeeze(image_p0(tt,kk,:)));%%二维数组不同的点的地方用MAX来赋值，squeeze把这个东西删掉一个长度为一的方向，变成一个列向量
            end
        end
        ima_3d=ima_3d-min(min(ima_3d));%%减去整个数组中最小的元素
        ima_3d_map=ima_3d./max(max(ima_3d));%%÷整个平面的最大值
        axis equal;
        axis tight;
        figure(1);
        imshow(ima_3d_map);
        colormap(hot);
        caxis([0,0.5]);     
    end
    function ScrollWheel(~,event)
    m=event.VerticalScrollCount;
    z=get(bt1,'Value');
        z=floor(z);
        z=z-m;
        h=z;
        n=get(text3,'String');
        n=str2num(n);
        y=h+n;
        str2=num2str(z+n);
        str1=num2str(z);
        set(text1,'String',str1);
        set(text2,'String',str2);
        set(bt1,'Value',z);
        disp(y)
        disp(h)
        image_p0=image(:,:,h:y);
        image_p0=permute(image_p0,[1,2,3]);
        ima_3d=zeros(70,150);%%生成一个二维数组，元素为0，大小为h*w
        for tt = 1:size(ima_3d,1);%%查询第一个维度的长度，从1循环到这个数
            for kk=1:size(ima_3d,2);%%查询第二个维度的大小，从1循环到这个数
                ima_3d(tt,kk)=max(squeeze(image_p0(tt,kk,:)));%%二维数组不同的点的地方用MAX来赋值，squeeze把这个东西删掉一个长度为一的方向，变成一个列向量
            end
        end
        ima_3d=ima_3d-min(min(ima_3d));%%减去整个数组中最小的元素
        ima_3d_map=ima_3d./max(max(ima_3d));%%÷整个平面的最大值
        axis equal;
        axis tight;
        figure(1);
        imshow(ima_3d_map);
        colormap(hot);
        caxis([0,0.5]);     

 
    end
end
