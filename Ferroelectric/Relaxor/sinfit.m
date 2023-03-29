function [fitresult, gof] = sinfit(t, Px)
%CREATEFIT(T,PX)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : t
%      Y Output: Px
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 16-Oct-2020 10:50:44


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( t, Px );

% Set up fittype and options.
ft = fittype( 'a*sin(b*x+c)+d', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.0421975353386567 0.985931195515926 0.509978357394358 0.694828622975817];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );


