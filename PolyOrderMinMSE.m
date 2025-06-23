function [MSE_best, poly_order_best] = PolyOrderMinMSE(X,y,poly_order_max)
    MSE_best = 99999 ;
    for poly_order = 1:poly_order_max 
        MSE = MSE_PolyFit(X, y, poly_order);
        if MSE < MSE_best
            MSE_best = MSE;
            poly_order_best = poly_order;
        else 
        end
    end
end
             