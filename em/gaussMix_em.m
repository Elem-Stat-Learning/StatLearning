function params =  gaussMix_em(x, init_params, tol)
  %initialize params
  params = init_params;
  comp_num = size(params, 2);
  x_len = size(x,2);
  counter = 0;
  maxIter = 25000;
  %latent variables
  g = zeros(x_len, comp_num); 
  %loop expectation - maximization
  t = tol + 1;
  logfile = fopen("logfile", "w");
  while(t > tol & counter < maxIter)
    %expectation step
    ex_g = g;
    r = zeros(x_len, comp_num);
    for i=1:x_len
      for j=1:comp_num
        r(i,j) = params(1, j) * normpdf(x(1, i),params(2,j), params(3,j));
      endfor
      g(i, :) = r(i,:) / (sum(r(i,:))); %normalization
    endfor
    t = (max(max(abs(g - ex_g))));
    %maximization step
    for j=1:comp_num
      %params(2,j) = sum(x* g(:,j)) / sum(g(:,j));
      %params(3,j) = sqrt(((x - params(2,j)).^2 * g(:,j)) / sum(g(:,j)));
      %params(1,j) = mean(g(:,j));
      params(1, j) = sum(g(:,j)) / x_len;
      params(2, j) = 1/(x_len * params(1, j)) * (x * g(:,j));
      params(3, j) = 1/(x_len * params(1, j)) * ((x - repmat(params(2, j), 1, x_len)).^2 * g(:,j));
      params(3, j) = sqrt(params(3,j));
    endfor
    counter = counter + 1;
    fprintf('Iteration: %i, difference = %f\n', counter, t); 
  endwhile
  fclose(logfile);
end
