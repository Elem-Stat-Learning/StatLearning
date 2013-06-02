function miscl_err = misclass_err(node_labels, classes)
  %find probs for every class
  class_len = length(classes);
  node_len = size(node_labels, 2);
  class_prob = zeros(class_len, 1);
  for i=1:class_len
    class_prob(i) = sum(node_labels == classes(i)) / node_len;
  endfor
  miscl_err = -1*class_prob +1;
end
