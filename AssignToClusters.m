%This function assigns each point (pixel) in an image to a cluster, based
%on which mean that point is closest to.
%input: A -> image(3D array)
%       pclrs -> a 3D array containing the RGB values of the selected
%       pixels.
%output: clusters -> a 2D array of the same dimensions as that of the image
%                    which contains the corresponding cluster number for
%                    each pixel of the image.
%
%author: Harry

function clusters = AssignToClusters(A,pclrs)

%assigning the size of A and pclrs to variables.
[row,col,cl] = size(A);
[prow,pcol,pc] = size(pclrs);

if prow > 1
    %change the dimentions of A to (no. of elements of A)x(3) and store it in M.
    M = reshape(A,[(row*col),3]);
    
    M2 = M';
    
    %an array rep which stores repeated values of M2 with the same positioning
    %row by row as many times as the no. of rows of pclrs.
    rep = repmat(M2,prow,1);
    
    %storing in M3 an array which is the same as pclrs with dimentions:
    %(no. of rows of pclrs)x(3)
    M3 = reshape(pclrs,[prow,3]);
    
    M4 = M3';
    
    %storing in M5 an array which is the same as M4 with dimentions:
    %(no. of rows of pclrs * 3)x(3)
    M5 = reshape(M4,[prow*3,1]);
    
    %an array rep2 which stores repeated values of M5 with the same positioning
    %column by column as many times as the total no. of pixels.
    rep2 = repmat(M5,1,(row*col));
    
    %an array Sq which stores the squared distance of each element of rep
    %and rep2.
    Sq = (rep-rep2).^2;
    
    %reshaping the array Sq to dimentions -> 3 x (no. of rows of pclrs * total
    %pixels and storing it in Sq2).
    Sq2 = reshape(Sq, 3, (prow*row*col));
    
    %Storing the sum of all columns of Sq2 in the array Sqsum.
    Sqsum = sum(Sq2);
    
    %reshaping Sqsum to dimentions -> no. of rows of pclrs x total pixels and
    %storing it in Sq2.
    Sqsum2 = reshape(Sqsum,[prow,(row*col)]);
    [minvals,index] = min(Sqsum2);
    
    %checking if index has a length of greater than 1 or not as the input for
    %the number of colours can also be 1.
    if length(index) > 1
        clusters = reshape(index, [row,col]);
    end
    if length(index) == 1
        clusters = index*ones(row,col);
    end
    
elseif prow == 1
    clusters = ones(row,col);
end









