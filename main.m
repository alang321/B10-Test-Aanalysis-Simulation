
%la vision porobe has 756 hz

%snapshotList = importSnapshotList("Case0.dat", "DATAPACKING", "ZONE");
%snapshotList1 = importSnapshotList("Case1.dat", "DATAPACKING", "ZONE");
%snapshotList2 = importSnapshotList("Case2.dat", "DATAPACKING", "ZONE");

load('snapshotList.mat')
load('snapshotList1.mat')
load('snapshotList2.mat')
%% 

plotSnapshotList(snapshotList, 1/756)
%plotCombinedSnapshotList(snapshotList1, snapshotList2, 1/756)


%% Put anything you want to run multiple times here without having to run the snapshot all over again
% expect long run-times for snapshotList 1 and 2
NACApolymodel(snapshotList)
%% 
snapshotList = importSnapshotList("Case0.dat", "DATAPACKING", "ZONE");
%snapshotList1 = importSnapshotList("Case1.dat", "DATAPACKING", "ZONE");
%snapshotList2 = importSnapshotList("Case2.dat", "DATAPACKING", "ZONE");

%plotSnapshotList(snapshotList, 1/100);

%plotCombinedSnapshotList(snapshotList1, snapshotList2, 1/756)



snapshotListPerRow = groupSnapshotPerRow(snapshotList, 7);
snapshotListPerCol = groupSnapshotPerColumn(snapshotList, 8);

plotGroupedSnapshot(snapshotListPerRow, 1/100)
plotGroupedSnapshot(snapshotListPerCol, 1/100)
