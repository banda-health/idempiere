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
INSERT INTO bh_defaultincludedrole (ad_client_id, ad_org_id, bh_defaultincludedrole_id, bh_defaultincludedrole_uu, createdby, db_usertype, description, isactive, name, updatedby, included_role_id) VALUES (0, 0, 1000001, 'c8b543b5-34fd-4cb2-bf3a-ce15c1bedd49', 1001875, 'U', null, 'Y', null, 1001875, 1000042);
INSERT INTO bh_defaultincludedrole (ad_client_id, ad_org_id, bh_defaultincludedrole_id, bh_defaultincludedrole_uu, createdby, db_usertype, description, isactive, name, updatedby, included_role_id) VALUES (0, 0, 1000002, 'bc47ac63-d54d-4c95-9b5b-fe131d0bcccb', 1001875, 'U', null, 'Y', null, 1001875, 1000043);
INSERT INTO bh_defaultincludedrole (ad_client_id, ad_org_id, bh_defaultincludedrole_id, bh_defaultincludedrole_uu, createdby, db_usertype, description, isactive, name, updatedby, included_role_id) VALUES (0, 0, 1000003, 'fc0bcba3-e82c-418d-baa5-080cc2e98412', 1001875, 'U', null, 'Y', null, 1001875, 1000046);
INSERT INTO bh_defaultincludedrole (ad_client_id, ad_org_id, bh_defaultincludedrole_id, bh_defaultincludedrole_uu, createdby, db_usertype, description, isactive, name, updatedby, included_role_id) VALUES (0, 0, 1000004, 'afeda28d-9c97-4d6b-aa92-1344c9555a16', 1001875, 'U', null, 'Y', null, 1001875, 1000041);
INSERT INTO bh_defaultincludedrole (ad_client_id, ad_org_id, bh_defaultincludedrole_id, bh_defaultincludedrole_uu, createdby, db_usertype, description, isactive, name, updatedby, included_role_id) VALUES (0, 0, 1000005, '2f7caf0f-7a82-481e-a0c4-1d877e0b22a0', 1001875, 'U', null, 'Y', null, 1001875, 1000038);
INSERT INTO bh_defaultincludedrole (ad_client_id, ad_org_id, bh_defaultincludedrole_id, bh_defaultincludedrole_uu, createdby, db_usertype, description, isactive, name, updatedby, included_role_id) VALUES (0, 0, 1000006, '98e5a777-4e17-41be-9d3e-ffcf399d13d1', 1001875, 'U', null, 'Y', null, 1001875, 1000037);
INSERT INTO bh_defaultincludedrole (ad_client_id, ad_org_id, bh_defaultincludedrole_id, bh_defaultincludedrole_uu, createdby, db_usertype, description, isactive, name, updatedby, included_role_id) VALUES (0, 0, 1000007, '75431677-d1b3-4248-b5d5-2a35873aacbf', 1001875, 'U', null, 'Y', null, 1001875, 1000044);
INSERT INTO bh_defaultincludedrole (ad_client_id, ad_org_id, bh_defaultincludedrole_id, bh_defaultincludedrole_uu, createdby, db_usertype, description, isactive, name, updatedby, included_role_id) VALUES (0, 0, 1000008, 'bac3cb89-097c-47ee-a75d-2bde3314d12a', 1001875, 'U', null, 'Y', null, 1001875, 1000039);
INSERT INTO bh_defaultincludedrole (ad_client_id, ad_org_id, bh_defaultincludedrole_id, bh_defaultincludedrole_uu, createdby, db_usertype, description, isactive, name, updatedby, included_role_id) VALUES (0, 0, 1000009, '63fe035c-c6c3-4872-a4b8-3f3f4ff19a3d', 1001875, 'U', null, 'Y', null, 1001875, 1000045);
INSERT INTO bh_defaultincludedrole (ad_client_id, ad_org_id, bh_defaultincludedrole_id, bh_defaultincludedrole_uu, createdby, db_usertype, description, isactive, name, updatedby, included_role_id) VALUES (0, 0, 1000010, '9f5e25b8-b239-4d53-ad43-6e49f8024130', 1001875, 'U', null, 'Y', null, 1001875, 1000036);
INSERT INTO bh_defaultincludedrole (ad_client_id, ad_org_id, bh_defaultincludedrole_id, bh_defaultincludedrole_uu, createdby, db_usertype, description, isactive, name, updatedby, included_role_id) VALUES (0, 0, 1000011, '01632c4f-408c-4062-afeb-9a7b9d2b7076', 1001875, 'U', null, 'Y', null, 1001875, 1000112);
INSERT INTO bh_defaultincludedrole (ad_client_id, ad_org_id, bh_defaultincludedrole_id, bh_defaultincludedrole_uu, createdby, db_usertype, description, isactive, name, updatedby, included_role_id) VALUES (0, 0, 1000012, 'd1aa6165-7635-44c9-833b-96cf3ddeb544', 1001875, 'U', null, 'Y', null, 1001875, 1000093);
INSERT INTO bh_defaultincludedrole (ad_client_id, ad_org_id, bh_defaultincludedrole_id, bh_defaultincludedrole_uu, createdby, db_usertype, description, isactive, name, updatedby, included_role_id) VALUES (0, 0, 1000013, '878e3203-87e9-4de9-a54a-28636d8571f2', 1001875, 'U', null, 'Y', null, 1001875, 1000104);
INSERT INTO bh_defaultincludedrole (ad_client_id, ad_org_id, bh_defaultincludedrole_id, bh_defaultincludedrole_uu, createdby, db_usertype, description, isactive, name, updatedby, included_role_id) VALUES (0, 0, 1000014, 'c4cb401d-8ce4-4e28-89ec-1c3c4e70c940', 1001875, 'U', null, 'Y', null, 1001875, 1000099);
INSERT INTO bh_defaultincludedrole (ad_client_id, ad_org_id, bh_defaultincludedrole_id, bh_defaultincludedrole_uu, createdby, db_usertype, description, isactive, name, updatedby, included_role_id) VALUES (0, 0, 1000015, '4e9ced11-a0da-4a99-9cc3-7315d2796145', 1001875, 'U', null, 'Y', null, 1001875, 1000098);
INSERT INTO bh_defaultincludedrole (ad_client_id, ad_org_id, bh_defaultincludedrole_id, bh_defaultincludedrole_uu, createdby, db_usertype, description, isactive, name, updatedby, included_role_id) VALUES (0, 0, 1000016, '0361647a-31b6-40fb-917b-16c9bc354832', 1001875, 'U', null, 'Y', null, 1001875, 1000103);
INSERT INTO bh_defaultincludedrole (ad_client_id, ad_org_id, bh_defaultincludedrole_id, bh_defaultincludedrole_uu, createdby, db_usertype, description, isactive, name, updatedby, included_role_id) VALUES (0, 0, 1000017, '89c3c6ca-56e1-4b56-9c95-30f5e5c3fafe', 1001875, 'U', null, 'Y', null, 1001875, 1000100);
INSERT INTO bh_defaultincludedrole (ad_client_id, ad_org_id, bh_defaultincludedrole_id, bh_defaultincludedrole_uu, createdby, db_usertype, description, isactive, name, updatedby, included_role_id) VALUES (0, 0, 1000018, '6b78c9ce-a3c7-46bf-9397-4eec8609b7fa', 1001875, 'U', null, 'Y', null, 1001875, 1000094);
INSERT INTO bh_defaultincludedrole (ad_client_id, ad_org_id, bh_defaultincludedrole_id, bh_defaultincludedrole_uu, createdby, db_usertype, description, isactive, name, updatedby, included_role_id) VALUES (0, 0, 1000020, '1717a7cd-d439-4621-9d84-61c21af03dff', 1001875, 'U', null, 'Y', null, 1001875, 1000095);
INSERT INTO bh_defaultincludedrole (ad_client_id, ad_org_id, bh_defaultincludedrole_id, bh_defaultincludedrole_uu, createdby, db_usertype, description, isactive, name, updatedby, included_role_id) VALUES (0, 0, 1000021, '4cb4dfaf-0fff-4c30-81d2-3aad281f7c42', 1001875, 'U', null, 'Y', null, 1001875, 1000097);
INSERT INTO bh_defaultincludedrole (ad_client_id, ad_org_id, bh_defaultincludedrole_id, bh_defaultincludedrole_uu, createdby, db_usertype, description, isactive, name, updatedby, included_role_id) VALUES (0, 0, 1000022, '69f7702e-223e-4efd-b557-8e0ca5c49dc9', 1001875, 'U', null, 'Y', null, 1001875, 1000111);
INSERT INTO bh_defaultincludedrole (ad_client_id, ad_org_id, bh_defaultincludedrole_id, bh_defaultincludedrole_uu, createdby, db_usertype, description, isactive, name, updatedby, included_role_id) VALUES (0, 0, 1000023, '008ef1b6-6695-4cff-9971-84e6f47045b4', 1001875, 'U', null, 'Y', null, 1001875, 1000096);
INSERT INTO bh_defaultincludedrole (ad_client_id, ad_org_id, bh_defaultincludedrole_id, bh_defaultincludedrole_uu, createdby, db_usertype, description, isactive, name, updatedby, included_role_id) VALUES (0, 0, 1000024, 'd65187b8-7d78-4afd-be64-f5f97889bb4f', 1001875, 'V', null, 'Y', null, 1001875, 1000047);
INSERT INTO bh_defaultincludedrole (ad_client_id, ad_org_id, bh_defaultincludedrole_id, bh_defaultincludedrole_uu, createdby, db_usertype, description, isactive, name, updatedby, included_role_id) VALUES (0, 0, 1000025, 'ca506afa-0113-414a-b7c3-4495d46f7d8d', 1001875, 'A', null, 'Y', null, 1001875, 1000047);

-- Insert a record into AD_Sequence
INSERT INTO ad_sequence (ad_sequence_id, ad_client_id, ad_org_id, isactive, createdby, updatedby, name, description, vformat, isautosequence, incrementno, startno, currentnext, currentnextsys, isaudited, istableid, prefix, suffix, startnewyear, datecolumn, decimalpattern, ad_sequence_uu, startnewmonth, isorglevelsequence, orgcolumn) VALUES ((SELECT currentnext FROM ad_sequence WHERE name = 'AD_Sequence'), 0, 0, 'Y', 1001875, 1001875, 'BH_DefaultIncludedRole', 'Table BH_DefaultIncludedRole', null, 'Y', 1, 1000000, 1000026, 200000, 'N', 'Y', null, null, 'N', null, null, 'c959e1f4-ecb2-4695-9586-d8c6be6515ed', 'N', 'N', null);

-- 2020-09-19 15:32
-- Update roles for current clients
DROP TABLE IF EXISTS tmp_ad_user_ids_needing_advanced_role;
CREATE TEMP TABLE tmp_ad_user_ids_needing_advanced_role(
	ad_user_id numeric(10,0) NOT NULL
);
DROP TABLE IF EXISTS tmp_ad_role;
CREATE TEMP TABLE tmp_ad_role
(
	ad_role_id serial not null,
	ad_client_id numeric(10) not null,
	ad_org_id numeric(10) not null,
	isactive char default 'Y'::bpchar not null,
	created timestamp default now() not null,
	createdby numeric(10) not null,
	updated timestamp default now() not null,
	name varchar(60) not null,
	updatedby numeric(10) not null,
	description varchar(255),
	userlevel char(3) default '  O'::bpchar not null,
	c_currency_id numeric(10),
	amtapproval numeric default 0,
	ad_tree_menu_id numeric(10),
	ismanual char default 'Y'::bpchar not null,
	isshowacct char default 'Y'::bpchar not null,
	ispersonallock char default 'N'::bpchar not null,
	ispersonalaccess char default 'N'::bpchar not null,
	iscanexport char default 'Y'::bpchar not null,
	iscanreport char default 'Y'::bpchar not null,
	supervisor_id numeric(10),
	iscanapproveowndoc char default 'Y'::bpchar not null,
	isaccessallorgs char default 'N'::bpchar not null,
	ischangelog char default 'N'::bpchar not null,
	preferencetype char default 'C'::bpchar not null,
	overwritepricelimit char default 'N'::bpchar not null,
	isuseuserorgaccess char default 'N'::bpchar not null,
	ad_tree_org_id numeric(10),
	confirmqueryrecords numeric(10) default 0 not null,
	maxqueryrecords numeric(10) default 0 not null,
	connectionprofile char,
	allow_info_account char default 'Y'::bpchar not null,
	allow_info_asset char default 'Y'::bpchar not null,
	allow_info_bpartner char default 'Y'::bpchar not null,
	allow_info_cashjournal char default 'N'::bpchar not null,
	allow_info_inout char default 'Y'::bpchar not null,
	allow_info_invoice char default 'Y'::bpchar not null,
	allow_info_order char default 'Y'::bpchar not null,
	allow_info_payment char default 'Y'::bpchar not null,
	allow_info_product char default 'Y'::bpchar not null,
	allow_info_resource char default 'Y'::bpchar not null,
	allow_info_schedule char default 'Y'::bpchar not null,
	userdiscount numeric(22,2),
	allow_info_mrp char default 'N'::bpchar not null,
	allow_info_crp char default 'N'::bpchar not null,
	isdiscountuptolimitprice char default 'N'::bpchar not null,
	isdiscountallowedontotal char default 'N'::bpchar not null,
	amtapprovalaccum numeric,
	daysapprovalaccum numeric(10),
	ad_role_uu uuid NOT NULL DEFAULT uuid_generate_v4(),
	ismenuautoexpand char default 'N'::bpchar not null,
	ismasterrole char default 'N'::bpchar not null,
	isaccessadvanced char default 'N'::bpchar,
	roletype varchar(2) default NULL::character varying
);

SELECT setval(
	'tmp_ad_role_ad_role_id_seq',
	(
		SELECT currentnext
		FROM ad_sequence
		WHERE name = 'AD_Role'
		LIMIT 1
	)::INT,
	false
);

-- Set the users who need new roles
INSERT INTO tmp_ad_user_ids_needing_advanced_role VALUES
(1018279),(1018232),(1008480),(1008475),(1008474),(1001825),(1023180),(1023178),(1023177),(1004993),(1004989),(1010081),(1001936),(1017596),(1045898),(1001431),(1028654),(1009481),(1003619),(1002834),(1001855),(1036196),(1036195),(1043898),(1043891),(1002424),(1001290),(1031734),(1019961),(1019945),(1043225),(1006126),(1002290),(1002893),(1000601),(1000598),(1012865),(1010736),(1013756),(1030496),(1012237),(1045922),(1006122),(1006121),(1014487),(1014467),(1000726),(1000017),(1045452),(1003710);

-- Insert the new AD roles
INSERT INTO tmp_ad_role (ad_client_id, ad_org_id, isactive, createdby, name, updatedby, description, userlevel, c_currency_id, amtapproval, ad_tree_menu_id, ismanual, isshowacct, ispersonallock, ispersonalaccess, iscanexport, iscanreport, supervisor_id, iscanapproveowndoc, isaccessallorgs, ischangelog, preferencetype, overwritepricelimit, isuseuserorgaccess, ad_tree_org_id, confirmqueryrecords, maxqueryrecords, connectionprofile, allow_info_account, allow_info_asset, allow_info_bpartner, allow_info_cashjournal, allow_info_inout, allow_info_invoice, allow_info_order, allow_info_payment, allow_info_product, allow_info_resource, allow_info_schedule, userdiscount, allow_info_mrp, allow_info_crp, isdiscountuptolimitprice, isdiscountallowedontotal, amtapprovalaccum, daysapprovalaccum, ad_role_uu, ismenuautoexpand, ismasterrole, isaccessadvanced, roletype)
SELECT ad_client_id, 0, 'Y', 1001875, name || ' Advanced User', 1001875, null, '  O', null, 0, null, 'N', 'N', 'N', 'N', 'Y', 'Y', null, 'Y', 'N', 'N', 'O', 'N', 'N', null, 0, 0, null, 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', null, 'N', 'N', 'N', 'N', null, null, uuid_generate_v4(), 'N', 'N', 'N', null
FROM ad_client
WHERE ad_client_id IN (SELECT ad_client_id FROM ad_user JOIN tmp_ad_user_ids_needing_advanced_role tauinar on ad_user.ad_user_id = tauinar.ad_user_id);

INSERT INTO ad_role (ad_role_id, ad_client_id, ad_org_id, isactive, createdby, name, updatedby, description, userlevel, c_currency_id, amtapproval, ad_tree_menu_id, ismanual, isshowacct, ispersonallock, ispersonalaccess, iscanexport, iscanreport, supervisor_id, iscanapproveowndoc, isaccessallorgs, ischangelog, preferencetype, overwritepricelimit, isuseuserorgaccess, ad_tree_org_id, confirmqueryrecords, maxqueryrecords, connectionprofile, allow_info_account, allow_info_asset, allow_info_bpartner, allow_info_cashjournal, allow_info_inout, allow_info_invoice, allow_info_order, allow_info_payment, allow_info_product, allow_info_resource, allow_info_schedule, userdiscount, allow_info_mrp, allow_info_crp, isdiscountuptolimitprice, isdiscountallowedontotal, amtapprovalaccum, daysapprovalaccum, ad_role_uu, ismenuautoexpand, ismasterrole, isaccessadvanced, roletype)
SELECT ad_role_id, ad_client_id, ad_org_id, isactive, createdby, name, updatedby, description, userlevel, c_currency_id, amtapproval, ad_tree_menu_id, ismanual, isshowacct, ispersonallock, ispersonalaccess, iscanexport, iscanreport, supervisor_id, iscanapproveowndoc, isaccessallorgs, ischangelog, preferencetype, overwritepricelimit, isuseuserorgaccess, ad_tree_org_id, confirmqueryrecords, maxqueryrecords, connectionprofile, allow_info_account, allow_info_asset, allow_info_bpartner, allow_info_cashjournal, allow_info_inout, allow_info_invoice, allow_info_order, allow_info_payment, allow_info_product, allow_info_resource, allow_info_schedule, userdiscount, allow_info_mrp, allow_info_crp, isdiscountuptolimitprice, isdiscountallowedontotal, amtapprovalaccum, daysapprovalaccum, ad_role_uu, ismenuautoexpand, ismasterrole, isaccessadvanced, roletype
FROM tmp_ad_role;

UPDATE ad_sequence
SET currentnext = nextval('tmp_ad_role_ad_role_id_seq')
WHERE name = 'AD_Role';

-- Next, update the roles to have the same access to orgs as the normal user roles do
INSERT INTO ad_role_orgaccess (ad_role_id, ad_org_id, ad_client_id, isactive, createdby, updatedby, isreadonly, ad_role_orgaccess_uu)
SELECT tar.ad_role_id, tar.ad_client_id, ao.ad_org_id, 'Y', 1001875, 1001875, 'N', uuid_generate_v4()
FROM tmp_ad_role tar
JOIN ad_org ao
	ON ao.ad_client_id = tar.ad_client_id;

-- Update the users to have the new roles
UPDATE ad_user_roles aur
SET ad_role_id = tar.ad_role_id
FROM ad_user au
JOIN tmp_ad_user_ids_needing_advanced_role tauinar
	ON au.ad_user_id = tauinar.ad_user_id
JOIN tmp_ad_role tar
	ON tar.ad_client_id = au.ad_client_id
WHERE au.ad_user_id = aur.ad_user_id;

-- include the BandaGo Admin role in the new roles
INSERT INTO ad_role_included (ad_client_id, ad_org_id, ad_role_id, createdby, included_role_id, isactive, seqno, updatedby, ad_role_included_uu)
SELECT tar.ad_client_id, 0, tar.ad_role_id, 1001875, 1000047, 'Y', 10, 1001875, uuid_generate_v4()
FROM tmp_ad_role tar;

-- Update the current roles for clients in the DB to be normal users
UPDATE ad_user_roles SET ad_role_id = 1000015 WHERE ad_user_id = 1000792;
UPDATE ad_user_roles SET ad_role_id = 1000063 WHERE ad_user_id = 1004405;
UPDATE ad_user_roles SET ad_role_id = 1000011 WHERE ad_user_id = 1005990;
UPDATE ad_user_roles SET ad_role_id = 1000033 WHERE ad_user_id = 1003795;
UPDATE ad_user_roles SET ad_role_id = 1000033 WHERE ad_user_id = 1003314;

DROP TABLE tmp_ad_role;
DROP TABLE tmp_ad_user_ids_needing_advanced_role;

SELECT register_migration_script('202009171538_GO-1319.sql') FROM dual;
