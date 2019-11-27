/*Group 3A*/

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
(recareaid	integer, 
 internal_id	integer,
 objectid	integer, 
 recareaname	varchar2(25), 
 longitude	integer, 
 latitude	integer, 
 recareaurl	varchar2(25) //maybe?,
 feedescription	varchar2(25),
 open_season_start	date,
 operational_hours	varchar2(25), 
 open_season_end	date,
 forestname	varchar2(25), 
 reservation_info	varchar2(25),
 markertype	//idk what to put here,
 markeractivity	varchar2(18), 
 markeractivitygroup	varchar2(23),
 recareadescription	varchar2(//it has a lot of paragraphs),
 restrictions	varchar2(//idk a lot of points here), 
 recportal_unit_key, 
 forestorgcode,
 infra_cn, 
 shape, 
 spotlightdisplay	char,
 attractiondisplay	char, 
 accessibility	varchar2(3) // going to assume this is a yes and no ,
 openstatus	varchar2(6),
 primary key (recareaid),
 foreign key (internal_id) references Forest_Resource
);
 
 -- Table containing multivalued attribute "activities" 
 -- for the Rec Area entity class. 

drop table Rec_Area_Activities cascade constraints; 

create table Rec_Area_Activities 
(recareaid integer, 
 activity varchar2(30),
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

-- This is the base table for the Survey entity class. TODO: define data types

drop table Survey cascade constraints; 

create table Survey
(survey_id, 
 name, 
 date_of_visit, 
 surveyor_name, 
 email, 
 description,
 internal_id,
 primary key (survey_id), 
 foreign key (internal_id) references Forest_Resource 
);

-- This is the table containing multivalued attribute "images" for the Survey 
-- entity class. TODO: define data types

drop table Survey_Images cascade constraints; 

create table Survey_Images
(survey_id, 
 image,
 primary key (survey_id, image),
 foreign key (survey_id) references Survey
);

-- This is the base table for the Rec Area Survey entity class, subclass of 
-- Survey. TODO: define data types 

drop table Rec_Area_Survey cascade constraints; 

create table Rec_Area_Survey 
(survey_id, 
 rec_area_condition, 
 water_source_condition,
 water_source_details, 
 weather_and_temperature,
 primary key (survey_id),
 foreign key (survey_id) references Survey
);

-- This is the base table for the Road Survey entity class, subclass of Survey. 
-- TODO: define data types 

drop table Road_Survey cascade constraints; 

create table Road_Survey 
(survey_id, 
 mode_of_transportation,
 road_condition,
 primary key (survey_id),
 foreign key (survey_id) references Survey
);