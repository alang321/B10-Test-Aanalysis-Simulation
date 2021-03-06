function medianList = getSortedMediansFromColumnClusters(snapshotListCol)

medianList = {};


for i = 1:length(snapshotListCol)
    medianArray = zeros(length(snapshotListCol{i}), 2);
    for j = 1:length(snapshotListCol{i})
        medianArray(j, 1) = mean(snapshotListCol{i}{j}.xmm);
        medianArray(j, 2) = mean(snapshotListCol{i}{j}.ymm);
    end
    
    A = transpose(sortrows(medianArray,1, 'ascend'));
        
    medianList{end  + 1} = A;
end

end