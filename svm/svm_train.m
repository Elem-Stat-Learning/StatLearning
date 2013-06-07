function [model] = svm_train(X, Y, C, kernelFunction, kernel_params, tol, max_passes)

if ~exist('tol', 'var') || isempty(tol)
    tol = 1e-3;
end

if ~exist('max_passes', 'var') || isempty(max_passes)
    max_passes = 5;
end

% Data parameters
m = size(X, 1);
n = size(X, 2);

% Map 0 to -1
Y(Y==0) = -1;

% Variables
alphas = zeros(m, 1);
b = 0;
E = zeros(m, 1);
passes = 0;
eta = 0;
L = 0;
H = 0;


% We have implemented optimized vectorized version of the Kernels here so
% that the svm training will run faster.
if strcmp(kernelFunction, 'linearKernel')
    K = X*X';
elseif strcmp(kernelFunction, 'gaussianKernel')
    sigma = kernel_params(1);
    K = feval(kernelFunction, X, X, sigma);
else
    K = zeros(m);
    for i = 1:m
        for j = i:m
             K(i,j) = kernelFunction(X(i,:)', X(j,:)');
%             K(j,i) = K(i,j); %the matrix is symmetric
        end
    end
end

size(K)
%get SVM coefficients
alpha_star = qp(0, (K'*K).*(Y'*Y), -ones(1,n) , ones(1,n) )
end            
