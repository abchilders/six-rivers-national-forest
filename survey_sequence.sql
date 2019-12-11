prompt ===
prompt Creating sequence to generate unique Survey IDs. 
prompt ===

drop sequence survey_id_seq;

create sequence survey_id_seq
minvalue 0
start with 0;
