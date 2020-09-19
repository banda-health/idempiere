-- Create new tables for role assignment
create table bh_defaultincludedrole
(
	ad_client_id numeric(10) not null,
	ad_org_id numeric(10) not null,
	bh_defaultincludedrole_id numeric(10) not null,
	bh_defaultincludedrole_uu varchar(36) default NULL::character varying,
	created timestamp default statement_timestamp() not null,
	createdby numeric(10) not null,
	db_usertype char default NULL::bpchar,
	description varchar(255) default NULL::character varying,
	isactive char default 'Y'::bpchar not null,
	name varchar(60) default NULL::character varying,
	updated timestamp default statement_timestamp() not null,
	updatedby numeric(10) not null,
	included_role_id numeric(10) default NULL::numeric,
	constraint bh_defaultincludedrole_key
		primary key (bh_defaultincludedrole_id),
	constraint bh_defaultincludedrole_uu_idx
		unique (bh_defaultincludedrole_uu),
	constraint bh_defaultincludedrole_unique
		unique (db_usertype, included_role_id),
	constraint adclient_bhdefaultincludedrole
		foreign key (ad_client_id) references adempiere.ad_client
			deferrable initially deferred,
	constraint adorg_bhdefaultincludedrole
		foreign key (ad_org_id) references adempiere.ad_org
			deferrable initially deferred,
	constraint includedrole_bhdefaultincluded
		foreign key (included_role_id) references adempiere.ad_role
			deferrable initially deferred,
	constraint bh_defaultincludedrole_isactive_check
		check (isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))
);

-- Insert the data into the table
INSERT INTO bh_defaultincludedrole (ad_client_id, ad_org_id, bh_defaultincludedrole_id, bh_defaultincludedrole_uu, created, createdby, db_usertype, description, isactive, name, updated, updatedby, included_role_id) VALUES (0, 0, 1000001, 'c8b543b5-34fd-4cb2-bf3a-ce15c1bedd49', '2020-09-19 11:20:25.426000', 1001881, 'U', null, 'Y', null, '2020-09-19 11:20:25.426000', 1001881, 1000042);
INSERT INTO bh_defaultincludedrole (ad_client_id, ad_org_id, bh_defaultincludedrole_id, bh_defaultincludedrole_uu, created, createdby, db_usertype, description, isactive, name, updated, updatedby, included_role_id) VALUES (0, 0, 1000002, 'bc47ac63-d54d-4c95-9b5b-fe131d0bcccb', '2020-09-19 11:20:33.686000', 1001881, 'U', null, 'Y', null, '2020-09-19 11:22:02.407000', 1001881, 1000043);
INSERT INTO bh_defaultincludedrole (ad_client_id, ad_org_id, bh_defaultincludedrole_id, bh_defaultincludedrole_uu, created, createdby, db_usertype, description, isactive, name, updated, updatedby, included_role_id) VALUES (0, 0, 1000003, 'fc0bcba3-e82c-418d-baa5-080cc2e98412', '2020-09-19 11:22:12.316000', 1001881, 'U', null, 'Y', null, '2020-09-19 11:22:12.316000', 1001881, 1000046);
INSERT INTO bh_defaultincludedrole (ad_client_id, ad_org_id, bh_defaultincludedrole_id, bh_defaultincludedrole_uu, created, createdby, db_usertype, description, isactive, name, updated, updatedby, included_role_id) VALUES (0, 0, 1000004, 'afeda28d-9c97-4d6b-aa92-1344c9555a16', '2020-09-19 11:22:15.985000', 1001881, 'U', null, 'Y', null, '2020-09-19 11:22:15.985000', 1001881, 1000041);
INSERT INTO bh_defaultincludedrole (ad_client_id, ad_org_id, bh_defaultincludedrole_id, bh_defaultincludedrole_uu, created, createdby, db_usertype, description, isactive, name, updated, updatedby, included_role_id) VALUES (0, 0, 1000005, '2f7caf0f-7a82-481e-a0c4-1d877e0b22a0', '2020-09-19 11:22:18.096000', 1001881, 'U', null, 'Y', null, '2020-09-19 11:22:18.096000', 1001881, 1000038);
INSERT INTO bh_defaultincludedrole (ad_client_id, ad_org_id, bh_defaultincludedrole_id, bh_defaultincludedrole_uu, created, createdby, db_usertype, description, isactive, name, updated, updatedby, included_role_id) VALUES (0, 0, 1000006, '98e5a777-4e17-41be-9d3e-ffcf399d13d1', '2020-09-19 11:22:20.248000', 1001881, 'U', null, 'Y', null, '2020-09-19 11:22:20.248000', 1001881, 1000037);
INSERT INTO bh_defaultincludedrole (ad_client_id, ad_org_id, bh_defaultincludedrole_id, bh_defaultincludedrole_uu, created, createdby, db_usertype, description, isactive, name, updated, updatedby, included_role_id) VALUES (0, 0, 1000007, '75431677-d1b3-4248-b5d5-2a35873aacbf', '2020-09-19 11:22:22.407000', 1001881, 'U', null, 'Y', null, '2020-09-19 11:22:22.407000', 1001881, 1000044);
INSERT INTO bh_defaultincludedrole (ad_client_id, ad_org_id, bh_defaultincludedrole_id, bh_defaultincludedrole_uu, created, createdby, db_usertype, description, isactive, name, updated, updatedby, included_role_id) VALUES (0, 0, 1000008, 'bac3cb89-097c-47ee-a75d-2bde3314d12a', '2020-09-19 11:22:27.295000', 1001881, 'U', null, 'Y', null, '2020-09-19 11:22:27.295000', 1001881, 1000039);
INSERT INTO bh_defaultincludedrole (ad_client_id, ad_org_id, bh_defaultincludedrole_id, bh_defaultincludedrole_uu, created, createdby, db_usertype, description, isactive, name, updated, updatedby, included_role_id) VALUES (0, 0, 1000009, '63fe035c-c6c3-4872-a4b8-3f3f4ff19a3d', '2020-09-19 11:22:31.847000', 1001881, 'U', null, 'Y', null, '2020-09-19 11:22:31.847000', 1001881, 1000045);
INSERT INTO bh_defaultincludedrole (ad_client_id, ad_org_id, bh_defaultincludedrole_id, bh_defaultincludedrole_uu, created, createdby, db_usertype, description, isactive, name, updated, updatedby, included_role_id) VALUES (0, 0, 1000010, '9f5e25b8-b239-4d53-ad43-6e49f8024130', '2020-09-19 11:22:34.939000', 1001881, 'U', null, 'Y', null, '2020-09-19 11:22:34.939000', 1001881, 1000036);
INSERT INTO bh_defaultincludedrole (ad_client_id, ad_org_id, bh_defaultincludedrole_id, bh_defaultincludedrole_uu, created, createdby, db_usertype, description, isactive, name, updated, updatedby, included_role_id) VALUES (0, 0, 1000011, '01632c4f-408c-4062-afeb-9a7b9d2b7076', '2020-09-19 11:22:38.292000', 1001881, 'U', null, 'Y', null, '2020-09-19 11:22:38.292000', 1001881, 1000112);
INSERT INTO bh_defaultincludedrole (ad_client_id, ad_org_id, bh_defaultincludedrole_id, bh_defaultincludedrole_uu, created, createdby, db_usertype, description, isactive, name, updated, updatedby, included_role_id) VALUES (0, 0, 1000012, 'd1aa6165-7635-44c9-833b-96cf3ddeb544', '2020-09-19 11:22:41.459000', 1001881, 'U', null, 'Y', null, '2020-09-19 11:22:41.459000', 1001881, 1000093);
INSERT INTO bh_defaultincludedrole (ad_client_id, ad_org_id, bh_defaultincludedrole_id, bh_defaultincludedrole_uu, created, createdby, db_usertype, description, isactive, name, updated, updatedby, included_role_id) VALUES (0, 0, 1000013, '878e3203-87e9-4de9-a54a-28636d8571f2', '2020-09-19 11:22:44.856000', 1001881, 'U', null, 'Y', null, '2020-09-19 11:22:44.856000', 1001881, 1000104);
INSERT INTO bh_defaultincludedrole (ad_client_id, ad_org_id, bh_defaultincludedrole_id, bh_defaultincludedrole_uu, created, createdby, db_usertype, description, isactive, name, updated, updatedby, included_role_id) VALUES (0, 0, 1000014, 'c4cb401d-8ce4-4e28-89ec-1c3c4e70c940', '2020-09-19 11:22:48.208000', 1001881, 'U', null, 'Y', null, '2020-09-19 11:22:48.208000', 1001881, 1000099);
INSERT INTO bh_defaultincludedrole (ad_client_id, ad_org_id, bh_defaultincludedrole_id, bh_defaultincludedrole_uu, created, createdby, db_usertype, description, isactive, name, updated, updatedby, included_role_id) VALUES (0, 0, 1000015, '4e9ced11-a0da-4a99-9cc3-7315d2796145', '2020-09-19 11:22:50.565000', 1001881, 'U', null, 'Y', null, '2020-09-19 11:22:50.565000', 1001881, 1000098);
INSERT INTO bh_defaultincludedrole (ad_client_id, ad_org_id, bh_defaultincludedrole_id, bh_defaultincludedrole_uu, created, createdby, db_usertype, description, isactive, name, updated, updatedby, included_role_id) VALUES (0, 0, 1000016, '0361647a-31b6-40fb-917b-16c9bc354832', '2020-09-19 11:22:52.913000', 1001881, 'U', null, 'Y', null, '2020-09-19 11:22:52.913000', 1001881, 1000103);
INSERT INTO bh_defaultincludedrole (ad_client_id, ad_org_id, bh_defaultincludedrole_id, bh_defaultincludedrole_uu, created, createdby, db_usertype, description, isactive, name, updated, updatedby, included_role_id) VALUES (0, 0, 1000017, '89c3c6ca-56e1-4b56-9c95-30f5e5c3fafe', '2020-09-19 11:22:55.659000', 1001881, 'U', null, 'Y', null, '2020-09-19 11:22:55.659000', 1001881, 1000100);
INSERT INTO bh_defaultincludedrole (ad_client_id, ad_org_id, bh_defaultincludedrole_id, bh_defaultincludedrole_uu, created, createdby, db_usertype, description, isactive, name, updated, updatedby, included_role_id) VALUES (0, 0, 1000018, '6b78c9ce-a3c7-46bf-9397-4eec8609b7fa', '2020-09-19 11:22:58.857000', 1001881, 'U', null, 'Y', null, '2020-09-19 11:22:58.857000', 1001881, 1000094);
INSERT INTO bh_defaultincludedrole (ad_client_id, ad_org_id, bh_defaultincludedrole_id, bh_defaultincludedrole_uu, created, createdby, db_usertype, description, isactive, name, updated, updatedby, included_role_id) VALUES (0, 0, 1000020, '1717a7cd-d439-4621-9d84-61c21af03dff', '2020-09-19 11:23:05.939000', 1001881, 'U', null, 'Y', null, '2020-09-19 11:23:05.939000', 1001881, 1000095);
INSERT INTO bh_defaultincludedrole (ad_client_id, ad_org_id, bh_defaultincludedrole_id, bh_defaultincludedrole_uu, created, createdby, db_usertype, description, isactive, name, updated, updatedby, included_role_id) VALUES (0, 0, 1000021, '4cb4dfaf-0fff-4c30-81d2-3aad281f7c42', '2020-09-19 11:23:08.641000', 1001881, 'U', null, 'Y', null, '2020-09-19 11:23:08.641000', 1001881, 1000097);
INSERT INTO bh_defaultincludedrole (ad_client_id, ad_org_id, bh_defaultincludedrole_id, bh_defaultincludedrole_uu, created, createdby, db_usertype, description, isactive, name, updated, updatedby, included_role_id) VALUES (0, 0, 1000022, '69f7702e-223e-4efd-b557-8e0ca5c49dc9', '2020-09-19 11:23:11.003000', 1001881, 'U', null, 'Y', null, '2020-09-19 11:23:11.003000', 1001881, 1000111);
INSERT INTO bh_defaultincludedrole (ad_client_id, ad_org_id, bh_defaultincludedrole_id, bh_defaultincludedrole_uu, created, createdby, db_usertype, description, isactive, name, updated, updatedby, included_role_id) VALUES (0, 0, 1000023, '008ef1b6-6695-4cff-9971-84e6f47045b4', '2020-09-19 11:23:13.716000', 1001881, 'U', null, 'Y', null, '2020-09-19 11:23:13.716000', 1001881, 1000096);
INSERT INTO bh_defaultincludedrole (ad_client_id, ad_org_id, bh_defaultincludedrole_id, bh_defaultincludedrole_uu, created, createdby, db_usertype, description, isactive, name, updated, updatedby, included_role_id) VALUES (0, 0, 1000024, 'ca506afa-0113-414a-b7c3-4495d46f7d8d', '2020-09-19 11:23:18.107000', 1001881, 'A', null, 'Y', null, '2020-09-19 11:23:18.107000', 1001881, 1000047);

-- Insert a record into AD_Sequence
INSERT INTO ad_sequence (ad_sequence_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, vformat, isautosequence, incrementno, startno, currentnext, currentnextsys, isaudited, istableid, prefix, suffix, startnewyear, datecolumn, decimalpattern, ad_sequence_uu, startnewmonth, isorglevelsequence, orgcolumn) VALUES ((SELECT currentnext FROM ad_sequence WHERE name = 'AD_Sequence'), 0, 0, 'Y', '2020-09-19 10:49:44.368000', 1001881, '2020-09-19 10:49:44.368000', 1001881, 'BH_DefaultIncludedRole', 'Table BH_DefaultIncludedRole', null, 'Y', 1, 1000000, 1000025, 200000, 'N', 'Y', null, null, 'N', null, null, 'c959e1f4-ecb2-4695-9586-d8c6be6515ed', 'N', 'N', null);

-- Update the sequence # so the correct next ID can be inserted
UPDATE ad_sequence
SET currentnext = currentnext + 1
WHERE name = 'AD_Sequence';

SELECT register_migration_script('202009171538_GO-1319.sql') FROM dual;
