function [trainset, testset] = stratifiedSampling(y, test_ratio)
  rows_idx = 1:size(y,1);
  pos_idx = rows_idx(y==0);
  neg_idx = rows_idx(y==1);
  pos_num = floor(length(pos_idx) * test_ratio);
  neg_num = floor(length(neg_idx) * test_ratio);
  pos_rand = randperm(length(pos_idx));
  neg_rand = randperm(length(neg_idx));
  testset = [pos_idx(pos_rand(1:pos_num)), neg_idx(neg_rand(1:neg_num))];
  trainset = [pos_idx(pos_rand(pos_num+1:end)), neg_idx(neg_rand(neg_num+1:end))];
  %permutate
  testset = testset(randperm(length(testset)));
  trainset = trainset(randperm(length(trainset)));
end 
