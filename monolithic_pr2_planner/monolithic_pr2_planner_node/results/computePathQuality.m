function stats = computePathQuality(filename)
  base = [];
  spine = [];
  obj = [];
  arm_sqr = [];
  arm_abs = [];

  path_filename = filename;
  if exist(path_filename, 'file')~=2 
    fprintf('Asked for a file that does not exist. %s\n',filename);
    base = -1;
    spine = -1;
    obj = -1;
    arm_abs = -1;
    arm_sqr = -1;
  else
    raw_path = load(path_filename);
    %read 'sub-trajectories' that make up the full path
    base_path = raw_path(:,1:3);
    spine_path = raw_path(:,4);
    arm_path = raw_path(:,5:11);
    obj_path = raw_path(:,12:15);

    base = sum(sqrt(sum(diff(base_path(:,1:2)).^2,2)));
    spine = sum(sqrt(sum(diff(spine_path).^2,2)));
    obj = sum(sqrt(sum(diff(obj_path(:,1:3)).^2,2)));

    %compute arm path
    arm_diff = [];
    for j=2:size(arm_path,1)
       for k=1:size(arm_path,2)
         ang1 = mod(arm_path(j-1,k), 2*pi);
         ang2 = mod(arm_path(j,k), 2*pi);
         ang = mod(ang2-ang1, 2*pi);
         if ang > pi
           ang = -(2.0*pi - ang);
         end
         arm_diff(j-1,k) = ang;
       end
    end
    arm_abs = sum(sqrt(sum(abs(arm_diff),2)));
    arm_sqr = sum(sqrt(sum(arm_diff.^2,2)));
  end

  stats.base = base;
  stats.spine = spine;
  stats.obj = obj;
  stats.arm_abs = arm_abs;
  stats.arm_sqr = arm_sqr;
end

