function penalty = outLrPenalty(Theta1, Theta2, lambda)
  penalty = (lambda / 2) * (sum(sum(Theta1.^2, 2), 1) + sum(sum(Theta2.^2, 2), 1));
end
