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
(recareaid				integer, 
 internal_id			integer,
 recareanam				varchar2(140), 
 longitude				float, 
 latitude				float, 
 recareaurl				varchar2(MAX),
 feedescrip				varchar2(140),
 open_season_start		date,
 operational_hours		varchar2(140), 
 open_season_end		date,
 forestname				varchar2(25), 
 reservation_info		varchar2(140),
 markertype				varchar2(MAX),
 markeractivity			varchar2(140), 
 markeractivitygroup	varchar2(140),
 recareadescription		varchar2(MAX),
 restrictions			varchar2(MAX), 
 recportal_unit_key		integer, 
 forestorgcode			integer,
 infra_cn				float, 
 spotlightdisplay		char	check(spotlightdisplay in ('Y', 'N')),
 attractiondisplay		char	check(attractiondisplay in ('Y', 'N')), 
 accessibility			char	check(attractiondisplay in ('Y', 'N')),
 openstatus				varchar2(6)	check(openstatus in ('none', 'closed', 'open')),
 primary key (recareaid),
 foreign key (internal_id) references Forest_Resource
);
 
 -- Table containing multivalued attribute "activities" 
 -- for the Rec Area entity class. 

drop table Rec_Area_Activities cascade constraints; 

create table Rec_Area_Activities 
(recareaid 	integer, 
 activity 	varchar2(30),
 primary key (recareaid, activity),
 foreign key (recareaid) references Rec_Area
);

-- This is the base table for the Road entity class. TODO: define data types

drop table Road cascade constraints; 

create table Road
(id, 
 internal_id, 
 is_motor_vehicle_use_road, 
 is_national_forest_system_road,
 adminorg, 
 bmp, 
 emp, 
 fid, 
 gis_miles, 
 globalid, 
 jurisdicti, 
 name, 
 oper_maint,
 route_stat, 
 rte_cn, 
 security_id, 
 seg_length, 
 shape_len, 
 surface_type,
 system,
 primary key (id), 
 foreign key (internal_id) references Forest_resource
);

-- This is the base table for the Motor Vehicle Use Road entity class, subclass
-- of Road. TODO: define data types 

drop table Motor_Vehicle_Use_Road cascade constraints; 

create table Motor_Vehicle_Use_Road
(id, 
 internal_id, 
 atv, 
 atv_dateso, 
 bus, 
 bus_dateso, 
 districtna,
 field_id, 
 forestname, 
 fourwd_g_1, 
 fourwd_gt5, 
 highclea_1, 
 highcleara,
 motorcyc_1, 
 motorcycle, 
 motorhome, 
 motorhome_, 
 other_oh_1, 
 other_oh_2,
 other_ohv_, 
 otherwhe_1, 
 otherwheel, 
 passenge_1, 
 passengerv, 
 sbs_symbol,
 seasonal, 
 symbol, 
 ta_symbol, 
 tracked__1, 
 tracked__2, 
 tracked__3, 
 tracked_oh,
 truck, 
 truck_date, 
 twowd_gt_1, 
 twowd_gt50,
 primary key (id),
 foreign key (id) references Road, 
 foreign key (internal_id) references Road
);

-- This is the base table for the National Forest System Road entity class, 
-- subclass of Road. TODO: define data types 

drop table National_Forest_System_Road cascade constraints; 

create table National_Forest_System_Road
(id, 
 internal_id, 
 congressio, 
 county, 
 functional, 
 ivm_symbol,
 lanes, 
 level_of_s, 
 loc_error, 
 managing_o, 
 objective_, 
 openforuse,
 psfr_class, 
 primary_ma, 
 service_li, 
 symbol_cod, 
 symbol_nam,
 primary key (id), 
 foreign key (id) references Road, 
 foreign key (internal_id) references Road
);

-- This is the base table for the Survey entity class.

drop table Survey cascade constraints; 

create table Survey
(survey_id		integer, 
 name			varchar2(30)	not null, 
 date_of_visit	date			not null, 
 surveyor_name	varchar2(30)	not null, 
 email			varchar2(30), 
 description	varchar2(MAX),
 internal_id	integer			not null,
 primary key (survey_id), 
 foreign key (internal_id) references Forest_Resource 
);

-- This is the table containing multivalued attribute "images" for the Survey 
-- entity class. 

drop table Survey_Images cascade constraints; 

create table Survey_Images
(survey_id	integer, 
 image		varchar2(MAX),
 primary key (survey_id, image),
 foreign key (survey_id) references Survey
);

-- This is the base table for the Rec Area Survey entity class, subclass of 
-- Survey. 

drop table Rec_Area_Survey cascade constraints; 

create table Rec_Area_Survey 
(survey_id					integer, 
 rec_area_condition			varchar2(30)	check(rec_area_condition in ('Good', 'Needs some work', 'Bad', 'Non-existent')) not null, 
 water_source_condition		varchar2(30)	check(water_source_condition in ('Dry', 'Stagnant', 'Trickle', 'Flowing', 'N/A')) not null,
 water_source_details		varchar2(MAX), 
 weather_and_temperature	varchar2(MAX),
 primary key (survey_id),
 foreign key (survey_id) references Survey
);

-- This is the base table for the Road Survey entity class, subclass of Survey.  

drop table Road_Survey cascade constraints; 

create table Road_Survey 
(survey_id					integer, 
 mode_of_transportation		varchar(30)	not null,
 road_condition				varchar(40)	check(road_condition in ('Good shape and easy to follow', 'Needs some work', 'Hard to follow', 'Non-existent')) not null,
 primary key (survey_id),
 foreign key (survey_id) references Survey
);