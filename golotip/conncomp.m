% [K, comp, compl] = conncomp(N,I,J) or conncomp(A)
% Connected components of a graph
%
% Finds the connected components of an undirected graph. The graph can be
% given by its adjacency matrix A, or by giving its number of vertices N and
% its edges I<->J. It uses a depth-first search which is O(E) on average,
% where E is the number of edges.
%
% In:
%   A: NxN adjacency matrix.
%   N: number of vertices.
%   I, J: Ex1 vectors containing the edges (between I(e) and J(e)).
% Out:
%   K: number of connected components.
%   comp: Kx1 structure array containing the components, each element
%      (field "c") is a list of vertices.
%   compl: Nx1 list containing the component label for each vertex.

% Copyright (c) 2009 by Miguel A. Carreira-Perpinan

function [K, comp, compl] = conncomp(N,I,J)

if nargin==1
  A = N; N = size(A,1);
else
  % Build adjacency matrix
  A = sparse(I,J,ones(length(I),1),N,N);
  % Ensure it is symmetric (this actually reduces its storage size, since it
  % becomes a logical sparse array)
  A = (A+A') > 0;
end

L = 1:N;
K = 0;
compl = zeros(N,1);

while ~isempty(L)
  M = L(1);				% Pick point from L
  L = L(2:end);				% L = setdiff(L,M);
  K = K + 1; C = M;
  while ~isempty(M)			% Compute Kth component
    if ~isempty(L)
      n = L(find(A(L,M(1))));		% Neighbours of M(1) in L
      M = union(n,M(2:end));		% M = setdiff(M,M(1)) U n;
      L = setdiff(L,n);
      C = union(C,n);
    else
      M = [];
    end;
  end
  comp(K).c = C;
  compl(C) = K;				% Vertex memberships
end


% Another way to compute the connected components (far slower in this
% implementation): through the reachability matrix of the graph, R = A^Inf. 
% R can be computed efficiently as logical powers of 2 of A (A^n = R for n <
% log2(N-1)), or recursively by computing the reachable neighbours of a
% given point. The implementation below, though vectorised, can be made more
% efficient with loops and logical operations.

% $$$ % Adjacency matrix
% $$$ A = sparse(I,J,ones(length(I),1),N,N);
% $$$ A = (A+A') > 0;
% $$$ A = full(A);
% $$$ % Force ones along the diagonal
% $$$ A(sub2ind(size(A),1:N,1:N)) = 1;
% $$$ 
% $$$ % 1. Compute reachability matrix R = A^Inf.
% $$$ R = A; oldR = zeros(size(A));
% $$$ while any(xor(oldR(:),R(:)))
% $$$   oldR = R; R = R^2 > 0;
% $$$ end
% $$$ % 2. Compute labels.
% $$$ list = (1:N)'; labels = zeros(N,1); K = 0;
% $$$ while ~all(isnan(list))
% $$$   i = min(list); c = R(:,i);
% $$$   K = K + 1;
% $$$   labels(c) = K;
% $$$   list(c) = NaN;
% $$$ end

