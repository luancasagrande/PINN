clear all
clc

load('C:\Users\Luan\Downloads\workspacexx (1).mat')

cmap = hsv(10);

for i = 1 : 10
   a = minPFold(i);
   plot(a{1},'Color',cmap(i,:));
   hold on
end

legend('Set 1','Set 2','Set 3','Set 4','Set 5','Set 6','Set 7','Set 8','Set 9','Set 10');
title('Minimum Fitness Per Generation');
xlabel('Generation');
ylabel('Fitness');

figure
for i = 1 : 10
   a = medPFold(i);
   plot(a{1},'Color',cmap(i,:));
   hold on
end

legend('Set 1','Set 2','Set 3','Set 4','Set 5','Set 6','Set 7','Set 8','Set 9','Set 10');
title('Average Fitness Per Generation');
xlabel('Generation');
ylabel('Fitness');