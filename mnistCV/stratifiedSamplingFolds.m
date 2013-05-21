function folds_idx = stratifiedSamplingFolds(y, folds_ratio)
  %sum folds_ratio should be 1
  %return indeces in rows for every fold
  folds_idx = {};
  rows_idx = 1:size(y,1);
  %find classes values
  un_classes = unique(y);
  classes_num = length(un_classes);
  for i=1:classes_num
    class_idx = rows_idx(y==un_classes(i));
    class_len = length(class_idx);
    folds_num = length(folds_ratio);
    for j=1:folds_num
      perm_idx = randperm(class_len);
      num = floor(class_len * folds_ratio(j));
      folds_idx(j,i) = class_idx(perm_idx(1:num));
    endfor
  endfor
end
