%% ��ջ�������
clear
%% 
clc
%% ѵ����/���Լ�����
load spectra_data.mat
% �������ѵ�����Ͳ��Լ�
temp = randperm(size(NIR,1));
% ѵ��������50������
P_train = NIR(temp(1:50),:)';
T_train = octane(temp(1:50),:)';
% ���Լ�����10������
P_test = NIR(temp(51:end),:)';
T_test = octane(temp(51:end),:)';
N = size(P_test,2);

%% BP�����紴����ѵ�����������

% ��������
net = newff(P_train,T_train,9);
% ����ѵ������
net.trainParam.epochs = 1000;
net.trainParam.goal = 1e-3;
net.trainParam.lr = 0.01;
% ѵ������
net = train(net,P_train,T_train);
% �������
T_sim_bp = sim(net,P_test);

%% RBF�����紴�����������

% ��������
net = newrbe(P_train,T_train,0.3);
% �������
T_sim_rbf = sim(net,P_test);

%% ��������

% ������error
error_bp = abs(T_sim_bp - T_test)./T_test;
error_rbf = abs(T_sim_rbf - T_test)./T_test;
% ����ϵ��R^2
R2_bp = (N * sum(T_sim_bp .* T_test) - sum(T_sim_bp) * sum(T_test))^2 / ((N * sum((T_sim_bp).^2) - (sum(T_sim_bp))^2) * (N * sum((T_test).^2) - (sum(T_test))^2)); 
R2_rbf = (N * sum(T_sim_rbf .* T_test) - sum(T_sim_rbf) * sum(T_test))^2 / ((N * sum((T_sim_rbf).^2) - (sum(T_sim_rbf))^2) * (N * sum((T_test).^2) - (sum(T_test))^2));
% ����Ա�
result_bp = [T_test' T_sim_bp' T_sim_rbf' error_bp' error_rbf'];
figure
plot(1:N,T_test,'b:*',1:N,T_sim_bp,'r-o',1:N,T_sim_rbf,'k-.^')
legend('��ʵֵ','BPԤ��ֵ','RBFԤ��ֵ')
xlabel('Ԥ������')
ylabel('����ֵ')
string = {'���Լ�����ֵ����Ԥ�����Ա�(BP vs RBF)';['R^2=' num2str(R2_bp) '(BP)' '  R^2=' num2str(R2_rbf) '(RBF)']};
title(string)
