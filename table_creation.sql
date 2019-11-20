
/*Group 3A*/

-- This is the base table for Forest Resource entity class

drop table Forest_Resource cascade constraints;

create table Forest_Resource 
(internal_id	integer,
 resource_type	varchar2(8)	check(resource_type in ('road', 'rec_area')) not null,
 primary key(internal_id) );
 
 -- This is the base table for the Rec Area entity class
 
drop table Rec_Area cascade constraints;

create table Rec_Area
(recareaid	integer, 
 internal_id	integer,
 objectid	, 
 recareaname, 
 longitude, 
 latitude, 
 recareaurl,
 feedescription,
 open_season_start,
 operational_hours, 
 open_season_end,
 forestname, 
 reservation_info,
 markertype,
 markeractivity, 
 markeractivitygroup,
 recareadescription,
 restrictions, 
 recportal_unit_key, 
 forestorgcode,
 infra_cn, 
 shape, 
 spotlightdisplay,
 attractiondisplay, 
 accessibility,
 openstatus,
 primary key (recareaid),
 foreign key (internal_id) references Forest_Resource);
