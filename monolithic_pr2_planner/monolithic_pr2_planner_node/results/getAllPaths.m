function stats = getAllPaths(idx, method)
stats.base = [];
stats.spine = [];
stats.obj = [];
stats.arm_sqr = [];
stats.arm_abs = [];

for i=1:size(idx)
  fprintf('%s %d\n',method,i);
  if idx(i)
    folder_num = floor((i-1)/10);
    file_num = i-1;
    if strcmp(method,'rrt')
      s = computePathQuality(['planning_stats_' method '/rrt_' num2str(file_num,'%02i') '.path']);
    else 
      s = computePathQuality(['planning_stats_' method '/smha_' num2str(file_num,'%02i') '.path']);
    
    end
    stats.base(end+1) = s.base;
    stats.spine(end+1) = s.spine;
    stats.obj(end+1) = s.obj;
    stats.arm_sqr(end+1) = s.arm_sqr;
    stats.arm_abs(end+1) = s.arm_abs;
  else
    stats.base(end+1) = -1;
    stats.spine(end+1) = -1;
    stats.obj(end+1) = -1;
    stats.arm_abs(end+1) = -1;
    stats.arm_sqr(end+1) = -1;
  end
end

end
