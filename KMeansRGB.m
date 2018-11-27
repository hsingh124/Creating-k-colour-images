%This function partitions the points in an image into k clusters using the
%k-means algorithm.
%input: A -> The selected image.
%       seedmeans -> A 3D array comtaining seedmeans(initial means) which
%                    will be used to initialise the k-means algorithm.
%       i-> The maximum number of iterations to perform.
%output: newclusters-> A 2D array which specifies which cluster each
%                      pixel belongs to.(this is generally an updated array
%                      from the previous one as this computes on the new
%                      values of means)
%        newmeans-> A 3D array of k rows, 1 column and 3 layers which
%                   contains the mean colour values for the cluster
%                   corresponding to that row number
%implemented: AssignToClusters, UpdateMeans
%
%author: Harpreet Singh

function [newclusters,newmeans] = KMeansRGB(A,seedmeans,i)

[row,col,c] = size(seedmeans);
tempseedmeans = 0;
newmeans = 1;
j = 1;
x = 0;

%updating the means and assigning each pixel to a cluster according to the
%updated mean values.
while (j <= i)
    
    %If tempseedmeans == seedmeans, that means that the maximum number of
    %iterations have been achieved. This counts the loop executions before
    %the maximum number of iterations were achieved and j being less than
    %i.
    if tempseedmeans ~= seedmeans
        x = x + 1;
    end
    
    newclusters = AssignToClusters(A,seedmeans);
    newmeans = UpdateMeans(A,row,newclusters);
    tempseedmeans = seedmeans;
    seedmeans = newmeans;
    j = j + 1;
    
end

%if x is less than or equal to i that means the maximum no. of iterations
%were achieved before convergence.
if x <= i
    disp('Maximum number of iterations reached before convergence was achieved')
end


