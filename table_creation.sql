
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
 foreign key (internal_id) references Forest_Resource);
