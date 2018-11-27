%This function calculates the Squared Distance between two points.
%input: P,Q -> two points between the distance is to be calculated.
%output: D -> the squared dictance.
%
%author: Harry

function D = SquaredDistance(P,Q)

D = (P(1) - Q(1))^2 + (P(2) - Q(2))^2 + (P(3) - Q(3))^2;

