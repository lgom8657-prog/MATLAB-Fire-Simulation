function [h,r,c]=firesort(A)
[h,linearIdx]=sort(A(:),'descend');
[r,c]=ind2sub(size(A),linearIdx);
end
%simply sorts a matrix by its entry values and records the row and column
%where they came from 