%SelectKRandomPoints function is responsible for
%generating a list of K randomly selected pixels
%from the respective image.
%inputs: A -> the selected image(3D array), k -> number of pixels to select
%outputs: poins -> a 2D array of k rows and 2 cloumns representing the
%                  position of the randomly selected points(pixels)
%
%author: Harry

function points = SelectKRandomPoints(A,k)

[row,col,c] = size(A);
i = 1;
points = zeros(k,2);
y = 0;

a(1,1) = (randi([1,row]));
a(1,2) = (randi([1,col]));

while i <= k
    
    if y == 0
        points(i,1) = a(1,1);
        points(i,2) = a(1,2);
    end
    
    
    a(1,1) = (randi([1,row]));
    a(1,2) = (randi([1,col]));
    
    y = 0;
    
    %if the point is repeated, y increments by 1.
    for x = 1:i
        if  points(x,1) == a(1,1) && points(x,2) == a(1,2)
            y = y + 1;
        end
    end
    
    %if y is 0, that means no point repeated so i increments by 1.
    %is y is not 0, that means points were repeated hence the loop executed
    %again without incrementing i so that different values can be
    %generated.
    if y == 0 && i < k
        i = i + 1;
    elseif i == k
        i = i + 1;
    end
    
end

