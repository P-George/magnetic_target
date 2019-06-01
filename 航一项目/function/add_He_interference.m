function [X,Y,Z, total] = add_He_interference(He, permanent, induce, eddy,electric,displayment)
total_vector = He + permanent + induce + eddy + electric + displayment;
X = total_vector(1,1:end);
Y = total_vector(2,1:end);
Z = total_vector(3,1:end);
total = sqrt(X.^2 + Y.^2 + Z.^2);
end