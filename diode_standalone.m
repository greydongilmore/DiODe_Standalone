function [roll_y,y,roll_y_deg] = diode_standalone(ctpath, head_mm, tail_mm, myside, elmodel)
% close all
% clearvars
% clc
%% Example Inputs
% ctpath = 'J:\Till\LEAD_singlePats\p_064\postop_ct.nii'; %% path to nifti file
% head_mm = [27.3 -130 20.9]; %% image coordinates of the center of the most ventral contact
% tail_mm = [31.5 -125.2 36.1]; %% image coordinates of the center of the most dorsal contact
% myside = 1; %% 1 for right, 2 for left
% options.elmodel = 'Boston Scientific Vercise Directed'; %% lead type -> see below for nomenclature

%%
elspec = diode_elspec(elmodel);
[ct,ct.img] = diode_load_nii(ctpath);
sides = {'right','left','3','4','5','6','7','8'};
for side = myside
    disp(['Reconstructing rotation of ' sides{side} ' lead!'])
    % import lead information
    %     load([folder 'ea_reconstruction.mat']); % included in for-loop to make independent ea_save_reconstruction for both sides
    
    %% transform head/tail coordinates from native to image coordinates
    tmat_vx2mm = ct.mat;
    unitvector_mm = (tail_mm - head_mm)/norm(tail_mm - head_mm); % vector along the lead axis with 1mm length
    
    %% launch DiODe for different leads
     if ismember(elmodel, {'Boston Scientific Vercise Directed', ...
            'St. Jude Directed 6172 (short)', ...
            'St. Jude Directed 6173 (long)'})
        [roll_y,y,~] = ea_diode_auto(side,ct,head_mm,unitvector_mm,tmat_vx2mm,elspec);
    elseif ismember(elmodel, {'Medtronic B33005', 'Medtronic B33015'})
        [roll_y,y,~] = ea_diode_medtronic(side,ct,head_mm,unitvector_mm,tmat_vx2mm,elspec);
    else  % check for electrode type and postoperative imaging
        msg = sprintf(['No Valid Directional Lead Selected!']);
        choice = questdlg(msg,'No Directional Lead!','Abort','Abort');
        roll_y = [];
        y = [];
        return
    end
    
    roll_y_deg = rad2deg(roll_y);
end
if contains(ctpath,'.nii.gz')
    delete(ctpath(1:end-3))
end    
end