%This function returns the RGB colour value for the pixels of an image it
%takes as an input.
%inputs: A -> The selscted image(3D array)
%        points -> The selected pixels of the image.
%output: pclrs -> A 3D array which contains the RGB values of the selected
%                 pixels.
%
%author: Harpreet Singh

function pclrs = GetRGBValuesForPoints(A,points)

[pntsRow,pntsCol] = size(points);
pclrs = zeros(pntsRow,1,3);

%Storing the RGB values of the selected image pixels into a 3D array called
%pclrs.
for i = 1:pntsRow
    for j = 1:3
        
        pclrs(i,1,j) = A(points(i,1),points(i,2),j);
        
    end
end
