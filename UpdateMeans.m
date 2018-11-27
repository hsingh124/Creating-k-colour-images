%This function calculates the mean values for each cluster
%input: A -> The selected image.
%       k -> A single value specifying the number of clusters.
%       clusters -> A 2D array of same dimensions as that of A(image)
%                   specifying which cluster each pixel belongs to.
%output: means -> A 3D array containing k rows, 1 column and 3 layers,
%                 which stores the mean values for each cluster.
%
%author: Harry

function means = UpdateMeans(A,k,clusters)

[Arow,Acol,c] = size(A);
means = zeros(k,1,3);

for i = 1:k
    z = 0;
    r = 0;
    g = 0;
    b = 0;
    for x = 1:Arow
        for y = 1:Acol
            
            %adding up all the R values together, G values together,and B
            %values together for a particular cluster and also counting the
            %number of elements which belong to that particular cluster.
            if clusters(x,y) == i
                r = A(x,y,1) + r;
                g = A(x,y,2) + g;
                b = A(x,y,3) + b;
                z = z + 1;
            end
        end
    end
    
    %storing the mean values in the 3D array means.
    means(i,1,1) = r/z;
    means(i,1,2) = g/z;
    means(i,1,3) = b/z;
end





