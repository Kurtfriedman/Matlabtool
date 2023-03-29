function dG_GL=get_dG_GL(Px,Py,T,Tc,Ex,exx,eyy,exy)

    alpha1=4.124e5*(T-Tc);
    alpha11=-2.097e8; alpha12=7.974e8;
    alpha111=1.294e9; alpha112=-1.950e9;
    alpha1111=3.863e10; alpha1112=2.529e10; alpha1122=1.637e10;
    Q11=0.1104; Q12=-0.452; Q44=0.0289;
    dG_GL_k_Px_alpha1=2.*alpha1.*Px;
    dG_GL_k_Px_alpha11=4.*alpha11.*Px.^3;
    dG_GL_k_Px_alpha12=2.*alpha12.*Px.*Py.^2;
    dG_GL_k_Px_alpha111=6.*alpha111.*Px.^5;
    dG_GL_k_Px_alpha112=alpha112.*(4.*Px.^3.*Py.^2+2.*Px.*Py.^4);
    dG_GL_k_Px_alpha1111=alpha1111.*8.*Px.^7;
    dG_GL_k_Px_alpha1112=alpha1112.*(6.*Px.^5.*Py.^2+2.*Px.*Py.^6);
    dG_GL_k_Px_alpha1122=alpha1122.*4.*Px.^3.*Py.^4;
    dG_GL=dG_GL_k_Px_alpha1+dG_GL_k_Px_alpha11+dG_GL_k_Px_alpha12+dG_GL_k_Px_alpha111+dG_GL_k_Px_alpha112+dG_GL_k_Px_alpha1111+dG_GL_k_Px_alpha1112+dG_GL_k_Px_alpha1122-Ex-2*Px.*(Q11*exx+Q12*eyy)-0.5*Q44*exy.*Py;
end