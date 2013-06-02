function gini_val = gini(node_labels, classes)
  %find probs for every class
  classes = unique(classes);
  class_len = length(classes);
  node_len = size(node_labels, 1);
  class_prob = zeros(class_len, 1);
  for i=1:class_len
    class_prob(i) = sum(node_labels == classes(i)) / node_len;
  endfor
  class_not_prob = -1*class_prob +1;
  gini_val = class_prob' * class_not_prob;
end
