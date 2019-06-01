function y = addAwgn(single,x)
%ADDAWGN 此处显示有关此函数的摘要
    % 为信号添加白噪声
    % single 为要添加噪声的信号
    % x 为噪声的百分比 x=2表示添加百分之二的噪声
%   此处显示详细说明
SNR = 20*log(100/x); %幅值 2%噪声
y  = awgn(single,SNR);
end

