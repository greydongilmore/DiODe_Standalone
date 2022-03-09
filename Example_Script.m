clear
close all
clc
%% exampleinputs
% ctpath: full path to postoperative ct-file in either .nii or .nii.gz format

ctpath='/home/greydon/data/data/DBS/derivatives/trajGuide/derivatives/sub-231/source/sub-P231_ses-post_acq-Electrode_run-01_ct.nii.gz';
myside = 1;
head_mm_initial = [15.036,-24.577,51.102]
tail_mm_initial = [21.369,-8.614,72.443]

myside = 2;
head_mm_initial = [-5.482,-25.054,51.622]
tail_mm_initial = [-15.636,-11.433,72.096]

% head_mm: coordinates in mm (RAS-convention) of the tip/ventral contact of the
% electrode as seen in the CT

% tail_mm: coordinates in mm (RAS-convention) of a second, more dorsal point on the
% electrode trajectory, preferably within the stiff part of the electrode

% myside: 1 = right hemisphere; 2 = left hemisphere

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
[roll_y,y,roll_y_deg] = diode_standalone(ctpath, head_mm_initial, tail_mm_initial, myside, elmodel);