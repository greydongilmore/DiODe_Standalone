clear
close all
clc
%% exampleinputs
% ctpath: full path to postoperative ct-file in either .nii or .nii.gz format

ctpath='/home/greydon/Downloads/sub-P231_ses-post_acq-Electrode_run-01_ct.nii.gz';
side = 1;
head_mm_initial = [15.036,-24.577,51.102];
tail_mm_initial = [21.369,-8.614,72.443];
side = 2;
head_mm_initial = [-5.482,-25.054,51.622];
tail_mm_initial = [-15.636,-11.433,72.096];


ctpath='/home/greydon/Downloads/sub-P238_ses-post_acq-Electrode_run-01_ct.nii.gz';
side = 1
head_mm_initial = [-2.055, 0.752,47.71];
tail_mm_initial = [9.06,14.653,70.210];
side = 2
head_mm_initial = [-15.005,-6.169,48.223];
tail_mm_initial = [-38.93,5.874,70.210];


ctpath='/home/greydon/Documents/GitHub/DiODE_python/data/sub-P235_ses-post_acq-bscDirected_run-02_ct.nii.gz'
side = 1
head_mm_initial = [9.394,-9.352,38.891]
tail_mm_initial = [24.699,-1.75,68.544]
side = 2
head_mm_initial = [-12.052,-12.952,38.589]
tail_mm_initial = [-19.151,-2.304,68.544]


ctpath='/home/greydon/Downloads/sub-P237_ses-post_acq-Electrode_run-01_ct.nii.gz'
side = 1
head_mm_initial = [16.365,-5.5893,45.034]
tail_mm_initial = [24.551,-1.385,76.909]
side = 2
head_mm_initial = [-5.937,-5.965,43.658]
tail_mm_initial = [-23.487,-4.684,76.909]


tmat_vx2mm = ct.mat;
unitvector_mm = (tail_mm_initial - head_mm_initial)/norm(tail_mm_initial - head_mm_initial); % vector along the lead axis with 1mm length


elmodel = 'Boston Scientific Vercise Directed'; % electrode model, possible inputs:
elspec = diode_elspec(elmodel);
[ct,ct.img] = diode_load_nii(ctpath);

% head_mm: coordinates in mm (RAS-convention) of the tip/ventral contact of the
% electrode as seen in the CT

% tail_mm: coordinates in mm (RAS-convention) of a second, more dorsal point on the
% electrode trajectory, preferably within the stiff part of the electrode

% myside: 1 = right hemisphere; 2 = left hemisphere


data_path='/home/greydon/Documents/GitHub/DiODE_python/data';

subjects = dir(data_path);
subjects = subjects(~strcmp({subjects.name},'.') & ~strcmp({subjects.name},'..') & contains({subjects.name},'.nii.gz'));

for isub = 1:length(subjects)
    ctpath = fullfile(subjects(isub).folder,subjects(isub).name);
    sub = strsplit(subjects(isub).name,'_');
    subji = sub{1};

    fcsv_source=fullfile(data_path, [subji,'_coords.fcsv']);
    [data_table] = read_fcsv(fcsv_source);
    
    sides=unique(data_table.description);
    for iside = 1:length(sides)
        side_num=1;
        if strcmpi(sides(iside),'left')
            side_num=2;
        end
        head_mm_initial = table2array(data_table(strcmpi(data_table.description,sides(iside)) & strcmpi(data_table.name,'head'),{'X','Y','Z'}));
        tail_mm_initial = table2array(data_table(strcmpi(data_table.description,sides(iside)) & strcmpi(data_table.name,'tail'),{'X','Y','Z'}));
        filePattern = fullfile(data_path, [subji,'*.nii.gz']);
        ctpath = dir(filePattern);
        ctpath=fullfile(ctpath.folder,ctpath.name);
        elmodel = 'Boston Scientific Vercise Directed';
    
        elspec = diode_elspec(elmodel);
        [ct,ct.img] = diode_load_nii(ctpath);
        tmat_vx2mm = ct.mat;
        unitvector_mm = (tail_mm_initial - head_mm_initial)/norm(tail_mm_initial - head_mm_initial); % vector along the lead axis with 1mm length
        
        [roll_y,y,~] = ea_diode_auto(side_num,ct,head_mm_initial,unitvector_mm,tmat_vx2mm,elspec);
    end



% elmodel: Name of the electrode motel, possible inputs:
% 'Boston Scientific Vercise Directed'
% 'St. Jude Directed 6172 (short)'
% 'St. Jude Directed 6173 (long)'
% 'Medtronic B33005'
% 'Medtronic B33015'
% Please note that DiODe has only been validated for the Boston Scientific
% directional lead.
elmodel = 'Boston Scientific Vercise Directed'; % electrode model, possible inputs:
%%
[roll_y,y,roll_y_deg] = diode_standalone(ctpath, head_mm_initial, tail_mm_initial, side, elmodel);