function  [y_pred_lowess, MSE] = LowessSmoothing(Y, fraction)


y_pred_lowess = smooth(Y, fraction, 'rlowess')';


if ~iscolumn(Y)==iscolumn(y_pred_lowess)
    y_pred_lowess = y_pred_lowess';
end


MSE = immse(y_pred_lowess, Y);

disp( [ 'LOWESS MSE = ' num2str(MSE) ] )



end