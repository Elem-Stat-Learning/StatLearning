function folds_idx = stratifiedSamplingFolds(y, folds_ratio, repVals)
  %sum folds_ratio should be 1
  %return indeces in rows for every fold
  folds_idx = {};
  rows_idx = 1:size(y,1);
  %find classes values
  un_classes = unique(y);
  classes_num = length(un_classes);
  for i=1:classes_num
    class_idx = rows_idx(y==un_classes(i));
    folds_num = length(folds_ratio);
    class_len = length(class_idx);
    for j=1:folds_num
      perm_idx = randperm(length(class_idx));
      num = floor(class_len * folds_ratio(j));
      folds_idx(j,i) = class_idx(perm_idx(1:num));
      if (repVals == 0)
        class_idx(perm_idx(1:num)) = [];
      endif
    endfor
  endfor
  folds_idx = cell2mat(folds_idx);
end
