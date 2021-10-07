function elspec=diode_elspec(elmodel)
% This simple function outputs a cellarray of available electrode specs if
% nargin==0 and exports the current electrode specification if varargin{1}
% is an options struct with options.elmodel defined as a valid name of electrode string.
% __________________________________________________________________________________
% Copyright (C) 2014 Charite University Medicine Berlin, Movement Disorders Unit
% Andreas Horn

switch elmodel    
    case 'Medtronic B33005'
        elspec.matfname='medtronic_b33005';
        elspec.lead_diameter=1.3;
        elspec.lead_color=0.7;
        elspec.contact_length=1.5;
        elspec.contact_diameter=1.3;
        elspec.contact_color=0.3;
        elspec.tip_diameter=1.3;
        elspec.tip_color=0.7;
        elspec.tip_length=0.9;
        elspec.contact_spacing=0.5;
        elspec.numel=8;
        elspec.tipiscontact=0;
        elspec.markerpos = 15.65;
        elspec.markerlen = 2.3;
        elspec.contactnames={'K0 (R)','K1A (R)','K1B (R)','K1C (R)','K2A (R)','K2B (R)','K2C (R)','K3 (R)','K0 (L)','K1A (L)','K1B (L)','K1C (L)','K2A (L)','K2B (L)','K2C (L)','K3 (L)'};
        elspec.isdirected=1;
        elspec.etagenames{1}={'K0 (R)','K1 (R)','K2 (R)','K3 (R)'};
        elspec.etagenames{2}={'K0 (L)','K1 (L)','K2 (L)','K3 (L)'};
        elspec.etageidx={1,2:4,5:7,8};
        elspec.forstimulation=1;
    case 'Medtronic B33015'
        elspec.matfname='medtronic_b33015';
        elspec.lead_diameter=1.3;
        elspec.lead_color=0.7;
        elspec.contact_length=1.5;
        elspec.contact_diameter=1.3;
        elspec.contact_color=0.3;
        elspec.tip_diameter=1.3;
        elspec.tip_color=0.7;
        elspec.tip_length=0.9;
        elspec.contact_spacing=1.5;
        elspec.numel=8;
        elspec.tipiscontact=0;
        elspec.markerpos = 18.65;
        elspec.markerlen = 2.3;
        elspec.contactnames={'K0 (R)','K1A (R)','K1B (R)','K1C (R)','K2A (R)','K2B (R)','K2C (R)','K3 (R)','K0 (L)','K1A (L)','K1B (L)','K1C (L)','K2A (L)','K2B (L)','K2C (L)','K3 (L)'};
        elspec.isdirected=1;
        elspec.etagenames{1}={'K0 (R)','K1 (R)','K2 (R)','K3 (R)'};
        elspec.etagenames{2}={'K0 (L)','K1 (L)','K2 (L)','K3 (L)'};
        elspec.etageidx={1,2:4,5:7,8};
        elspec.forstimulation=1;    
    case 'Boston Scientific Vercise Directed'
        elspec.matfname='boston_vercise_directed';
        elspec.lead_diameter=1.3;
        elspec.lead_color=0.7;
        elspec.contact_length=1.5;
        elspec.contact_diameter=1.3;
        elspec.contact_color=0.3;
        elspec.tip_diameter=1.3;
        elspec.tip_color=0.3;
        elspec.tip_length=1.5;
        elspec.contact_spacing=0.5;
        elspec.numel=8;
        elspec.tipiscontact=1;
        elspec.markerpos = 11;
        elspec.markerlen = 3;
        elspec.contactnames={'K9 (R)','K10 (R)','K11 (R)','K12 (R)','K13 (R)','K14 (R)','K15 (R)','K16 (R)','K1 (L)','K2 (L)','K3 (L)','K4 (L)','K5 (L)','K6 (L)','K7 (L)','K8 (L)'};
        elspec.isdirected=1;
        elspec.etagenames{1}={'K9 (R)','K10-12 (R)','K13-15 (R)','K16 (R)'};
        elspec.etagenames{2}={'K1 (L)','K2-4 (L)','K5-7 (L)','K8 (L)'};
        elspec.etageidx={1,2:4,5:7,8};
        elspec.forstimulation=1;   
    case 'St. Jude Directed 6172 (short)'
        elspec.matfname='stjude_directed_05';
        elspec.lead_diameter=1.27;
        elspec.lead_color=0.7;
        elspec.contact_length=1.5;
        elspec.contact_diameter=1.27;
        elspec.contact_color=0.3;
        elspec.tip_diameter=1.27;
        elspec.tip_color=0.3;
        elspec.tip_length=1;
        elspec.contact_spacing=0.5;
        elspec.numel=8;
        elspec.tipiscontact=0;
        elspec.markerpos = 10.75;
        elspec.markerlen = 1.5;
        elspec.contactnames={'K1 (R)','K2A (R)','K2B (R)','K2C (R)','K3A (R)','K3B (R)','K3C (R)','K4 (R)','K1 (L)','K2A (L)','K2B (L)','K2C (L)','K3A (L)','K3B (L)','K3C (L)','K4 (L)'};
        elspec.isdirected=1;
        elspec.etagenames{1}={'K1 (R)','K2 (R)','K3 (R)','K4 (R)'};
        elspec.etagenames{2}={'K1 (L)','K2 (L)','K3 (L)','K4 (L)'};
        elspec.etageidx={1,2:4,5:7,8};
        elspec.forstimulation=1;
    case 'St. Jude Directed 6173 (long)'
        elspec.matfname='stjude_directed_15';
        elspec.lead_diameter=1.27;
        elspec.lead_color=0.7;
        elspec.contact_length=1.5;
        elspec.contact_diameter=1.27;
        elspec.contact_color=0.3;
        elspec.tip_diameter=1.27;
        elspec.tip_color=0.3;
        elspec.tip_length=1;
        elspec.contact_spacing=1.5;
        elspec.numel=8;
        elspec.tipiscontact=0;
        elspec.markerpos = 13.75;
        elspec.markerlen = 1.5;
        elspec.contactnames={'K1 (R)','K2A (R)','K2B (R)','K2C (R)','K3A (R)','K3B (R)','K3C (R)','K4 (R)','K1 (L)','K2A (L)','K2B (L)','K2C (L)','K3A (L)','K3B (L)','K3C (L)','K4 (L)'};
        elspec.isdirected=1;
        elspec.etagenames{1}={'K1 (R)','K2 (R)','K3 (R)','K4 (R)'};
        elspec.etagenames{2}={'K1 (L)','K2 (L)','K3 (L)','K4 (L)'};
        elspec.etageidx={1,2:4,5:7,8};
        elspec.forstimulation=1;
    otherwise
        error(['No valid electrode name provided!'])
end

if ~isfield(elspec,'eldist') && isa(elspec.contact_spacing, 'cell')
    elspec.eldist=elspec.contact_spacing{2}+elspec.contact_length;
elseif ~isfield(elspec,'eldist')
    elspec.eldist=elspec.contact_spacing+elspec.contact_length;
end
end
