function [out] = get_structures_par(in,tidd)
% function that calculates and returns structural properties of sequences 
% in ... input sequences in cell array format
% out ... output sturctures in cell array format 
% tidd ... add predictions of tidd properties True/False

tmps = length(in);
x = length(in{1});
out = cell(tmps,1);
pp = ParforProgress; %https://se.mathworks.com/matlabcentral/fileexchange/48705-parforprogress-class

data1 = load('NN_structural_properties.mat');
data2 = load('NNN_structural_properties.mat');

parfor i = 1:tmps
    tmp = NN_sliced(in,tidd,i,x,data1.NNsp,data2.NNNsp);
    out{i} = tmp(1,3:end);
    iteration_number = step(pp, i);
    fprintf('Finished iteration %d of %d\n', iteration_number, i); 
end

end