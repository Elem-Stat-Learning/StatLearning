function bootstrap_idx = bootstrapSampling(y, b_ratio, b_num)
  y_len = size(y,1);
  b_len = y_len * b_ratio;
  bootstrap_idx = rand(b_len, b_num);
  bootstrap_idx = 1 + (bootstrap_idx * (y_len - 1));
  bootstrap_idx = round(bootstrap_idx);
end
