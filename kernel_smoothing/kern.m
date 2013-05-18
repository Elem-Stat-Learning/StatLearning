function k = kern(u, kern_id)
  k = zeros(size(u));
  %indeces where |u| > 1, so k = 0; 
  u_dist = euclidean_dist(u, zeros(1, size(u,2)));  
  idx = find(u_dist <= 1);  
  switch (kern_id)
    %uniform
    case 1
      k(idx, :) = 0.5;
    %triangular
    case 2
      k(idx, :) = ones(length(idx),1) -  u_dist(idx, :);
    %epanechnikov
    case 3
      k(idx, :) = 0.75 * (-1*u(idx, :).*u(idx, :) + 1);
    %quadratic(biweight)
    case 4
      k(idx, :) = (15/16) * (-1*u(idx, :).*u(idx, :) + 1).^2;
    %triweight
    case 5
      k(idx, :) = (35/32) * (-1*u(idx, :).*u(idx, :) + 1).^3;
    %tricube
    case 6
      k(idx, :) = (70/81) * ((-1*u_dist(idx, :).^3) + 1).^3;
    %gaussian
    case 7
      k(idx, :) = (1/sqrt(2*pi)) * exp(-0.5 * u(idx, :).^2); 
    %cosine
    case 8
      k(idx, :) = (pi/4) * cos(pi/2 * u(idx, :));
  endswitch
end
