%This function creates a k-colour image for an image whose pixels are
%divided into k clusters and assigns each pixel the mean colour value
%respective to their cluster number.
%input: newcluters-> A 2D array with the same number of rows and columns as
%                    that of the image specifying the cluster number for
%                    each pixel.
%       newmeans-> A 3D array of k rows, 1 column, and 3 layers containing
%                  the mean colour values for each cluster corresponding to
%                  the row number.
%output: newimg-> It is a 3D array of unsigned 8bit integers representing
%                 an RGB image. The colour of each pixel in this image is
%                 determined by the colour of the cluster that pixel
%                 belongs to.
%
%author: Harry

function newimg = CreateKColourImage(newclusters,newmeans)

%rounding of the values of newmeans to the nearest integers.
newmeans  =  round(newmeans);


[Mrow,Mcol,Mc] = size(newmeans);

[row,col,c] = size(newclusters);

newimg = zeros(row,col,3);

%checking for each pixel of the input image, what cluster it belongs to and
%then respectively giving an RBG value to the same pixel of the output
%image(newimg).
for i = 1:Mrow
    for x = 1:row
        for y = 1:col
            if(newclusters(x,y) == i)
                for j = 1:3
                    newimg(x,y,j) = newmeans(i,1,j);
                end
            end
        end
    end
end

%converting newimg into type uint8
newimg = uint8(newimg);
