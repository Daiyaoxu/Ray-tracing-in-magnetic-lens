%%主函数
clc
clear all
%% Basic Parameters
a = 0;
U = 30000;
m0 = 9.0107e-31;
c = 299800000;
e0 = 1.602e-19;
v0 = c * (1 - (1 / (1 + U / 511000) ^ 2)) ^ 0.5;
b0 = v0 / c;
m1 = m0 / (1 - b0 ^ 2) ^ 0.5;
N = e0 / (8 * m1 * c ^ 2 * U) * 1e2;
A=100;
l1=1;
l2=0.2;
rin=0.01;
N0= 0.00000003;
N1=0.0002;
N2=0.001;
O0=0;
O1=1.05;
O2=0.95;
% 设置秒表查看计算时间
tic
% 定义运动函数
    syms z;

    % Definitions here...
    f1 = A/((z/l1) ^ 2 + N1);
    f2 = A/((z/l2) ^ 2 + N1);


% Calculate the fourth derivative of f1
    f1_derivative = diff(f1, z);
    f1_2nd_derivative = diff(f1_derivative, z);
    f1_3rd_derivative = diff(f1_2nd_derivative, z);
    f1_4th_derivative = diff(f1_3rd_derivative, z);

% Calculate the fourth derivative of f2
    f2_derivative = diff(f2, z);
    f2_2nd_derivative = diff(f2_derivative, z);
    f2_3rd_derivative = diff(f2_2nd_derivative, z);
    f2_4th_derivative = diff(f2_3rd_derivative, z);

    leftlim=-0.2;
    rightlim=0.5;
    acc0=100;
% 
num1=10;
num2=0.002; 
X = zeros(700, 1);
Y = zeros(700, 1);

arrays = cell(360/num1, 0.01/num2);

for r001=0.01:num2:0.02

    for n = 0:num1:360

        % 将角度转换为弧度
        angle_rad = deg2rad(n);


        z00 = linspace(leftlim, rightlim, (rightlim-leftlim)*acc0);
        x00= zeros(length(z00), 1);
        y00= zeros(length(z00), 1);

        x00(1) = r001*cos(n);  % 将 r00 数组的第一个元素设置为 0.1
        y00(1) = r001*sin(n);


        Ax = zeros(length(z00), 1);
        Ay = zeros(length(z00), 1);
        Vx = zeros(length(z00), 1);
        Vy = zeros(length(z00), 1);

        Vx(1)= -0.05;
        Vy(1)= -0.05;



        target_z = 0.25;
        [min_diff, index] = min(abs(z00 - target_z));
        spacecord=zeros( (rightlim-leftlim)*acc0,3);

        for i = 1:length(z00)-1
            f_value = subs(f1, z, (z00(i)));
            f_2_value = subs(f1_2nd_derivative, z, (z00(i)));
            f_4_value = subs(f1_4th_derivative, z, (z00(i)));

            Ax(i) = -N *O1* (f_value - 0.25 * f_2_value * (x00(i) ^ 2+y00(i) ^ 2) + 0.0026 * f_4_value * (x00(i) ^ 2+y00(i) ^ 2) ^ 3) ^ 2 *x00(i);
            Ax(i+1) = -N * (f_value - 0.25 * f_2_value * (x00(i+1) ^ 2+y00(i+1) ^ 2) + 0.0026 * f_4_value * (x00(i+1) ^ 2+y00(i+1) ^ 2) ^ 3) ^ 2 * x00(i) ;
            Vx(i+1)=Vx(i)+(Ax(i+1)+Ax(i))*(1/acc0)/2;

            Ay(i) = -N *O2* (f_value - 0.25 * f_2_value * (x00(i) ^ 2+y00(i) ^ 2) + 0.0026 * f_4_value * (x00(i) ^ 2+y00(i) ^ 2) ^ 3) ^ 2 * y00(i);
            Ay(i+1) = -N * (f_value - 0.25 * f_2_value * (x00(i+1) ^ 2+y00(i+1) ^ 2) + 0.0026 * f_4_value * (x00(i+1) ^ 2+y00(i+1) ^ 2) ^ 3) ^ 2 * y00(i);
            Vy(i+1)=Vy(i)+(Ay(i+1)+Ay(i))*(1/acc0)/2;

            x00(i+1) = x00(i)+(Vx(i)+Vx(i+1))*(1/acc0)/2; % 使用 z00(1:i+1) 和 V(1:i+1) 来匹配长度
            y00(i+1) = y00(i)+(Vy(i)+Vy(i+1))*(1/acc0)/2; % 使用 z00(1:i+1) 和 V(1:i+1) 来匹配长度

            
        end
        spacecord(:, 1)=z00
        spacecord(:, 2)=x00
        spacecord(:, 3)=y00
        round((r001-0.01)/num2)+1
        arrays{(n/num1)+1,round((r001-0.01)/num2)+1} = spacecord;

        plot3(x00, y00, z00, 'b--', 'LineWidth', 1);
        hold on


    end

end


    grid on;
    view(3); % 保持三维视角



% 假设要查找的目标值为 target_value
target_value = 0.18;

% 循环遍历总的数组和子数组，找到子数组第一列中最接近目标值的值，并找到该值对应的另外两个值
result_array = [];

% 循环遍历总的数组和每个子数组，提取相同索引（例如索引为5）的第二列和第三列的数，并将它们组成新的数组
for i = 1:numel(arrays)
    current_array = arrays{i}; % 获取当前子数组

    % 获取当前子数组索引为5的位置的第二列和第三列的数，并将它们组成一个临时数组
    if size(current_array, 1) >= 5 % 确保当前子数组至少有5行
        temp_array = current_array(45, 2:3);
        % 将临时数组与结果数组合并
        result_array = [result_array; temp_array];
    end
end


xa = result_array(:, 1);
ya = result_array(:, 2);

% 使用 plot 函数将点连成图像
figure;
plot(xa, ya, 'o'); % 'o-' 表示使用实心圆点和连线连接点
% xlim(-0.01,0.01);
% ylim(-0.01,0.01);


% 停止计时器，并获取经过的时间
elapsedTime = toc;

% 显示计算时间
disp(['计算时间：', num2str(elapsedTime), ' 秒']);