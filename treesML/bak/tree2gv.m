function tree2gv(tree_root, filename)
  fd = fopen(filename, 'w');
  fprintf(fd, 'digraph g{\n');
  node2gv(tree_root, 'root', fd);
  fprintf(fd, '}');
  fclose(fd);
end

function node2gv(root, id, fd)
  if (length(root.node) == 0)
    fprintf(fd, '"%s" [label = "X_%i > %f" shape=diamond];\n', id, root.split_dim, root.split_val);
    if (max(size(root.left)) > 0)
      left_id = strcat(id, ".left");
      fprintf(fd, '"%s" -> "%s";\n', id, left_id);
      node2gv(root.left, left_id, fd);
    endif
    if (max(size(root.right)) > 0)
      right_id = strcat(id, ".right");
      fprintf(fd, '"%s" -> "%s";\n', id, right_id);
      node2gv(root.right, right_id, fd);
    endif
  else
    max_len = 10;
    max_iter = fix(length(root.node) / max_len);
    str_nodes = "";
    for i=1:max_iter
      min_idx  = (i-1) * max_len + 1;
      max_idx = i * max_len;
      str_nodes = strcat(strcat(str_nodes, '\n'), mat2str(root.node(min_idx:max_idx)));
    endfor
    min_idx  = max_iter * max_len + 1;
    str_nodes = strcat(strcat(str_nodes, '\n'), mat2str(root.node(min_idx:end)));
    fprintf(fd, '"%s" [label = "%s"];\n', id, str_nodes);
  endif
end  
