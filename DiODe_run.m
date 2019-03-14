%% DiODe Standalone
%  This Software has been released under a GNU General Public License v3.0.
%  If you are using it please credit the author via citing the following
%  publications:
%  Sitz et al., Medical Physics, 2017, Determining the orientation angle of
%  directional leads for deep brain stimulation using computed tomography 
%  and digital x-ray imaging: A phantom study.
%  Hellerbach et al., Stereotactic and Functional Neurosurgery, 2018, DiODe:
%  Directional Orientation Detection of Segmented Deep Brain Stimulation Leads:
%  A Sequential Algorithm Based on CT Imaging.

clearvars
close all

%% Stuff to fill out

ctpath = ['D:/postop_ct.nii']; % Path to CT (.nii)
elmodel = 'Boston Scientific Vercise Directed'; % Type of directional lead, e.g.:
                                                % 'Boston Scientific Vercise Directed' 
                                                % 'St. Jude Directed 6172 (short)')
                                                % 'St. Jude Directed 6173 (long)'


coordinates.head = [32 -130 60.5];              % CT coordinates of the most ventral electrode
coordinates.tail = [33.6 -126.7 65.3];          % CT coordinates of the most dorsal electrode
coordinates.type = 'mm';                        % Specify whether 'mm' or 'voxel' coordinates
elside = 'right';                                % 'right' or 'left' DBS lead

supervised = 1;                                 % Supervised (1, recommended), or unsupervised (0) algorithm


%%
addpath(['.' filesep 'Ressources']) % for Lead-DBS functions
switch elside
    case 'right'
        elside = 1;
    case 'left'
        elside = 2;
end
roll_out = DiODe_Main(ctpath,elmodel,supervised,coordinates,elside);

if rad2deg(roll_out) < 0
    disp(['The lead has an orientation angle of ' num2str(abs(rad2deg(roll_out)),'%.2f') ' deg to the right with respect to the CTs y-axis.'])
else
    disp(['The lead has an orientation angle of ' num2str(abs(rad2deg(roll_out)),'%.2f') ' deg to the left with respect to the CTs y-axis.'])
end