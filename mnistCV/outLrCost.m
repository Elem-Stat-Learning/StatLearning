function [cost, delta] = outLrCost(yval, hx)
  out_neur = size(hx, 1);
  y = zeros(out_neur, 1);
  y(yval,1) = 1;
  delta = hx - y;
  cost = -1 *((y'*log(hx)) + ((-1*y' +1)*log(-1*hx +1)));
end
