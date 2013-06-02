function cr_err = cross_entr(node_labels, classes)
  %find probs for every class
  class_len = length(classes);
  node_len = size(node_labels, 2);
  class_prob = zeros(class_len, 1);
  for i=1:class_len
    class_prob(i) = sum(node_labels == classes(i)) / node_len;
  endfor
  cl_log_prob = log(class_prob);
  cr_err = -1* ( class_prob' * cl_log_prob);
end
