clear
close all
clc
%% exampleinputs
% ctpath: full path to postoperative ct-file in either .nii or .nii.gz format
ctpath = 'C:\Patient1\postop_ct.nii';
% head_mm: coordinates in mm (RAS-convention) of the tip/ventral contact of the
% electrode as seen in the CT
head_mm = [12 -10 0];
% tail_mm: coordinates in mm (RAS-convention) of a second, more dorsal point on the
% electrode trajectory, preferably within the stiff part of the electrode
tail_mm = [14 -7 8];
% myside: 1 = right hemisphere; 2 = left hemisphere
myside = 1;
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
[roll_y,y,roll_y_deg] = diode_standalone(ctpath, head_mm, tail_mm, myside, elmodel);