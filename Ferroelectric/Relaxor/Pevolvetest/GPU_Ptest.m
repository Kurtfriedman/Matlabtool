clear;clc;
kb=1.38e-23;
T=298;
deltat=5e-10;
Tc=115+273;
Px=-0.23*ones(1280);Py=0*ones(1280);

% Px=1e-14;Py=1e-14;
%%--------------history--------------%%
iter_batch=1000; iter_epoch=1;
iter_num=iter_epoch*iter_batch;
domain_history=cell(1,iter_epoch);
P_history=zeros(iter_num,2);
dG_history=zeros(iter_num,2);
alpha1=4.124e5*(T-Tc);
alpha11=-2.097e8; alpha12=7.974e8;
alpha111=1.294e9; alpha112=-1.950e9;
alpha1111=3.863e10; alpha1112=2.529e10; alpha1122=1.637e10;

Px_G=gpuArray(Px); Py_G=gpuArray(Py);
T_G=gpuArray(T);Tc_G=gpuArray(Tc);
alpha1_G=gpuArray(alpha1);alpha11_G=gpuArray(alpha11);alpha12_G=gpuArray(alpha12);
alpha111_G=gpuArray(alpha111);alpha112_G=gpuArray(alpha112);alpha1111_G=gpuArray(alpha1111);
alpha1112_G=gpuArray(alpha1112);alpha1122_G=gpuArray(alpha1122);
for i=1:iter_num
    
    dG_GL_k_Px_alpha1=2.*alpha1_G.*Px;
    dG_GL_k_Px_alpha11=4.*alpha11_G.*Px.^3;
    dG_GL_k_Px_alpha12=2.*alpha12_G.*Px.*Py.^2;
    dG_GL_k_Px_alpha111=6.*alpha111_G.*Px.^5;
    dG_GL_k_Px_alpha112=alpha112_G.*(4.*Px.^3.*Py.^2+2.*Px.*Py.^4);
    dG_GL_k_Px_alpha1111=alpha1111_G.*8.*Px.^7;
    dG_GL_k_Px_alpha1112=alpha1112_G.*(6.*Px.^5.*Py.^2+2.*Px.*Py.^6);
    dG_GL_k_Px_alpha1122=alpha1122_G.*4.*Px.^3.*Py.^4;
    dG_Px=dG_GL_k_Px_alpha1+dG_GL_k_Px_alpha11+dG_GL_k_Px_alpha12+dG_GL_k_Px_alpha111+dG_GL_k_Px_alpha112+dG_GL_k_Px_alpha1111+dG_GL_k_Px_alpha1112+dG_GL_k_Px_alpha1122;
    
    dG_GL_k_Py_alpha1=2.*alpha1_G.*Py;
    dG_GL_k_Py_alpha11=4.*alpha11_G.*Py.^3;
    dG_GL_k_Py_alpha12=2.*alpha12_G.*Py.*Px.^2;
    dG_GL_k_Py_alpha111=6.*alpha111_G.*Py.^5;
    dG_GL_k_Py_alpha112=alpha112_G.*(4.*Py.^3.*Px.^2+2.*Py.*Px.^4);
    dG_GL_k_Py_alpha1111=alpha1111_G.*8.*Py.^7;
    dG_GL_k_Py_alpha1112=alpha1112_G.*(6.*Py.^5.*Px.^2+2.*Py.*Px.^6);
    dG_GL_k_Py_alpha1122=alpha1122_G.*4.*Py.^3.*Px.^4;
    dG_Py=dG_GL_k_Py_alpha1+dG_GL_k_Py_alpha11+dG_GL_k_Py_alpha12+dG_GL_k_Py_alpha111+dG_GL_k_Py_alpha112+dG_GL_k_Py_alpha1111+dG_GL_k_Py_alpha1112+dG_GL_k_Py_alpha1122;
    
%     noise=1e-3*randn(1);
    noise=0*randn(1);
    Px_G=Px_G-(deltat*dG_Px+noise);
%     noise=1e-3*randn(1);
    noise=0*randn(1);
    Py_G=Py_G-(deltat*dG_Py+noise);
end

Px=gather(Px_G); Py=gather(Py_G);