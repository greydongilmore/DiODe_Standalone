function [vol,img] = diode_load_nii(file)
    if contains(file,'.nii.gz')
        gunzip(file)
        vol = spm_vol(file(1:end-3));
        img = spm_read_vols(vol);
        vol.fname = file(1:end-3);
    elseif ~contains(file,'.nii.gz') && contains(file,'.nii')
        vol = spm_vol(file);
        img = spm_read_vols(vol);
    else
        error('File seems to be neither .nii nor .nii.gz!')
    end
    
    %% voxsize
    p1 = ones(4,3);
    p2 = [2,1,1;1,2,1;1,1,2;1,1,1];
    p1mm = vol.mat * p1;
    p2mm = vol.mat * p2;
    for k = 1:3
        vol.voxsize(1,k) = norm(p1mm(1:3,k)-p2mm(1:3,k));
    end
    
end