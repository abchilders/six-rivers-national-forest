/* Group 3A */

-- This is the base table for Forest Resource entity class.

drop table Forest_Resource cascade constraints;

create table Forest_Resource 
(internal_id	integer,
 resource_type	varchar2(8)	check(resource_type in ('road', 'rec_area')) not null,
 primary key(internal_id) 
);
 
 -- This is the base table for the Rec Area entity class.
 
drop table Rec_Area cascade constraints;

create table Rec_Area
(fid				integer, 
 internal_id			integer,
 recareanam			varchar2(140), 
 longitude			float, 
 latitude			float, 
 recareaurl			varchar2(4000),
 feedescrip			varchar2(4000),
 open_season_start		varchar2(20),
 operational_hours		varchar2(140), 
 open_season_end		varchar2(20),
 forestname			varchar2(140), 
 reservation_info		varchar2(4000),
 markertype			varchar2(4000),
 markeractivity			varchar2(140), 
 markeractivitygroup		varchar2(140),
 recareadescription		varchar2(4000),
 restrictions			varchar2(4000),
 recareaid                      integer         unique, 
 recportal_unit_key		integer, 
 forestorgcode			integer,
 infra_cn			float, 
 spotlightdisplay		char		check(spotlightdisplay in ('Y', 'N')),
 attractiondisplay		char		check(attractiondisplay in ('Y', 'N')), 
 accessibility			char		check(accessibility in ('Y', 'N')),
 openstatus			varchar2(6)	check(openstatus in ('none', 'closed', 'open')),
 primary key (internal_id),
 foreign key (internal_id) references Forest_Resource
);
 
 -- Table containing multivalued attribute "activities" 
 -- for the Rec Area entity class. 

drop table Rec_Area_Activities cascade constraints; 

create table Rec_Area_Activities 
(internal_id 	integer, 
 activity 	varchar2(30),
 primary key (internal_id, activity),
 foreign key (internal_id) references Rec_Area
);

-- This is the base table for the Road entity class. 

drop table Road cascade constraints; 

create table Road
(id					varchar2(10), 
 internal_id				integer, 
 is_motor_vehicle_use_road		char		check(is_motor_vehicle_use_road in('y', 'n')) not null, 
 is_national_forest_system_road		char		check(is_national_forest_system_road in('y', 'n')) not null,	
 adminorg				integer, 
 bmp					float, 
 emp					float, 
 fid					integer, 
 gis_miles				float, 
 globalid				varchar2(140), 
 jurisdicti				varchar2(30), 
 name					varchar2(140), 
 oper_maint				varchar2(140),
 route_stat				varchar2(140), 
 rte_cn					float, 
 security_id				integer, 
 seg_length				float, 
 shape_len				float, 
 surface_type				varchar2(140),
 system					varchar2(140),
 primary key (internal_id), 
 foreign key (internal_id) references Forest_Resource
);

-- This is the base table for the Motor Vehicle Use Road entity class, subclass
-- of Road. 

drop table Motor_Vehicle_Use_Road cascade constraints; 

create table Motor_Vehicle_Use_Road
(internal_id		integer, 
 atv			varchar2(6)	check(atv in ('open', 'closed')), 
 atv_dateso		varchar2(20), 
 bus			varchar2(6)	check(bus in ('open', 'closed')),  
 bus_dateso		varchar2(20), 
 districtna		varchar2(140),
 field_id		varchar2(5), 
 forestname		varchar2(140), 
 fourwd_gt5		varchar2(6)	check(fourwd_gt5 in ('open', 'closed')),
 fourwd_g_1		varchar2(20),   
 highcleara		varchar2(6)	check(highcleara in ('open', 'closed')),
 highclea_1		varchar2(20),
 motorcycle		varchar2(6)	check(motorcycle in ('open', 'closed')),
 motorcyc_1		varchar2(20),  
 motorhome		varchar2(6)	check(motorhome in ('open', 'closed')), 
 motorhome_		varchar2(20), 
 other_oh_1		varchar2(6)	check(other_oh_1 in ('open', 'closed')), 
 other_oh_2		varchar2(20),
 other_ohv_		varchar2(6)	check(other_ohv_ in ('open', 'closed')), 
 other_ohv1		varchar2(20),
 otherwheel		varchar2(6)	check(otherwheel in ('open', 'closed')),	
 otherwhe_1		varchar2(20),  
 passengerv		varchar2(6)	check(passengerv in ('open', 'closed')),
 passenge_1		varchar2(20),  
 sbs_symbol		varchar2(140),
 seasonal		varchar2(8), 
 symbol			integer, 
 ta_symbol		integer, 
 tracked_oh		varchar2(6)	check(tracked_oh in ('open', 'closed')),
 tracked__1		varchar2(20), 
 tracked__2		varchar2(6)	check(tracked__2 in ('open', 'closed')), 
 tracked__3		varchar2(20), 
 truck			varchar2(6)	check(truck in ('open', 'closed')), 
 truck_date		varchar2(20), 
 twowd_gt50		varchar2(6)	check(twowd_gt50 in ('open', 'closed')),
 twowd_gt_1		varchar2(20), 
 primary key (internal_id), 
 foreign key (internal_id) references Road
);

-- This is the base table for the National Forest System Road entity class, 
-- subclass of Road. 

drop table National_Forest_System_Road cascade constraints; 

create table National_Forest_System_Road 
(internal_id		integer, 
 congressio		varchar2(140), 
 county			varchar2(30), 
 functional		varchar2(30), 
 ivm_symbol		varchar2(140),
 lanes			varchar2(140), 
 level_of_s		varchar2(140), 
 loc_error		varchar2(10), 
 managing_o		integer, 
 objective_		varchar2(140), 
 openforuse		varchar2(5),
 psfr_class		varchar2(140), 
 primary_ma		varchar2(140), 
 service_li		varchar2(140), 
 symbol_cod		integer, 
 symbol_nam		varchar2(140),
 primary key (internal_id), 
 foreign key (internal_id) references Road
);

-- This is the base table for the Survey entity class.

drop table Survey cascade constraints; 

create table Survey
(survey_id	integer, 
 name		varchar2(100)	not null, 
 date_of_visit	date		not null, 
 surveyor_name	varchar2(100)	not null, 
 email		varchar2(100), 
 description	varchar2(4000),
 internal_id	integer		not null,
 primary key (survey_id), 
 foreign key (internal_id) references Forest_Resource 
);

-- This is the table containing multivalued attribute "images" for the Survey 
-- entity class. 

drop table Survey_Images cascade constraints; 

create table Survey_Images
(survey_id	integer, 
 image		varchar2(4000),
 primary key (survey_id, image),
 foreign key (survey_id) references Survey
);

-- This is the base table for the Rec Area Survey entity class, subclass of 
-- Survey. 

drop table Rec_Area_Survey cascade constraints; 

create table Rec_Area_Survey 
(survey_id			integer, 
 rec_area_condition		varchar2(30)	check(rec_area_condition in ('Good', 'Needs some work', 'Bad', 'Non-existent')) not null, 
 water_source_condition		varchar2(30)	check(water_source_condition in ('Dry', 'Stagnant', 'Trickle', 'Flowing', 'N/A')) not null,
 water_source_details		varchar2(4000), 
 weather_and_temperature	varchar2(4000),
 primary key (survey_id),
 foreign key (survey_id) references Survey
);

-- This is the base table for the Road Survey entity class, subclass of Survey.  

drop table Road_Survey cascade constraints; 

create table Road_Survey 
(survey_id			integer, 
 mode_of_transportation		varchar(30)	not null,
 road_condition			varchar(40)	check(road_condition in ('Good shape and easy to follow', 'Needs some work', 'Hard to follow', 'Non-existent')) not null,
 primary key (survey_id),
 foreign key (survey_id) references Survey
);
