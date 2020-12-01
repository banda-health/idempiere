/**********************************************************************************************************/
-- Create new UI button tables
/**********************************************************************************************************/
create table if not exists bh_uibutton
(
	ad_client_id numeric(10) not null,
	ad_org_id numeric(10) not null,
	bh_uibutton_id numeric(10) not null,
	bh_uibutton_uu varchar(36),
	created timestamp default statement_timestamp() not null,
	createdby numeric(10) not null,
	description varchar(255),
	isactive char default 'Y'::bpchar not null,
	name varchar(60) not null,
	updated timestamp default statement_timestamp() not null,
	updatedby numeric(10) not null,
	cssvariablename varchar(100) default NULL::character varying not null,
	constraint bh_uibutton_key
		primary key (bh_uibutton_id),
	constraint bh_uibutton_uu_idx
		unique (bh_uibutton_uu),
	constraint adclient_bhuibutton
		foreign key (ad_client_id) references ad_client,
	constraint adorg_bhuibutton
		foreign key (ad_org_id) references ad_org,
	constraint bh_uibutton_isactive_check
		check (isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))
);

-- Insert a record into AD_Sequence
INSERT INTO ad_sequence (ad_sequence_id, ad_client_id, ad_org_id, isactive, createdby, updatedby, name, description, vformat, isautosequence, incrementno, startno, currentnext, currentnextsys, isaudited, istableid, prefix, suffix, startnewyear, datecolumn, decimalpattern, ad_sequence_uu, startnewmonth, isorglevelsequence, orgcolumn) VALUES ((SELECT currentnext FROM ad_sequence WHERE name = 'AD_Sequence'), 0, 0, 'Y', 100, 100, 'BH_UIButton', 'Table BH_UIButton', null, 'Y', 1, 1000000, 1000014, 200000, 'N', 'Y', null, null, 'N', null, null, '96263e1e-b946-4eaa-b3f9-aab99db9f6b5', 'N', 'N', null)
ON CONFLICT DO NOTHING;

/**********************************************************************************************************/
-- Insert the data into AD_Element and AD_Column so translations will work when the 2-pack is imported
/**********************************************************************************************************/
INSERT INTO ad_element (ad_element_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, columnname, entitytype, name, printname, description, help, po_name, po_printname, po_description, po_help, ad_element_uu, placeholder) VALUES ((SELECT MAX(ad_element_id) + 1 FROM ad_element), 0, 0, 'Y', '2019-03-20 15:39:54.534000', 100, '2019-03-20 15:39:54.534000', 100, 'BH_UIButton_ID', 'U', 'BH_UIButton', 'BH_UIButton', null, null, null, null, null, null, 'c215235a-a1f5-421d-8f5a-4e8b65bbff9d', null) ON CONFLICT DO NOTHING;
INSERT INTO ad_element (ad_element_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, columnname, entitytype, name, printname, description, help, po_name, po_printname, po_description, po_help, ad_element_uu, placeholder) VALUES ((SELECT MAX(ad_element_id) + 1 FROM ad_element), 0, 0, 'Y', '2019-03-20 15:39:54.836000', 100, '2019-03-20 15:39:54.836000', 100, 'BH_UIButton_UU', 'U', 'BH_UIButton_UU', 'BH_UIButton_UU', null, null, null, null, null, null, '38d32082-6fce-455c-b19b-6482ad7ae2b9', null) ON CONFLICT DO NOTHING;
INSERT INTO ad_element (ad_element_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, columnname, entitytype, name, printname, description, help, po_name, po_printname, po_description, po_help, ad_element_uu, placeholder) VALUES ((SELECT MAX(ad_element_id) + 1 FROM ad_element), 0, 0, 'Y', '2019-03-20 15:39:55.506000', 100, '2019-03-20 15:39:55.506000', 100, 'CssVariableName', 'U', 'CssVariableName', 'CSS Variable Name', null, null, null, null, null, null, '66645d55-e9e3-4efc-b604-cef21861edb6', null) ON CONFLICT DO NOTHING;
INSERT INTO ad_element (ad_element_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, columnname, entitytype, name, printname, description, help, po_name, po_printname, po_description, po_help, ad_element_uu, placeholder) VALUES ((SELECT MAX(ad_element_id) + 1 FROM ad_element), 0, 0, 'Y', '2019-03-20 15:41:18.737000', 100, '2019-03-20 15:41:18.737000', 100, 'BH_UIButton_Trl_UU', 'U', 'BH_UIButton_Trl_UU', 'BH_UIButton_Trl_UU', null, null, null, null, null, null, '87af70d6-9d8b-46ec-b8c9-956fef633b7c', null) ON CONFLICT DO NOTHING;

INSERT INTO ad_table (ad_table_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, tablename, isview, accesslevel, entitytype, ad_window_id, ad_val_rule_id, loadseq, issecurityenabled, isdeleteable, ishighvolume, importtable, ischangelog, replicationtype, po_window_id, copycolumnsfromtable, iscentrallymaintained, ad_table_uu, processing, databaseviewdrop, copycomponentsfromview) VALUES ((SELECT MAX(ad_table_id) + 1 FROM ad_table), 0, 0, 'Y', '2019-03-20 15:39:54.484000', 100, '2019-03-20 15:41:20.026000', 100, 'BH_UIButton', 'Stores the text for the Banda Health action buttons that have been styled.', null, 'BH_UIButton', 'N', '4', 'U', null, null, 0, 'N', 'Y', 'N', 'N', 'Y', 'L', null, 'N', 'Y', 'ef43960a-b8da-4af9-916a-9ded829971d1', 'N', 'N', 'N') ON CONFLICT DO NOTHING;

INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_Id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:39:54.571000', '2019-03-20 15:39:54.571000', 100, 100, 'BH_UIButton', null, null, 1, 'U', 'BH_UIButton_ID', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_UIButton'), 13, null, null, 22, null, 'Y', 'N', 'Y', 'N', null, 'N', null, 'N', 'N', null, null, null, null, 'N', (SELECT ad_element_id FROM ad_element WHERE columnname = 'BH_UIButton_ID'), null, 'Y', 'N', null, null, null, 'N', 'Y', null, 'e4dfedb4-48f7-47dc-b46e-4476fa029671', 'N', null, 'N', 'N', null, null, 'N', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_Id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:39:54.642000', '2019-03-20 15:39:54.642000', 100, 100, 'Client', 'Client/Tenant for this installation.', 'A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.', 1, 'U', 'AD_Client_ID', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_UIButton'), 19, null, 129, 22, '@#AD_Client_ID@', 'N', 'N', 'Y', 'N', null, 'N', null, 'N', 'N', null, null, null, null, 'N', 102, null, 'Y', 'N', null, null, null, 'N', 'Y', null, '0ec4f5b0-aa66-478b-b345-3dc377d2a171', 'N', null, 'N', 'N', null, 'ADClient_BHUIButton', 'N', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_Id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:39:54.718000', '2019-03-20 15:39:54.718000', 100, 100, 'Organization', 'Organizational entity within client', 'An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.', 1, 'U', 'AD_Org_ID', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_UIButton'), 19, null, 104, 22, '@#AD_Org_ID@', 'N', 'N', 'Y', 'N', null, 'N', null, 'N', 'N', null, null, null, null, 'N', 113, null, 'Y', 'N', null, null, null, 'N', 'Y', null, 'f39e08bf-abb5-4a48-84f7-fda9319e86b2', 'N', null, 'N', 'N', null, 'ADOrg_BHUIButton', 'N', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_Id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:39:54.872000', '2019-03-20 15:39:54.872000', 100, 100, 'BH_UIButton_UU', null, null, 1, 'U', 'BH_UIButton_UU', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_UIButton'), 10, null, null, 36, null, 'N', 'N', 'N', 'Y', null, 'N', null, 'N', 'N', null, null, null, null, 'N', (SELECT ad_element_id FROM ad_element WHERE columnname = 'BH_UIButton_UU'), null, 'Y', 'N', null, null, null, 'N', 'Y', null, '10efb8c9-b1bc-418f-bde2-03e65d2dd4ae', 'N', null, 'N', 'N', null, null, 'N', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_Id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:39:54.942000', '2019-03-20 15:39:54.942000', 100, 100, 'Created', 'Date this record was created', 'The Created field indicates the date that this record was created.', 1, 'U', 'Created', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_UIButton'), 16, null, null, 7, 'SYSDATE', 'N', 'N', 'Y', 'N', null, 'N', null, 'N', 'N', null, null, null, null, 'N', 245, null, 'Y', 'N', null, null, null, 'N', 'Y', null, 'f2921540-7ca9-46b1-b572-6ab4553c0ded', 'N', null, 'N', 'N', null, null, 'N', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_Id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:39:55.014000', '2019-03-20 15:39:55.014000', 100, 100, 'Created By', 'User who created this records', 'The Created By field indicates the user who created this record.', 1, 'U', 'CreatedBy', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_UIButton'), 18, 110, null, 22, null, 'N', 'N', 'Y', 'N', null, 'N', null, 'N', 'N', null, null, null, null, 'N', 246, null, 'Y', 'N', null, null, null, 'N', 'Y', null, '605fb5d1-f630-47c6-b3e9-2318f404706e', 'N', null, 'N', 'N', null, null, 'D', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_Id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:39:55.104000', '2019-03-20 15:39:55.104000', 100, 100, 'Description', 'Optional short description of the record', 'A description is limited to 255 characters.', 1, 'U', 'Description', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_UIButton'), 10, null, null, 255, null, 'N', 'N', 'N', 'Y', null, 'N', null, 'N', 'N', null, null, null, null, 'Y', 275, null, 'Y', 'N', null, null, null, 'N', 'Y', null, '88a977a3-064e-47a1-a606-f098413564d6', 'Y', null, 'N', 'N', null, null, 'N', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_Id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:39:55.176000', '2019-03-20 15:39:55.176000', 100, 100, 'Active', 'The record is active in the system', 'There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.', 1, 'U', 'IsActive', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_UIButton'), 20, null, null, 1, 'Y', 'N', 'N', 'Y', 'Y', null, 'N', null, 'N', 'N', null, null, null, null, 'N', 348, null, 'Y', 'N', null, null, null, 'N', 'Y', null, '57cba021-be81-4209-8ec1-7da0636e3c2d', 'N', null, 'N', 'N', null, null, 'N', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_Id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:39:55.310000', '2019-03-20 15:39:55.310000', 100, 100, 'Name', 'Alphanumeric identifier of the entity', 'The name of an entity (record) is used as an default search option in addition to the search key. The name is up to 60 characters in length.', 1, 'U', 'Name', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_UIButton'), 10, null, null, 60, null, 'N', 'N', 'Y', 'Y', null, 'Y', 1, 'Y', 'N', null, null, null, null, 'Y', 469, null, 'Y', 'N', null, null, null, 'N', 'Y', null, 'b727f21e-ba3e-4e9e-8c8a-b31407816973', 'Y', null, 'N', 'N', null, null, 'N', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_Id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:39:55.376000', '2019-03-20 15:39:55.376000', 100, 100, 'Updated', 'Date this record was updated', 'The Updated field indicates the date that this record was updated.', 1, 'U', 'Updated', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_UIButton'), 16, null, null, 7, 'SYSDATE', 'N', 'N', 'Y', 'N', null, 'N', null, 'N', 'N', null, null, null, null, 'N', 607, null, 'Y', 'N', null, null, null, 'N', 'Y', null, '473088cd-f059-4283-9899-ec4328474233', 'N', null, 'N', 'N', null, null, 'N', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_Id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:39:55.443000', '2019-03-20 15:39:55.443000', 100, 100, 'Updated By', 'User who updated this records', 'The Updated By field indicates the user who updated this record.', 1, 'U', 'UpdatedBy', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_UIButton'), 18, 110, null, 22, null, 'N', 'N', 'Y', 'N', null, 'N', null, 'N', 'N', null, null, null, null, 'N', 608, null, 'Y', 'N', null, null, null, 'N', 'Y', null, '49ffcbb0-600b-46a5-93ee-3352870d2a02', 'N', null, 'N', 'N', null, null, 'D', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_Id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:39:55.553000', '2019-03-20 15:39:55.553000', 100, 100, 'CssVariableName', null, null, 0, 'U', 'CssVariableName', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_UIButton'), 10, null, null, 100, null, 'N', 'N', 'Y', 'Y', null, 'N', 0, 'N', 'N', null, null, null, null, 'Y', (SELECT ad_element_id FROM ad_element WHERE columnname = 'CssVariableName'), null, 'Y', 'N', null, null, null, 'N', 'Y', null, 'eb353438-e2bd-40d9-86d3-81adc527337a', 'Y', 0, 'N', 'N', null, null, 'N', null, null, 'N') ON CONFLICT DO NOTHING;

/**********************************************************************************************************/
-- Create the UI Button translation table
/**********************************************************************************************************/
create table if not exists bh_uibutton_trl
(
	ad_client_id numeric(10) not null,
	ad_language varchar(6) not null,
	ad_org_id numeric(10) not null,
	bh_uibutton_id numeric(10) not null,
	bh_uibutton_trl_uu varchar(36),
	created timestamp default statement_timestamp() not null,
	createdby numeric(10) not null,
	description varchar(255),
	help varchar(2000),
	isactive char default 'Y'::bpchar not null,
	istranslated char not null,
	name varchar(60) not null,
	updated timestamp default statement_timestamp() not null,
	updatedby numeric(10) not null,
	constraint pk_bh_uibutton_trl
		primary key (bh_uibutton_id, ad_language),
	constraint bh_uibutton_trl_uu_idx
		unique (bh_uibutton_trl_uu),
	constraint adlanguage_bhuibuttontrl
		foreign key (ad_language) references ad_language,
	constraint bhuibutton_bhuibuttontrl
		foreign key (bh_uibutton_id) references bh_uibutton,
	constraint bh_uibutton_trl_isactive_check
		check (isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar])),
	constraint bh_uibutton_trl_istranslated_check
		check (istranslated = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))
);

-- Insert a record into AD_Sequence
INSERT INTO ad_sequence (ad_sequence_id, ad_client_id, ad_org_id, isactive, createdby, updatedby, name, description, vformat, isautosequence, incrementno, startno, currentnext, currentnextsys, isaudited, istableid, prefix, suffix, startnewyear, datecolumn, decimalpattern, ad_sequence_uu, startnewmonth, isorglevelsequence, orgcolumn) VALUES ((SELECT currentnext FROM ad_sequence WHERE name = 'AD_Sequence'), 0, 0, 'Y', 100, 100, 'BH_UIButton_Trl', 'Table BH_UIButton_Trl', null, 'Y', 1, 1000000, 1000000, 200000, 'N', 'Y', null, null, 'N', null, null, 'd6bfb9f6-3cb3-4994-a8f1-193b2ac7d864', 'N', 'N', null)
ON CONFLICT DO NOTHING;

-- Insert data into the UI Buttons table
INSERT INTO bh_uibutton (ad_client_id, ad_org_id, bh_uibutton_id, bh_uibutton_uu, created, createdby, description, isactive, name, updated, updatedby, cssvariablename) VALUES (0, 0, 1000000, '99c65ce4-4648-40af-a518-6f06d90c761b', '2019-03-20 15:41:21.057000', 100, null, 'Y', 'More Options', '2019-03-20 15:41:21.057000', 100, '--search-more-options') ON CONFLICT DO NOTHING;
INSERT INTO bh_uibutton (ad_client_id, ad_org_id, bh_uibutton_id, bh_uibutton_uu, created, createdby, description, isactive, name, updated, updatedby, cssvariablename) VALUES (0, 0, 1000001, 'e161a52a-7d50-4025-8af1-51a7ee6757c9', '2019-03-20 15:41:21.103000', 100, 'Cancel button', 'Y', 'Cancel', '2019-03-20 15:41:21.103000', 100, '--button-text-cancel') ON CONFLICT DO NOTHING;
INSERT INTO bh_uibutton (ad_client_id, ad_org_id, bh_uibutton_id, bh_uibutton_uu, created, createdby, description, isactive, name, updated, updatedby, cssvariablename) VALUES (0, 0, 1000002, 'a9b436b0-3e5d-4304-9282-153060c16bf9', '2019-03-20 15:41:21.124000', 100, null, 'Y', 'Customize', '2019-03-20 15:41:21.124000', 100, '--button-text-customize') ON CONFLICT DO NOTHING;
INSERT INTO bh_uibutton (ad_client_id, ad_org_id, bh_uibutton_id, bh_uibutton_uu, created, createdby, description, isactive, name, updated, updatedby, cssvariablename) VALUES (0, 0, 1000003, '84c35135-825f-4fce-ac8f-7c3dd1f82e96', '2019-03-20 15:41:21.143000', 100, null, 'Y', 'Delete', '2019-03-20 15:41:21.143000', 100, '--button-text-delete') ON CONFLICT DO NOTHING;
INSERT INTO bh_uibutton (ad_client_id, ad_org_id, bh_uibutton_id, bh_uibutton_uu, created, createdby, description, isactive, name, updated, updatedby, cssvariablename) VALUES (0, 0, 1000004, '08b5c514-dc23-48ce-a67d-9850ef54035f', '2019-03-20 15:41:21.171000', 100, null, 'Y', 'History', '2019-03-20 15:41:21.171000', 100, '--button-text-history') ON CONFLICT DO NOTHING;
INSERT INTO bh_uibutton (ad_client_id, ad_org_id, bh_uibutton_id, bh_uibutton_uu, created, createdby, description, isactive, name, updated, updatedby, cssvariablename) VALUES (0, 0, 1000005, 'b7389485-2f78-49af-89ec-caa22b0b6c22', '2019-03-20 15:41:21.190000', 100, null, 'Y', 'New', '2019-03-20 15:41:21.190000', 100, '--button-text-new') ON CONFLICT DO NOTHING;
INSERT INTO bh_uibutton (ad_client_id, ad_org_id, bh_uibutton_id, bh_uibutton_uu, created, createdby, description, isactive, name, updated, updatedby, cssvariablename) VALUES (0, 0, 1000006, '071adae4-192b-456f-84cf-ac6ad549768f', '2019-03-20 15:41:21.218000', 100, null, 'Y', 'OK', '2019-03-20 15:41:21.218000', 100, '--button-text-ok') ON CONFLICT DO NOTHING;
INSERT INTO bh_uibutton (ad_client_id, ad_org_id, bh_uibutton_id, bh_uibutton_uu, created, createdby, description, isactive, name, updated, updatedby, cssvariablename) VALUES (0, 0, 1000007, 'bdd01d6b-e5c8-47be-9f52-30b668e18620', '2019-03-20 15:41:21.237000', 100, null, 'Y', 'Prod. Attr.', '2019-03-20 15:41:21.237000', 100, '--button-text-product-attributes') ON CONFLICT DO NOTHING;
INSERT INTO bh_uibutton (ad_client_id, ad_org_id, bh_uibutton_id, bh_uibutton_uu, created, createdby, description, isactive, name, updated, updatedby, cssvariablename) VALUES (0, 0, 1000008, '37919a3e-9a92-4034-b9ec-cb0b97c6c0d3', '2019-03-20 15:41:21.258000', 100, null, 'Y', 'Refresh', '2019-03-20 15:41:21.258000', 100, '--button-text-refresh') ON CONFLICT DO NOTHING;
INSERT INTO bh_uibutton (ad_client_id, ad_org_id, bh_uibutton_id, bh_uibutton_uu, created, createdby, description, isactive, name, updated, updatedby, cssvariablename) VALUES (0, 0, 1000009, 'a965914d-562a-4a05-822b-e060d3c723be', '2019-03-20 15:41:21.277000', 100, null, 'Y', 'Reset', '2019-03-20 15:41:21.277000', 100, '--button-text-reset') ON CONFLICT DO NOTHING;
INSERT INTO bh_uibutton (ad_client_id, ad_org_id, bh_uibutton_id, bh_uibutton_uu, created, createdby, description, isactive, name, updated, updatedby, cssvariablename) VALUES (0, 0, 1000010, 'df567e9e-8b6f-4f6e-953d-83d100d5d165', '2019-03-20 15:41:21.298000', 100, null, 'Y', 'Results', '2019-03-20 15:41:21.298000', 100, '--button-text-results') ON CONFLICT DO NOTHING;
INSERT INTO bh_uibutton (ad_client_id, ad_org_id, bh_uibutton_id, bh_uibutton_uu, created, createdby, description, isactive, name, updated, updatedby, cssvariablename) VALUES (0, 0, 1000011, '3867a7bd-88f8-4bdc-befd-0ed440dbce7b', '2019-03-20 15:41:21.317000', 100, null, 'Y', 'Save', '2019-03-20 15:41:21.317000', 100, '--button-text-save') ON CONFLICT DO NOTHING;
INSERT INTO bh_uibutton (ad_client_id, ad_org_id, bh_uibutton_id, bh_uibutton_uu, created, createdby, description, isactive, name, updated, updatedby, cssvariablename) VALUES (0, 0, 1000012, 'd53d5ec7-7246-4048-bd8f-2191a87f350f', '2019-03-20 15:41:21.337000', 100, null, 'Y', 'Search', '2019-03-20 15:41:21.337000', 100, '--button-text-search') ON CONFLICT DO NOTHING;
INSERT INTO bh_uibutton (ad_client_id, ad_org_id, bh_uibutton_id, bh_uibutton_uu, created, createdby, description, isactive, name, updated, updatedby, cssvariablename) VALUES (0, 0, 1000013, '489c0d7f-63a0-4526-af46-716f4024b402', '2019-03-20 15:41:21.358000', 100, null, 'Y', 'Zoom', '2019-03-20 15:41:21.358000', 100, '--button-text-zoom') ON CONFLICT DO NOTHING;

-- Insert the UI Buttons translations
INSERT INTO bh_uibutton_trl (ad_client_id, ad_language, ad_org_id, bh_uibutton_id, bh_uibutton_trl_uu, created, createdby, description, help, isactive, istranslated, name, updated, updatedby) VALUES (0, 'es_CO', 0, 1000000, 'c1301eed-c81c-40b3-b924-942142e6e261', '2019-03-20 15:41:21.057000', 100, null, null, 'Y', 'N', 'More Options', '2019-03-20 15:41:21.057000', 100) ON CONFLICT DO NOTHING;
INSERT INTO bh_uibutton_trl (ad_client_id, ad_language, ad_org_id, bh_uibutton_id, bh_uibutton_trl_uu, created, createdby, description, help, isactive, istranslated, name, updated, updatedby) VALUES (0, 'es_CO', 0, 1000001, '54597735-2724-480d-93ab-f239aa9de761', '2019-03-20 15:41:21.103000', 100, null, null, 'Y', 'N', 'Cancel', '2019-03-20 15:41:21.103000', 100) ON CONFLICT DO NOTHING;
INSERT INTO bh_uibutton_trl (ad_client_id, ad_language, ad_org_id, bh_uibutton_id, bh_uibutton_trl_uu, created, createdby, description, help, isactive, istranslated, name, updated, updatedby) VALUES (0, 'es_CO', 0, 1000002, 'afaa3a69-a0c1-43b1-ac6b-04782dc6f2c7', '2019-03-20 15:41:21.124000', 100, null, null, 'Y', 'N', 'Customize', '2019-03-20 15:41:21.124000', 100) ON CONFLICT DO NOTHING;
INSERT INTO bh_uibutton_trl (ad_client_id, ad_language, ad_org_id, bh_uibutton_id, bh_uibutton_trl_uu, created, createdby, description, help, isactive, istranslated, name, updated, updatedby) VALUES (0, 'es_CO', 0, 1000003, 'cc15a711-d568-42d9-80f4-b998288f0eff', '2019-03-20 15:41:21.143000', 100, null, null, 'Y', 'N', 'Delete', '2019-03-20 15:41:21.143000', 100) ON CONFLICT DO NOTHING;
INSERT INTO bh_uibutton_trl (ad_client_id, ad_language, ad_org_id, bh_uibutton_id, bh_uibutton_trl_uu, created, createdby, description, help, isactive, istranslated, name, updated, updatedby) VALUES (0, 'es_CO', 0, 1000004, 'aef0e1ae-e8c6-488f-a6c0-03a9f3cd3c91', '2019-03-20 15:41:21.171000', 100, null, null, 'Y', 'N', 'History', '2019-03-20 15:41:21.171000', 100) ON CONFLICT DO NOTHING;
INSERT INTO bh_uibutton_trl (ad_client_id, ad_language, ad_org_id, bh_uibutton_id, bh_uibutton_trl_uu, created, createdby, description, help, isactive, istranslated, name, updated, updatedby) VALUES (0, 'es_CO', 0, 1000005, 'd9765edd-0f3f-470d-a4fb-be9ff5981554', '2019-03-20 15:41:21.190000', 100, null, null, 'Y', 'N', 'New', '2019-03-20 15:41:21.190000', 100) ON CONFLICT DO NOTHING;
INSERT INTO bh_uibutton_trl (ad_client_id, ad_language, ad_org_id, bh_uibutton_id, bh_uibutton_trl_uu, created, createdby, description, help, isactive, istranslated, name, updated, updatedby) VALUES (0, 'es_CO', 0, 1000006, '62fe72ca-2712-4c78-96e9-cb55d2aa7d9c', '2019-03-20 15:41:21.218000', 100, null, null, 'Y', 'N', 'OK', '2019-03-20 15:41:21.218000', 100) ON CONFLICT DO NOTHING;
INSERT INTO bh_uibutton_trl (ad_client_id, ad_language, ad_org_id, bh_uibutton_id, bh_uibutton_trl_uu, created, createdby, description, help, isactive, istranslated, name, updated, updatedby) VALUES (0, 'es_CO', 0, 1000007, '8f214822-2d7c-4974-aa26-8b8e15b4a32d', '2019-03-20 15:41:21.237000', 100, null, null, 'Y', 'N', 'Prod. Attr.', '2019-03-20 15:41:21.237000', 100) ON CONFLICT DO NOTHING;
INSERT INTO bh_uibutton_trl (ad_client_id, ad_language, ad_org_id, bh_uibutton_id, bh_uibutton_trl_uu, created, createdby, description, help, isactive, istranslated, name, updated, updatedby) VALUES (0, 'es_CO', 0, 1000008, 'f2e90830-b4e0-445a-aa88-66033ccc17dc', '2019-03-20 15:41:21.258000', 100, null, null, 'Y', 'N', 'Refresh', '2019-03-20 15:41:21.258000', 100) ON CONFLICT DO NOTHING;
INSERT INTO bh_uibutton_trl (ad_client_id, ad_language, ad_org_id, bh_uibutton_id, bh_uibutton_trl_uu, created, createdby, description, help, isactive, istranslated, name, updated, updatedby) VALUES (0, 'es_CO', 0, 1000009, '8fbcbe16-6ab5-4fc9-b80a-97cae66e29da', '2019-03-20 15:41:21.277000', 100, null, null, 'Y', 'N', 'Reset', '2019-03-20 15:41:21.277000', 100) ON CONFLICT DO NOTHING;
INSERT INTO bh_uibutton_trl (ad_client_id, ad_language, ad_org_id, bh_uibutton_id, bh_uibutton_trl_uu, created, createdby, description, help, isactive, istranslated, name, updated, updatedby) VALUES (0, 'es_CO', 0, 1000010, '6d771a28-4f5b-4b2b-af02-515c230dfda8', '2019-03-20 15:41:21.298000', 100, null, null, 'Y', 'N', 'Results', '2019-03-20 15:41:21.298000', 100) ON CONFLICT DO NOTHING;
INSERT INTO bh_uibutton_trl (ad_client_id, ad_language, ad_org_id, bh_uibutton_id, bh_uibutton_trl_uu, created, createdby, description, help, isactive, istranslated, name, updated, updatedby) VALUES (0, 'es_CO', 0, 1000011, '1c801725-4cc4-4232-986c-083b6b42719e', '2019-03-20 15:41:21.317000', 100, null, null, 'Y', 'N', 'Save', '2019-03-20 15:41:21.317000', 100) ON CONFLICT DO NOTHING;
INSERT INTO bh_uibutton_trl (ad_client_id, ad_language, ad_org_id, bh_uibutton_id, bh_uibutton_trl_uu, created, createdby, description, help, isactive, istranslated, name, updated, updatedby) VALUES (0, 'es_CO', 0, 1000012, '10494325-cd7a-48f1-921f-d70b89925247', '2019-03-20 15:41:21.337000', 100, null, null, 'Y', 'N', 'Search', '2019-03-20 15:41:21.337000', 100) ON CONFLICT DO NOTHING;
INSERT INTO bh_uibutton_trl (ad_client_id, ad_language, ad_org_id, bh_uibutton_id, bh_uibutton_trl_uu, created, createdby, description, help, isactive, istranslated, name, updated, updatedby) VALUES (0, 'es_CO', 0, 1000013, '89c881b9-f939-4a57-ab01-cea348fdaecf', '2019-03-20 15:41:21.358000', 100, null, null, 'Y', 'N', 'Zoom', '2019-03-20 15:41:21.358000', 100) ON CONFLICT DO NOTHING;
INSERT INTO bh_uibutton_trl (ad_client_id, ad_language, ad_org_id, bh_uibutton_id, bh_uibutton_trl_uu, created, createdby, description, help, isactive, istranslated, name, updated, updatedby) VALUES (0, 'fr_FR', 0, 1000013, 'd53226f2-d7a9-4fd0-a8e9-e9c136caf610', '2019-03-20 16:01:10.829702', 100, null, null, 'Y', 'N', 'Zoom', '2019-03-20 16:01:10.829702', 100) ON CONFLICT DO NOTHING;
INSERT INTO bh_uibutton_trl (ad_client_id, ad_language, ad_org_id, bh_uibutton_id, bh_uibutton_trl_uu, created, createdby, description, help, isactive, istranslated, name, updated, updatedby) VALUES (0, 'fr_FR', 0, 1000012, 'da4664db-4980-4890-b432-3b9b9705c484', '2019-03-20 16:01:10.829702', 100, null, null, 'Y', 'N', 'Search', '2019-03-20 16:01:10.829702', 100) ON CONFLICT DO NOTHING;
INSERT INTO bh_uibutton_trl (ad_client_id, ad_language, ad_org_id, bh_uibutton_id, bh_uibutton_trl_uu, created, createdby, description, help, isactive, istranslated, name, updated, updatedby) VALUES (0, 'fr_FR', 0, 1000011, '6909d7c9-92c0-4583-bd9b-48313eebc5a7', '2019-03-20 16:01:10.829702', 100, null, null, 'Y', 'N', 'Save', '2019-03-20 16:01:10.829702', 100) ON CONFLICT DO NOTHING;
INSERT INTO bh_uibutton_trl (ad_client_id, ad_language, ad_org_id, bh_uibutton_id, bh_uibutton_trl_uu, created, createdby, description, help, isactive, istranslated, name, updated, updatedby) VALUES (0, 'fr_FR', 0, 1000010, 'ff6810ae-72bc-494a-bbd7-a348de1b14b4', '2019-03-20 16:01:10.829702', 100, null, null, 'Y', 'N', 'Results', '2019-03-20 16:01:10.829702', 100) ON CONFLICT DO NOTHING;
INSERT INTO bh_uibutton_trl (ad_client_id, ad_language, ad_org_id, bh_uibutton_id, bh_uibutton_trl_uu, created, createdby, description, help, isactive, istranslated, name, updated, updatedby) VALUES (0, 'fr_FR', 0, 1000009, 'b6526a2f-3295-47cd-804f-5c6d9b4c3212', '2019-03-20 16:01:10.829702', 100, null, null, 'Y', 'N', 'Reset', '2019-03-20 16:01:10.829702', 100) ON CONFLICT DO NOTHING;
INSERT INTO bh_uibutton_trl (ad_client_id, ad_language, ad_org_id, bh_uibutton_id, bh_uibutton_trl_uu, created, createdby, description, help, isactive, istranslated, name, updated, updatedby) VALUES (0, 'fr_FR', 0, 1000008, '01acadad-35fa-4ce6-8a50-3d53eec5810a', '2019-03-20 16:01:10.829702', 100, null, null, 'Y', 'N', 'Refresh', '2019-03-20 16:01:10.829702', 100) ON CONFLICT DO NOTHING;
INSERT INTO bh_uibutton_trl (ad_client_id, ad_language, ad_org_id, bh_uibutton_id, bh_uibutton_trl_uu, created, createdby, description, help, isactive, istranslated, name, updated, updatedby) VALUES (0, 'fr_FR', 0, 1000007, 'e25fca11-5aa4-4a19-994c-ce24ecda2aaa', '2019-03-20 16:01:10.829702', 100, null, null, 'Y', 'N', 'Prod. Attr.', '2019-03-20 16:01:10.829702', 100) ON CONFLICT DO NOTHING;
INSERT INTO bh_uibutton_trl (ad_client_id, ad_language, ad_org_id, bh_uibutton_id, bh_uibutton_trl_uu, created, createdby, description, help, isactive, istranslated, name, updated, updatedby) VALUES (0, 'fr_FR', 0, 1000006, 'a247d352-371c-4741-9b63-6f2bc437afd6', '2019-03-20 16:01:10.829702', 100, null, null, 'Y', 'N', 'OK', '2019-03-20 16:01:10.829702', 100) ON CONFLICT DO NOTHING;
INSERT INTO bh_uibutton_trl (ad_client_id, ad_language, ad_org_id, bh_uibutton_id, bh_uibutton_trl_uu, created, createdby, description, help, isactive, istranslated, name, updated, updatedby) VALUES (0, 'fr_FR', 0, 1000005, '9d8e5765-3ece-48a9-96fb-75ecf3ce01ee', '2019-03-20 16:01:10.829702', 100, null, null, 'Y', 'N', 'New', '2019-03-20 16:01:10.829702', 100) ON CONFLICT DO NOTHING;
INSERT INTO bh_uibutton_trl (ad_client_id, ad_language, ad_org_id, bh_uibutton_id, bh_uibutton_trl_uu, created, createdby, description, help, isactive, istranslated, name, updated, updatedby) VALUES (0, 'fr_FR', 0, 1000004, '28b60150-0458-433f-b053-06722309832b', '2019-03-20 16:01:10.829702', 100, null, null, 'Y', 'N', 'History', '2019-03-20 16:01:10.829702', 100) ON CONFLICT DO NOTHING;
INSERT INTO bh_uibutton_trl (ad_client_id, ad_language, ad_org_id, bh_uibutton_id, bh_uibutton_trl_uu, created, createdby, description, help, isactive, istranslated, name, updated, updatedby) VALUES (0, 'fr_FR', 0, 1000003, 'e371259e-90a5-4240-96ba-e6f6e9eba626', '2019-03-20 16:01:10.829702', 100, null, null, 'Y', 'N', 'Delete', '2019-03-20 16:01:10.829702', 100) ON CONFLICT DO NOTHING;
INSERT INTO bh_uibutton_trl (ad_client_id, ad_language, ad_org_id, bh_uibutton_id, bh_uibutton_trl_uu, created, createdby, description, help, isactive, istranslated, name, updated, updatedby) VALUES (0, 'fr_FR', 0, 1000002, '5fa412b6-6605-4dda-bfbc-6b6bd5d0daa6', '2019-03-20 16:01:10.829702', 100, null, null, 'Y', 'N', 'Customize', '2019-03-20 16:01:10.829702', 100) ON CONFLICT DO NOTHING;
INSERT INTO bh_uibutton_trl (ad_client_id, ad_language, ad_org_id, bh_uibutton_id, bh_uibutton_trl_uu, created, createdby, description, help, isactive, istranslated, name, updated, updatedby) VALUES (0, 'fr_FR', 0, 1000001, '5507ae2b-eef5-4aa7-a3cc-f8ed0f5005b7', '2019-03-20 16:01:10.829702', 100, null, null, 'Y', 'N', 'Cancel', '2019-03-20 16:01:10.829702', 100) ON CONFLICT DO NOTHING;
INSERT INTO bh_uibutton_trl (ad_client_id, ad_language, ad_org_id, bh_uibutton_id, bh_uibutton_trl_uu, created, createdby, description, help, isactive, istranslated, name, updated, updatedby) VALUES (0, 'fr_FR', 0, 1000000, '2d78e508-0897-43b4-a8d8-2c233bc4ce48', '2019-03-20 16:01:10.829702', 100, null, null, 'Y', 'N', 'More Options', '2019-03-20 16:01:10.829702', 100) ON CONFLICT DO NOTHING;

/**********************************************************************************************************/
-- Rename the Home Screen Button Tables
/**********************************************************************************************************/
ALTER TABLE IF EXISTS bh_hmscrn_buttongroup RENAME COLUMN bh_hmscrn_buttongroup_id TO bh_dbrdbtngrp_id;
ALTER TABLE IF EXISTS bh_hmscrn_buttongroup RENAME COLUMN bh_hmscrn_buttongroup_uu TO bh_dbrdbtngrp_uu;
ALTER TABLE IF EXISTS bh_hmscrn_buttongroup RENAME TO bh_dbrdbtngrp;

-- Don't forget to update ad_sequence
UPDATE ad_sequence
SET name = 'BH_DbrdBtnGrp', description = 'Table BH_DbrdBtnGrp'
WHERE name = 'BH_HmScrn_ButtonGroup';

-- Also, ad_table and ad_column need to be fixed as well
UPDATE ad_table
SET name = 'BH_DbrdBtnGrp', tablename = 'BH_DbrdBtnGrp'
WHERE ad_table_uu = 'ae04c83f-2010-4037-bd42-e6f15a857823';

UPDATE ad_column
SET columnname = 'BH_DbrdBtnGrp_ID', name = 'BH_DbrdBtnGrp_ID'
WHERE columnname = 'BH_HmScrn_ButtonGroup_ID';
UPDATE ad_column
SET columnname = 'BH_DbrdBtnGrp_UU', name = 'BH_DbrdBtnGrp_UU'
WHERE columnname = 'BH_HmScrn_ButtonGroup_UU';

ALTER TABLE IF EXISTS bh_hmscrn_buttongroupline RENAME COLUMN bh_hmscrn_buttongroupline_id TO bh_dbrdbtngrp_btn_id;
ALTER TABLE IF EXISTS bh_hmscrn_buttongroupline RENAME COLUMN bh_hmscrn_buttongroupline_uu TO bh_dbrdbtngrp_btn_uu;
ALTER TABLE IF EXISTS bh_hmscrn_buttongroupline RENAME COLUMN bh_hmscrn_buttongroup_id TO bh_dbrdbtngrp_id;
ALTER TABLE IF EXISTS bh_hmscrn_buttongroupline RENAME TO bh_dbrdbtngrp_btn;

-- Don't forget to update ad_sequence
UPDATE ad_sequence
SET name = 'BH_DbrdBtnGrp_Btn', description = 'Table BH_DbrdBtnGrp_Btn'
WHERE name = 'BH_HmScrn_ButtonGroupLine';

-- Also, ad_table and ad_column need to be fixed as well
UPDATE ad_table
SET name = 'BH_DbrdBtnGrp_Btn', tablename = 'BH_DbrdBtnGrp_Btn'
WHERE ad_table_uu = 'bdfcbd0c-4810-4d63-a5b6-3c6ca2119b11';

UPDATE ad_column
SET columnname = 'BH_DbrdBtnGrp_Btn_ID', name = 'BH_DbrdBtnGrp_Btn_ID'
WHERE columnname = 'BH_HmScrn_ButtonGroupLine_ID';
UPDATE ad_column
SET columnname = 'BH_DbrdBtnGrp_Btn_UU', name = 'BH_DbrdBtnGrp_Btn_UU'
WHERE columnname = 'BH_HmScrn_ButtonGroupLine_UU';

-- We also need to udpate AD_Element
UPDATE ad_element SET columnname = 'BH_DbrdBtnGrp_ID', name = 'BH_DbrdBtnGrp_ID', printname = 'Button Group' WHERE ad_element_uu = '6a6d008b-3531-4c75-8483-5f4b859a6dfe';
UPDATE ad_element SET columnname = 'BH_DbrdBtnGrp_UU', name = 'BH_DbrdBtnGrp_UU', printname = 'BH_DbrdBtnGrp_UU' WHERE ad_element_uu = 'd7ba3d57-65f4-432f-b194-b04f8e95c4d8';
UPDATE ad_element SET columnname = 'BH_DbrdBtnGrp_Btn_ID', name = 'BH_DbrdBtnGrp_Btn_ID', printname = 'BH_DbrdBtnGrp_Btn_ID' WHERE ad_element_uu = '616de46c-495b-44b3-aa37-ac230f6b404c';
UPDATE ad_element SET columnname = 'BH_DbrdBtnGrp_Btn_UU', name = 'BH_DbrdBtnGrp_Btn_UU', printname = 'BH_DbrdBtnGrp_Btn_UU' WHERE ad_element_uu = '6646b341-7ed3-40ee-a457-ce2a98cfbd54';

/**********************************************************************************************************/
-- Add translation tables for the (former) home screen buttons
/**********************************************************************************************************/
create table if not exists bh_dbrdbtngrp_trl
(
	ad_client_id numeric(10) not null,
	ad_language varchar(6) not null,
	ad_org_id numeric(10) not null,
	bh_dbrdbtngrp_id numeric(10) not null,
	bh_dbrdbtngrp_trl_uu varchar(36),
	created timestamp default statement_timestamp() not null,
	createdby numeric(10) not null,
	description varchar(255),
	help varchar(2000),
	isactive char default 'Y'::bpchar not null,
	istranslated char not null,
	name varchar(60) not null,
	updated timestamp default statement_timestamp() not null,
	updatedby numeric(10) not null,
	bh_dbrdbtngrp_trl_id numeric(10),
	constraint pk_bh_dbrdbtngrp_trl
		primary key (bh_dbrdbtngrp_id, ad_language),
	constraint bh_dbrdbtngrp_trl_uu_idx
		unique (bh_dbrdbtngrp_trl_uu),
	constraint adlanguage_bhdbrdbtngrptrl
		foreign key (ad_language) references ad_language,
	constraint bhdbrdbtngrp_bhdbrdbtngrptrl
		foreign key (bh_dbrdbtngrp_id) references bh_dbrdbtngrp,
	constraint bh_dbrdbtngrp_trl_isactive_check
		check (isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar])),
	constraint bh_dbrdbtngrp_trl_istranslated_check
		check (istranslated = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))
);

INSERT INTO ad_sequence (ad_sequence_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, vformat, isautosequence, incrementno, startno, currentnext, currentnextsys, isaudited, istableid, prefix, suffix, startnewyear, datecolumn, decimalpattern, ad_sequence_uu, startnewmonth, isorglevelsequence, orgcolumn) VALUES ((SELECT MAX(ad_sequence_id) + 1 FROM ad_sequence), 0, 0, 'Y', '2019-03-20 15:39:51.091000', 100, '2019-03-20 15:39:51.091000', 100, 'BH_DbrdBtnGrp_Trl', 'Table BH_DbrdBtnGrp_Trl', null, 'Y', 1, 1000000, 1000000, 200000, 'N', 'Y', null, null, 'N', null, null, '955ed774-aa59-46f5-95ae-69cb9a039a0c', 'N', 'N', null)
ON CONFLICT DO NOTHING;

create table if not exists bh_dbrdbtngrp_btn_trl
(
	ad_client_id numeric(10) not null,
	ad_language varchar(6) not null,
	ad_org_id numeric(10) not null,
	bh_dbrdbtngrp_btn_trl_uu varchar(36),
	created timestamp default statement_timestamp() not null,
	createdby numeric(10) not null,
	description varchar(255),
	help varchar(2000),
	isactive char default 'Y'::bpchar not null,
	istranslated char not null,
	name varchar(60) not null,
	updated timestamp default statement_timestamp() not null,
	updatedby numeric(10) not null,
	bh_dbrdbtngrp_btn_id numeric(10) not null,
	buttonhelptext varchar(100),
	buttontext varchar(100),
	bh_dbrdbtngrp_btn_trl_id numeric(10),
	constraint pk_bh_dbrdbtngrp_btn_trl
		primary key (bh_dbrdbtngrp_btn_id, ad_language),
	constraint bh_dbrdbtngrp_btn_trl_uu_idx
		unique (bh_dbrdbtngrp_btn_trl_uu),
	constraint adlanguage_bhdbrdbtngrpbtntrl
		foreign key (ad_language) references ad_language,
	constraint bhdbrdbtngr_bhdbrdbtngrpbtntrl
		foreign key (bh_dbrdbtngrp_btn_id) references bh_dbrdbtngrp_btn,
	constraint bh_dbrdbtngrp_btn_trl_isactive_check
		check (isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar])),
	constraint bh_dbrdbtngrp_btn_trl_istranslated_check
		check (istranslated = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))
);

INSERT INTO ad_sequence (ad_sequence_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, vformat, isautosequence, incrementno, startno, currentnext, currentnextsys, isaudited, istableid, prefix, suffix, startnewyear, datecolumn, decimalpattern, ad_sequence_uu, startnewmonth, isorglevelsequence, orgcolumn) VALUES ((SELECT MAX(ad_sequence_id) + 1 FROM ad_sequence), 0, 0, 'Y', '2019-03-20 15:39:52.570000', 100, '2019-03-20 15:39:52.570000', 100, 'BH_DbrdBtnGrp_Btn_Trl', 'Table BH_DbrdBtnGrp_Btn_Trl', null, 'Y', 1, 1000000, 1000000, 200000, 'N', 'Y', null, null, 'N', null, null, 'de74978e-0085-4f29-bd55-359902ce1e45', 'N', 'N', null)
ON CONFLICT DO NOTHING;

/**********************************************************************************************************/
-- Insert translation data for the (former) home screen buttons
/**********************************************************************************************************/
INSERT INTO bh_dbrdbtngrp_trl (ad_client_id, ad_language, ad_org_id, bh_dbrdbtngrp_id, bh_dbrdbtngrp_trl_uu, created, createdby, description, help, isactive, istranslated, name, updated, updatedby, bh_dbrdbtngrp_trl_id) VALUES (0, 'fr_FR', 0, 1000005, '40c4629e-60b7-4335-b3bf-e1824bd8917d', '2019-03-20 16:01:10.749312', 100, null, null, 'Y', 'N', 'Metrics', '2019-03-20 16:01:10.749312', 100, null) ON CONFLICT DO NOTHING;
INSERT INTO bh_dbrdbtngrp_trl (ad_client_id, ad_language, ad_org_id, bh_dbrdbtngrp_id, bh_dbrdbtngrp_trl_uu, created, createdby, description, help, isactive, istranslated, name, updated, updatedby, bh_dbrdbtngrp_trl_id) VALUES (0, 'fr_FR', 0, 1000006, '9066ca4f-c143-4ec4-81a0-4e79eaebeafe', '2019-03-20 16:01:10.749312', 100, null, null, 'Y', 'N', 'Pharmacy and Stores', '2019-03-20 16:01:10.749312', 100, null) ON CONFLICT DO NOTHING;
INSERT INTO bh_dbrdbtngrp_trl (ad_client_id, ad_language, ad_org_id, bh_dbrdbtngrp_id, bh_dbrdbtngrp_trl_uu, created, createdby, description, help, isactive, istranslated, name, updated, updatedby, bh_dbrdbtngrp_trl_id) VALUES (0, 'fr_FR', 0, 1000002, '63c7afc3-ec2c-4ca6-9728-54f8a1186f30', '2019-03-20 16:01:10.749312', 100, null, null, 'Y', 'N', 'Cashier and Accounts', '2019-03-20 16:01:10.749312', 100, null) ON CONFLICT DO NOTHING;
INSERT INTO bh_dbrdbtngrp_trl (ad_client_id, ad_language, ad_org_id, bh_dbrdbtngrp_id, bh_dbrdbtngrp_trl_uu, created, createdby, description, help, isactive, istranslated, name, updated, updatedby, bh_dbrdbtngrp_trl_id) VALUES (0, 'fr_FR', 0, 1000001, 'f0d2579f-0336-4cb4-b20a-ecb9ce3a060a', '2019-03-20 16:01:10.749312', 100, null, null, 'Y', 'N', 'My Products Services and Expenses', '2019-03-20 16:01:10.749312', 100, null) ON CONFLICT DO NOTHING;
INSERT INTO bh_dbrdbtngrp_trl (ad_client_id, ad_language, ad_org_id, bh_dbrdbtngrp_id, bh_dbrdbtngrp_trl_uu, created, createdby, description, help, isactive, istranslated, name, updated, updatedby, bh_dbrdbtngrp_trl_id) VALUES (0, 'fr_FR', 0, 1000000, '4c2b7882-34e6-485c-967c-3a0e25339985', '2019-03-20 16:01:10.749312', 100, null, null, 'Y', 'N', 'Patients and Suppliers', '2019-03-20 16:01:10.749312', 100, null) ON CONFLICT DO NOTHING;
INSERT INTO bh_dbrdbtngrp_trl (ad_client_id, ad_language, ad_org_id, bh_dbrdbtngrp_id, bh_dbrdbtngrp_trl_uu, created, createdby, description, help, isactive, istranslated, name, updated, updatedby, bh_dbrdbtngrp_trl_id) VALUES (0, 'fr_FR', 0, 1000003, '36a25654-393d-4199-b7cc-c1223798a455', '2019-07-16 13:29:23.369000', 0, null, null, 'Y', 'N', 'Reports', '2019-07-16 13:29:23.369000', 0, null) ON CONFLICT DO NOTHING;

/**********************************************************************************************************/
-- Update btn data so that the URLs work in GL on all DBs
/**********************************************************************************************************/
UPDATE bh_dbrdbtngrp_btn SET buttonhelptext = 'Product Info', buttontext = 'Product Info', description = 'Product Info Window', isactive = 'N', name = 'Product Info' WHERE bh_dbrdbtngrp_btn_uu = 'a3be1b18-3ac7-48c0-aa95-a0d702a6924b';
UPDATE bh_dbrdbtngrp_btn SET buttonhelptext = 'Track Expenses', buttontext = 'Track Expenses', description = null, isactive = 'N', name = 'Track Expenses' WHERE bh_dbrdbtngrp_btn_uu = '44f2267a-f38f-4397-b531-8186ac6fd54c';
UPDATE bh_dbrdbtngrp_btn SET buttonhelptext = 'Physical Inventory', buttontext = 'Physical Inventory', description = null, isactive = 'N', name = 'BH  Physical Inventory' WHERE bh_dbrdbtngrp_btn_uu = 'a7055196-db84-4a45-bea2-e07c4af1f4ee';
UPDATE bh_dbrdbtngrp_btn SET buttonhelptext = 'Receive Goods', buttontext = 'Receive Goods', description = null, isactive = 'N', name = 'BH  Receive Goods' WHERE bh_dbrdbtngrp_btn_uu = '5c10bdcf-3559-4133-86c9-57321f40f5fd';
UPDATE bh_dbrdbtngrp_btn SET buttonhelptext = 'Metrics', buttontext = 'Metrics', description = 'A home button that loads a dashboard with clinic metrics', isactive = 'Y', name = 'Metrics' WHERE bh_dbrdbtngrp_btn_uu = 'a605d489-b8fe-4d10-8139-1dac76ed7c96';
UPDATE bh_dbrdbtngrp_btn SET buttonhelptext = 'Banda Metrics', buttontext = 'Banda Metrics', description = 'Metrics', isactive = 'N', name = 'Banda Metrics' WHERE bh_dbrdbtngrp_btn_uu = 'a897946d-d939-4f38-a5c9-4aee9be6393d';
UPDATE bh_dbrdbtngrp_btn SET buttonhelptext = null, buttontext = 'My Expense Categories', description = '/expensecategories', isactive = 'Y', name = 'Expense Categories' WHERE bh_dbrdbtngrp_btn_uu = '8f5d51d4-e64e-4784-bcfa-cf96330f6422';
UPDATE bh_dbrdbtngrp_btn SET buttonhelptext = 'View Products', buttontext = 'My Products', description = '/products', isactive = 'Y', name = 'Products' WHERE bh_dbrdbtngrp_btn_uu = 'beade859-7122-41da-834f-f7a8ac5a81d5';
UPDATE bh_dbrdbtngrp_btn SET buttonhelptext = 'View Services', buttontext = 'My Services', description = '/services', isactive = 'Y', name = 'Services' WHERE bh_dbrdbtngrp_btn_uu = 'a27677ca-cc76-4595-af41-9909d5500f93';
UPDATE bh_dbrdbtngrp_btn SET buttonhelptext = 'Pay on Outstanding Balance', buttontext = 'Pay Outstanding Balance', description = '/servicedebt', isactive = 'Y', name = 'Pay Open Balance' WHERE bh_dbrdbtngrp_btn_uu = 'f0a2ba7a-765c-4239-bb91-910ee85e6017';
UPDATE bh_dbrdbtngrp_btn SET buttonhelptext = 'Create Patient Bill', buttontext = 'Create Patient Bill', description = '/visits', isactive = 'Y', name = 'Visits/Bills' WHERE bh_dbrdbtngrp_btn_uu = '35e36aad-3667-4212-80b1-7693725db473';
UPDATE bh_dbrdbtngrp_btn SET buttonhelptext = 'Balance My Stock Levels', buttontext = 'Balance My Stock Levels', description = '/stocktake', isactive = 'Y', name = 'Manage Inventory' WHERE bh_dbrdbtngrp_btn_uu = 'a3ce69ef-8577-4458-a0c2-94f7606088da';
UPDATE bh_dbrdbtngrp_btn SET buttonhelptext = 'Receive My Products', buttontext = 'Receive My Products', description = '/receiveproducts', isactive = 'Y', name = 'Receive Products' WHERE bh_dbrdbtngrp_btn_uu = '674a0a2b-2eda-4502-984e-2ee4b63dcc7a';
UPDATE bh_dbrdbtngrp_btn SET buttonhelptext = 'Enter vendors into the system', buttontext = 'My Suppliers', description = '/suppliers', isactive = 'Y', name = 'Suppliers' WHERE bh_dbrdbtngrp_btn_uu = '64746aed-41f0-4cef-a7d8-3c574d12639f';
UPDATE bh_dbrdbtngrp_btn SET buttonhelptext = 'Enter patients into the system', buttontext = 'My Patients', description = '/patients', isactive = 'Y', name = 'Patients' WHERE bh_dbrdbtngrp_btn_uu = '4dd0e4df-20bc-48cd-9bb9-358af7954601';
UPDATE bh_dbrdbtngrp_btn SET buttonhelptext = 'Track your expenses ', buttontext = 'Track My Expenses', description = '/expenses', isactive = 'Y', name = 'Track Expenses' WHERE bh_dbrdbtngrp_btn_uu = '2bd2f18b-7fe9-4079-b074-8dc113b98714';

/**********************************************************************************************************/
-- Add translation tables for the Tab Navigation Buttons
/**********************************************************************************************************/
create table if not exists bh_tabnavbtn_trl
(
	ad_client_id numeric(10) not null,
	ad_language varchar(6) not null,
	ad_org_id numeric(10) not null,
	bh_tabnavbtn_id numeric(10) not null,
	bh_tabnavbtn_trl_uu varchar(36),
	buttonhelptext varchar(100),
	buttontext varchar(100),
	created timestamp default statement_timestamp() not null,
	createdby numeric(10) not null,
	description varchar(255),
	help varchar(2000),
	isactive char default 'Y'::bpchar not null,
	istranslated char not null,
	name varchar(60) not null,
	updated timestamp default statement_timestamp() not null,
	updatedby numeric(10) not null,
	constraint pk_bh_tabnavbtn_trl
		primary key (bh_tabnavbtn_id, ad_language),
	constraint bh_tabnavbtn_trl_uu_idx
		unique (bh_tabnavbtn_trl_uu),
	constraint adlanguage_bhtabnavbtntrl
		foreign key (ad_language) references ad_language,
	constraint bhtabnavbtn_bhtabnavbtntrl
		foreign key (bh_tabnavbtn_id) references bh_tabnavbtn,
	constraint bh_tabnavbtn_trl_isactive_check
		check (isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar])),
	constraint bh_tabnavbtn_trl_istranslated_check
		check (istranslated = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))
);

create table if not exists bh_tabnavbtn_tab_trl
(
	ad_client_id numeric(10) not null,
	ad_language varchar(6) not null,
	ad_org_id numeric(10) not null,
	bh_tabnavbtn_tab_id numeric(10) not null,
	bh_tabnavbtn_tab_trl_uu varchar(36),
	buttonhelptext varchar(100),
	buttontext varchar(100),
	created timestamp default statement_timestamp() not null,
	createdby numeric(10) not null,
	description varchar(255),
	help varchar(2000),
	isactive char default 'Y'::bpchar not null,
	istranslated char not null,
	name varchar(60) not null,
	updated timestamp default statement_timestamp() not null,
	updatedby numeric(10) not null,
	constraint pk_bh_tabnavbtn_tab_trl
		primary key (bh_tabnavbtn_tab_id, ad_language),
	constraint bh_tabnavbtn_tab_trl_uu_idx
		unique (bh_tabnavbtn_tab_trl_uu),
	constraint adlanguage_bhtabnavbtntabtrl
		foreign key (ad_language) references ad_language,
	constraint bhtabnavbtntab_bhtabnavbtntabt
		foreign key (bh_tabnavbtn_tab_id) references bh_tabnavbtn_tab,
	constraint bh_tabnavbtn_tab_trl_isactive_check
		check (isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar])),
	constraint bh_tabnavbtn_tab_trl_istranslated_check
		check (istranslated = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))
);

/**********************************************************************************************************/
-- Add the translation tables to ad_table and their information to ad_column
/**********************************************************************************************************/
INSERT INTO ad_table (ad_table_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, tablename, isview, accesslevel, entitytype, ad_window_id, ad_val_rule_id, loadseq, issecurityenabled, isdeleteable, ishighvolume, importtable, ischangelog, replicationtype, po_window_id, copycolumnsfromtable, iscentrallymaintained, ad_table_uu, processing, databaseviewdrop, copycomponentsfromview) VALUES ((SELECT MAX(ad_table_id) + 1 FROM ad_table), 0, 0, 'Y', '2019-03-20 15:40:23.508000', 100, '2019-03-20 15:40:23.508000', 100, 'Tab Navigation Button Trl', null, null, 'BH_TabNavBtn_Trl', 'N', '4', 'U', null, null, 0, 'N', 'Y', 'N', 'N', 'Y', 'L', null, 'N', 'Y', '4c370235-d820-423c-8b3f-c8c3916d3dd5', 'N', 'N', 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_table (ad_table_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, tablename, isview, accesslevel, entitytype, ad_window_id, ad_val_rule_id, loadseq, issecurityenabled, isdeleteable, ishighvolume, importtable, ischangelog, replicationtype, po_window_id, copycolumnsfromtable, iscentrallymaintained, ad_table_uu, processing, databaseviewdrop, copycomponentsfromview) VALUES ((SELECT MAX(ad_table_id) + 1 FROM ad_table), 0, 0, 'Y', '2019-03-20 15:40:25.478000', 100, '2019-03-20 15:40:25.478000', 100, 'BH_TabNavBtn_Tab Trl', null, null, 'BH_TabNavBtn_Tab_Trl', 'N', '4', 'U', null, null, 0, 'N', 'Y', 'N', 'N', 'Y', 'L', null, 'N', 'Y', '26bdcace-6017-4f2a-a6da-30ac647c3345', 'N', 'N', 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_table (ad_table_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, tablename, isview, accesslevel, entitytype, ad_window_id, ad_val_rule_id, loadseq, issecurityenabled, isdeleteable, ishighvolume, importtable, ischangelog, replicationtype, po_window_id, copycolumnsfromtable, iscentrallymaintained, ad_table_uu, processing, databaseviewdrop, copycomponentsfromview) VALUES ((SELECT MAX(ad_table_id) + 1 FROM ad_table), 0, 0, 'Y', '2019-03-20 15:39:51.012000', 100, '2019-03-20 15:39:51.012000', 100, 'BH_DbrdBtnGrp_ID Trl', null, null, 'BH_DbrdBtnGrp_Trl', 'N', '4', 'U', null, null, 0, 'N', 'Y', 'N', 'N', 'Y', 'L', null, 'N', 'Y', '341b5918-206b-4c7d-98f7-31c09d74bb66', 'N', 'N', 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_table (ad_table_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, tablename, isview, accesslevel, entitytype, ad_window_id, ad_val_rule_id, loadseq, issecurityenabled, isdeleteable, ishighvolume, importtable, ischangelog, replicationtype, po_window_id, copycolumnsfromtable, iscentrallymaintained, ad_table_uu, processing, databaseviewdrop, copycomponentsfromview) VALUES ((SELECT MAX(ad_table_id) + 1 FROM ad_table), 0, 0, 'Y', '2019-03-20 15:39:52.505000', 100, '2019-03-20 15:39:52.505000', 100, 'BH_DbrdBtnGrp_Btn_ID Trl', null, null, 'BH_DbrdBtnGrp_Btn_Trl', 'N', '4', 'U', null, null, 0, 'N', 'Y', 'N', 'N', 'Y', 'L', null, 'N', 'Y', 'bfc62de5-8dd4-4aea-a3c4-24307b97b97c', 'N', 'N', 'N') ON CONFLICT DO NOTHING;

INSERT INTO ad_element (ad_element_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, columnname, entitytype, name, printname, description, help, po_name, po_printname, po_description, po_help, ad_element_uu, placeholder) VALUES ((SELECT MAX(ad_element_id) + 1 FROM ad_element), 0, 0, 'Y', '2019-02-27 12:58:25.781000', 100, '2019-02-27 12:58:25.781000', 100, 'BH_TabNavBtn_ID', 'U', 'Tab Navigation Button', 'Tab Navigation Button', null, null, null, null, null, null, '5db836e2-b810-41bf-99df-2b9dd5ba3ee8', null) ON CONFLICT DO NOTHING;
INSERT INTO ad_element (ad_element_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, columnname, entitytype, name, printname, description, help, po_name, po_printname, po_description, po_help, ad_element_uu, placeholder) VALUES ((SELECT MAX(ad_element_id) + 1 FROM ad_element), 0, 0, 'Y', '2019-02-27 12:58:26.141000', 100, '2019-02-27 12:58:26.141000', 100, 'ButtonText', 'U', 'Button Text', 'Button Text', 'The text displayed in the button', null, null, null, null, null, 'd08b41d9-1d66-4ed7-8862-d7a3ed1a89b5', null) ON CONFLICT DO NOTHING;
INSERT INTO ad_element (ad_element_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, columnname, entitytype, name, printname, description, help, po_name, po_printname, po_description, po_help, ad_element_uu, placeholder) VALUES ((SELECT MAX(ad_element_id) + 1 FROM ad_element), 0, 0, 'Y', '2019-02-27 12:58:26.179000', 100, '2019-02-27 12:58:26.179000', 100, 'ButtonHelpText', 'U', 'Button Help Text', 'Button Help Text', 'The text displayed when a user hovers over the button', null, null, null, null, null, 'b51d65fe-6be7-4280-ac50-9ef4b752f9c3', null) ON CONFLICT DO NOTHING;
INSERT INTO ad_element (ad_element_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, columnname, entitytype, name, printname, description, help, po_name, po_printname, po_description, po_help, ad_element_uu, placeholder) VALUES ((SELECT MAX(ad_element_id) + 1 FROM ad_element), 0, 0, 'Y', '2019-02-27 12:58:27.401000', 100, '2019-02-27 12:58:27.401000', 100, 'BH_TabNavBtn_Tab_ID', 'U', 'BH_TabNavBtn_Tab', 'BH_TabNavBtn_Tab', null, null, null, null, null, null, '02bf1619-2aff-49c4-94b0-35a6a8e48a27', null) ON CONFLICT DO NOTHING;
INSERT INTO ad_element (ad_element_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, columnname, entitytype, name, printname, description, help, po_name, po_printname, po_description, po_help, ad_element_uu, placeholder) VALUES ((SELECT MAX(ad_element_id) + 1 FROM ad_element), 0, 0, 'Y', '2019-03-01 08:14:46.437000', 100, '2019-03-20 15:39:47.596000', 100, 'BH_DbrdBtnGrp_ID', 'U', 'BH_DbrdBtnGrp_ID', 'Button Group', null, null, null, null, null, null, '6a6d008b-3531-4c75-8483-5f4b859a6dfe', null) ON CONFLICT DO NOTHING;
INSERT INTO ad_element (ad_element_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, columnname, entitytype, name, printname, description, help, po_name, po_printname, po_description, po_help, ad_element_uu, placeholder) VALUES ((SELECT MAX(ad_element_id) + 1 FROM ad_element), 0, 0, 'Y', '2019-03-01 08:14:46.855000', 100, '2019-03-20 15:39:49.330000', 100, 'BH_DbrdBtnGrp_Btn_ID', 'U', 'BH_DbrdBtnGrp_Btn_ID', 'BH_DbrdBtnGrp_Btn_ID', null, null, null, null, null, null, '616de46c-495b-44b3-aa37-ac230f6b404c', null) ON CONFLICT DO NOTHING;
INSERT INTO ad_element (ad_element_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, columnname, entitytype, name, printname, description, help, po_name, po_printname, po_description, po_help, ad_element_uu, placeholder) VALUES ((SELECT MAX(ad_element_id) + 1 FROM ad_element), 0, 0, 'Y', '2019-03-20 15:39:51.493000', 100, '2019-03-20 15:39:51.493000', 100, 'BH_DbrdBtnGrp_Trl_UU', 'U', 'BH_DbrdBtnGrp_Trl_UU', 'BH_DbrdBtnGrp_Trl_UU', null, null, null, null, null, null, 'ec3b4a4d-5026-4bdf-b7bd-ae756981ba2e', null) ON CONFLICT DO NOTHING;
INSERT INTO ad_element (ad_element_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, columnname, entitytype, name, printname, description, help, po_name, po_printname, po_description, po_help, ad_element_uu, placeholder) VALUES ((SELECT MAX(ad_element_id) + 1 FROM ad_element), 0, 0, 'Y', '2019-03-20 15:39:53.192000', 100, '2019-03-20 15:39:53.192000', 100, 'BH_DbrdBtnGrp_Btn_Trl_UU', 'U', 'BH_DbrdBtnGrp_Btn_Trl_UU', 'BH_DbrdBtnGrp_Btn_Trl_UU', null, null, null, null, null, null, '1b62f6ad-569b-4bb3-b8eb-99ac7087fb5e', null) ON CONFLICT DO NOTHING;
INSERT INTO ad_element (ad_element_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, columnname, entitytype, name, printname, description, help, po_name, po_printname, po_description, po_help, ad_element_uu, placeholder) VALUES ((SELECT MAX(ad_element_id) + 1 FROM ad_element), 0, 0, 'Y', '2019-03-20 15:40:23.695000', 100, '2019-03-20 15:40:23.695000', 100, 'BH_TabNavBtn_Trl_UU', 'U', 'BH_TabNavBtn_Trl_UU', 'BH_TabNavBtn_Trl_UU', null, null, null, null, null, null, '13609c8e-f231-4390-a19c-d32ef903c3ed', null) ON CONFLICT DO NOTHING;
INSERT INTO ad_element (ad_element_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, columnname, entitytype, name, printname, description, help, po_name, po_printname, po_description, po_help, ad_element_uu, placeholder) VALUES ((SELECT MAX(ad_element_id) + 1 FROM ad_element), 0, 0, 'Y', '2019-03-20 15:40:25.649000', 100, '2019-03-20 15:40:25.649000', 100, 'BH_TabNavBtn_Tab_Trl_UU', 'U', 'BH_TabNavBtn_Tab_Trl_UU', 'BH_TabNavBtn_Tab_Trl_UU', null, null, null, null, null, null, '46841473-bb35-4709-a091-d6dffa56a62d', null) ON CONFLICT DO NOTHING;

INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:40:24.683000', '2019-03-20 15:40:24.683000', 100, 100, 'Button Text', 'The text displayed in the button', null, 0, 'U', 'ButtonText', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_TabNavBtn_Trl'), 10, null, null, 100, null, 'N', 'N', 'N', 'Y', null, 'N', 0, 'N', 'N', null, null, null, null, 'N', (SELECT ad_element_id FROM ad_element WHERE columnname = 'ButtonText'), null, 'Y', 'N', null, null, null, 'N', 'Y', null, '3b7ffd7d-0988-49b0-a340-83fae0d4dda3', 'Y', 0, 'N', 'N', null, null, 'N', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:40:25.591000', '2019-03-20 15:40:25.591000', 100, 100, 'BH_TabNavBtn_Tab', null, null, 1, 'U', 'BH_TabNavBtn_Tab_ID', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_TabNavBtn_Tab_Trl'), 19, null, null, 22, null, 'N', 'Y', 'Y', 'N', null, 'N', null, 'N', 'N', null, null, null, null, 'N', (SELECT ad_element_id FROM ad_element WHERE columnname = 'BH_TabNavBtn_Tab_ID'), null, 'Y', 'N', null, null, null, 'N', 'Y', null, '82096049-636a-4a15-91c0-fe1dd8ef4513', 'Y', null, 'N', 'N', null, 'BHTabNavBtnTab_BHTabNavBtnTabT', 'N', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:40:25.687000', '2019-03-20 15:40:25.687000', 100, 100, 'BH_TabNavBtn_Tab_Trl_UU', null, null, 1, 'U', 'BH_TabNavBtn_Tab_Trl_UU', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_TabNavBtn_Tab_Trl'), 10, null, null, 36, null, 'N', 'N', 'N', 'Y', null, 'N', null, 'N', 'N', null, null, null, null, 'N', (SELECT ad_element_id FROM ad_element WHERE columnname = 'BH_TabNavBtn_Tab_Trl_UU'), null, 'Y', 'N', null, null, null, 'N', 'Y', null, '256de63b-cc83-42a6-ab18-8c2cdc9b950f', 'N', null, 'N', 'N', null, null, 'N', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:40:24.744000', '2019-03-20 15:40:24.744000', 100, 100, 'Button Help Text', 'The text displayed when a user hovers over the button', null, 0, 'U', 'ButtonHelpText', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_TabNavBtn_Trl'), 10, null, null, 100, null, 'N', 'N', 'N', 'Y', null, 'N', 0, 'N', 'N', null, null, null, null, 'N', (SELECT ad_element_id FROM ad_element WHERE columnname = 'ButtonHelpText'), null, 'Y', 'N', null, null, null, 'N', 'Y', null, 'f526d882-ab49-4574-bfc8-c25d8ed5cde6', 'Y', 0, 'N', 'N', null, null, 'N', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:39:51.134000', '2019-03-20 15:39:51.134000', 100, 100, 'Client', 'Client/Tenant for this installation.', 'A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.', 1, 'U', 'AD_Client_ID', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_DbrdBtnGrp_Trl'), 19, null, 129, 22, '@AD_Client_ID@', 'N', 'N', 'Y', 'N', null, 'N', null, 'N', 'N', null, null, null, null, 'N', 102, null, 'Y', 'N', null, null, null, 'N', 'Y', null, '5e93a4df-2c2d-4c20-b868-effdada7a759', 'N', null, 'N', 'N', null, null, 'D', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:39:51.218000', '2019-03-20 15:39:51.218000', 100, 100, 'Language', 'Language for this entity', 'The Language identifies the language to use for display and formatting', 1, 'U', 'AD_Language', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_DbrdBtnGrp_Trl'), 18, 106, null, 6, null, 'N', 'Y', 'Y', 'N', null, 'N', null, 'N', 'N', null, null, null, null, 'N', 109, null, 'Y', 'N', null, null, null, 'N', 'Y', null, '57e3cf66-2b65-4b50-aeaf-5319470f22aa', 'Y', null, 'N', 'N', null, 'ADLanguage_BHDbrdBtnGrpTrl', 'N', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:39:51.305000', '2019-03-20 15:39:51.305000', 100, 100, 'Organization', 'Organizational entity within client', 'An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.', 1, 'U', 'AD_Org_ID', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_DbrdBtnGrp_Trl'), 19, null, 104, 22, '@AD_Org_ID@', 'N', 'N', 'Y', 'N', null, 'N', null, 'N', 'N', null, null, null, null, 'N', 113, null, 'Y', 'N', null, null, null, 'N', 'Y', null, '22364268-898b-4336-b4f4-6d41642321ff', 'N', null, 'N', 'N', null, null, 'D', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:39:51.380000', '2019-03-20 15:39:51.380000', 100, 100, 'BH_DbrdBtnGrp_ID', null, null, 1, 'U', 'BH_DbrdBtnGrp_ID', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_DbrdBtnGrp_Trl'), 19, null, null, 22, null, 'N', 'Y', 'Y', 'N', null, 'N', null, 'N', 'N', null, null, null, null, 'N', (SELECT ad_element_id FROM ad_element WHERE columnname = 'BH_DbrdBtnGrp_ID'), null, 'Y', 'N', null, null, null, 'N', 'Y', null, '6289bbe0-a893-4dbd-93c7-9c6971f02ffa', 'Y', null, 'N', 'N', null, 'BHDbrdBtnGrp_BHDbrdBtnGrpTrl', 'N', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:39:51.555000', '2019-03-20 15:39:51.555000', 100, 100, 'BH_DbrdBtnGrp_Trl_UU', null, null, 1, 'U', 'BH_DbrdBtnGrp_Trl_UU', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_DbrdBtnGrp_Trl'), 10, null, null, 36, null, 'N', 'N', 'N', 'Y', null, 'N', null, 'N', 'N', null, null, null, null, 'N', (SELECT ad_element_id FROM ad_element WHERE columnname = 'BH_DbrdBtnGrp_Trl_UU'), null, 'Y', 'N', null, null, null, 'N', 'Y', null, 'a504bc1b-bc43-4db0-9130-9ba68dc2e6dc', 'N', null, 'N', 'N', null, null, 'N', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:39:51.629000', '2019-03-20 15:39:51.629000', 100, 100, 'Created', 'Date this record was created', 'The Created field indicates the date that this record was created.', 1, 'U', 'Created', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_DbrdBtnGrp_Trl'), 16, null, null, 7, 'SYSDATE', 'N', 'N', 'Y', 'N', null, 'N', null, 'N', 'N', null, null, null, null, 'N', 245, null, 'Y', 'N', null, null, null, 'N', 'Y', null, '5852b890-d9ae-48cb-8e42-15319b4bad51', 'N', null, 'N', 'N', null, null, 'N', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:39:51.705000', '2019-03-20 15:39:51.705000', 100, 100, 'Created By', 'User who created this records', 'The Created By field indicates the user who created this record.', 1, 'U', 'CreatedBy', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_DbrdBtnGrp_Trl'), 18, 110, null, 22, null, 'N', 'N', 'Y', 'N', null, 'N', null, 'N', 'N', null, null, null, null, 'N', 246, null, 'Y', 'N', null, null, null, 'N', 'Y', null, '6f7be414-48cd-4140-813d-f4dfe89cf6d5', 'N', null, 'N', 'N', null, null, 'D', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:39:51.783000', '2019-03-20 15:39:51.783000', 100, 100, 'Description', 'Optional short description of the record', 'A description is limited to 255 characters.', 1, 'U', 'Description', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_DbrdBtnGrp_Trl'), 10, null, null, 255, null, 'N', 'N', 'N', 'Y', null, 'N', null, 'N', 'N', null, null, null, null, 'Y', 275, null, 'Y', 'N', null, null, null, 'N', 'Y', null, 'dafea743-5148-4a7d-a7db-c282a3807a48', 'Y', null, 'N', 'N', null, null, 'N', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:39:51.868000', '2019-03-20 15:39:51.868000', 100, 100, 'Comment/Help', 'Comment or Hint', 'The Help field contains a hint, comment or help about the use of this item.', 1, 'U', 'Help', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_DbrdBtnGrp_Trl'), 14, null, null, 2000, null, 'N', 'N', 'N', 'Y', null, 'N', null, 'N', 'N', null, null, null, null, 'N', 326, null, 'Y', 'N', null, null, null, 'N', 'Y', null, 'e7e4f00b-c7c4-4566-872a-a57a817f2e8f', 'Y', null, 'N', 'N', null, null, 'N', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:39:51.934000', '2019-03-20 15:39:51.934000', 100, 100, 'Active', 'The record is active in the system', 'There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.', 1, 'U', 'IsActive', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_DbrdBtnGrp_Trl'), 20, null, null, 1, 'Y', 'N', 'N', 'Y', 'Y', null, 'N', null, 'N', 'N', null, null, null, null, 'N', 348, null, 'Y', 'N', null, null, null, 'N', 'Y', null, '0360db02-cfc4-4453-8a47-638410d8d160', 'N', null, 'N', 'N', null, null, 'N', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:39:52.092000', '2019-03-20 15:39:52.092000', 100, 100, 'Translated', 'This column is translated', 'The Translated checkbox indicates if this column is translated.', 1, 'U', 'IsTranslated', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_DbrdBtnGrp_Trl'), 20, null, null, 1, null, 'N', 'N', 'Y', 'Y', null, 'N', null, 'N', 'N', null, null, null, null, 'N', 420, null, 'Y', 'N', null, null, null, 'N', 'Y', null, '624e6cc1-c934-4d11-8668-62968f010505', 'Y', null, 'N', 'N', null, null, 'N', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:39:52.211000', '2019-03-20 15:39:52.211000', 100, 100, 'Name', 'Alphanumeric identifier of the entity', 'The name of an entity (record) is used as an default search option in addition to the search key. The name is up to 60 characters in length.', 1, 'U', 'Name', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_DbrdBtnGrp_Trl'), 10, null, null, 60, null, 'N', 'N', 'Y', 'Y', null, 'Y', 0, 'N', 'N', null, null, null, null, 'Y', 469, null, 'Y', 'N', null, null, null, 'N', 'Y', null, '3d689c26-0bf7-45a3-b3c7-ab0c42751551', 'Y', null, 'N', 'N', null, null, 'N', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:39:52.274000', '2019-03-20 15:39:52.274000', 100, 100, 'Updated', 'Date this record was updated', 'The Updated field indicates the date that this record was updated.', 1, 'U', 'Updated', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_DbrdBtnGrp_Trl'), 16, null, null, 7, 'SYSDATE', 'N', 'N', 'Y', 'N', null, 'N', null, 'N', 'N', null, null, null, null, 'N', 607, null, 'Y', 'N', null, null, null, 'N', 'Y', null, '5796479f-93a7-4b2d-94dc-1ad2f70377b0', 'N', null, 'N', 'N', null, null, 'N', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:39:52.337000', '2019-03-20 15:39:52.337000', 100, 100, 'Updated By', 'User who updated this records', 'The Updated By field indicates the user who updated this record.', 1, 'U', 'UpdatedBy', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_DbrdBtnGrp_Trl'), 18, 110, null, 22, null, 'N', 'N', 'Y', 'N', null, 'N', null, 'N', 'N', null, null, null, null, 'N', 608, null, 'Y', 'N', null, null, null, 'N', 'Y', null, '8acc400e-e0ca-4138-bc34-1d16f10f0c81', 'N', null, 'N', 'N', null, null, 'D', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:39:52.591000', '2019-03-20 15:39:52.591000', 100, 100, 'Client', 'Client/Tenant for this installation.', 'A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.', 1, 'U', 'AD_Client_ID', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_DbrdBtnGrp_Btn_Trl'), 19, null, 129, 22, '@AD_Client_ID@', 'N', 'N', 'Y', 'N', null, 'N', null, 'N', 'N', null, null, null, null, 'N', 102, null, 'Y', 'N', null, null, null, 'N', 'Y', null, 'ed9b4bfe-d682-4310-8c02-aebeb642ad3c', 'N', null, 'N', 'N', null, null, 'D', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:39:53.114000', '2019-03-20 15:39:53.114000', 100, 100, 'BH_DbrdBtnGrp_Btn_ID', null, null, 1, 'U', 'BH_DbrdBtnGrp_Btn_ID', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_DbrdBtnGrp_Btn_Trl'), 19, null, null, 22, null, 'N', 'Y', 'Y', 'N', null, 'N', null, 'N', 'N', null, null, null, null, 'N', (SELECT ad_element_id FROM ad_element WHERE columnname = 'BH_DbrdBtnGrp_Btn_ID'), null, 'Y', 'N', null, null, null, 'N', 'Y', null, '1dcf6bc3-8573-40ad-82ff-226701914d2f', 'Y', null, 'N', 'N', null, 'BHDbrdBtnGr_BHDbrdBtnGrpBtnTrl', 'N', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:39:53.247000', '2019-03-20 15:39:53.247000', 100, 100, 'BH_DbrdBtnGrp_Btn_Trl_UU', null, null, 1, 'U', 'BH_DbrdBtnGrp_Btn_Trl_UU', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_DbrdBtnGrp_Btn_Trl'), 10, null, null, 36, null, 'N', 'N', 'N', 'Y', null, 'N', null, 'N', 'N', null, null, null, null, 'N', (SELECT ad_element_id FROM ad_element WHERE columnname = 'BH_DbrdBtnGrp_Btn_Trl_UU'), null, 'Y', 'N', null, null, null, 'N', 'Y', null, 'df3747d1-adc5-4906-8e24-84686dc62761', 'N', null, 'N', 'N', null, null, 'N', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:39:53.333000', '2019-03-20 15:39:53.333000', 100, 100, 'Language', 'Language for this entity', 'The Language identifies the language to use for display and formatting', 1, 'U', 'AD_Language', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_DbrdBtnGrp_Btn_Trl'), 18, 106, null, 6, null, 'N', 'Y', 'Y', 'N', null, 'N', null, 'N', 'N', null, null, null, null, 'N', 109, null, 'Y', 'N', null, null, null, 'N', 'Y', null, '97c3c704-4f0b-47bd-89e9-c6c2f345dcca', 'Y', null, 'N', 'N', null, 'ADLanguage_BHDbrdBtnGrpBtnTrl', 'N', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:39:53.413000', '2019-03-20 15:39:53.413000', 100, 100, 'Organization', 'Organizational entity within client', 'An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.', 1, 'U', 'AD_Org_ID', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_DbrdBtnGrp_Btn_Trl'), 19, null, 104, 22, '@AD_Org_ID@', 'N', 'N', 'Y', 'N', null, 'N', null, 'N', 'N', null, null, null, null, 'N', 113, null, 'Y', 'N', null, null, null, 'N', 'Y', null, '82d78870-5ab2-4bf2-85fd-f0aca547b8b6', 'N', null, 'N', 'N', null, null, 'D', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:39:53.497000', '2019-03-20 15:39:53.497000', 100, 100, 'Created', 'Date this record was created', 'The Created field indicates the date that this record was created.', 1, 'U', 'Created', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_DbrdBtnGrp_Btn_Trl'), 16, null, null, 7, 'SYSDATE', 'N', 'N', 'Y', 'N', null, 'N', null, 'N', 'N', null, null, null, null, 'N', 245, null, 'Y', 'N', null, null, null, 'N', 'Y', null, '26b5a98a-487b-4b03-af63-6b1c5ba310d8', 'N', null, 'N', 'N', null, null, 'N', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:39:53.576000', '2019-03-20 15:39:53.576000', 100, 100, 'Created By', 'User who created this records', 'The Created By field indicates the user who created this record.', 1, 'U', 'CreatedBy', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_DbrdBtnGrp_Btn_Trl'), 18, 110, null, 22, null, 'N', 'N', 'Y', 'N', null, 'N', null, 'N', 'N', null, null, null, null, 'N', 246, null, 'Y', 'N', null, null, null, 'N', 'Y', null, '53b0eac2-d79f-4993-8e80-5047747d674b', 'N', null, 'N', 'N', null, null, 'D', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:39:53.640000', '2019-03-20 15:39:53.640000', 100, 100, 'Description', 'Optional short description of the record', 'A description is limited to 255 characters.', 1, 'U', 'Description', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_DbrdBtnGrp_Btn_Trl'), 10, null, null, 255, null, 'N', 'N', 'N', 'Y', null, 'N', null, 'N', 'N', null, null, null, null, 'Y', 275, null, 'Y', 'N', null, null, null, 'N', 'Y', null, '616860db-11bc-43de-a834-ddb6166e5e61', 'Y', null, 'N', 'N', null, null, 'N', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:39:53.709000', '2019-03-20 15:39:53.709000', 100, 100, 'Comment/Help', 'Comment or Hint', 'The Help field contains a hint, comment or help about the use of this item.', 1, 'U', 'Help', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_DbrdBtnGrp_Btn_Trl'), 14, null, null, 2000, null, 'N', 'N', 'N', 'Y', null, 'N', null, 'N', 'N', null, null, null, null, 'N', 326, null, 'Y', 'N', null, null, null, 'N', 'Y', null, '7038662e-f7af-47f7-afcd-49fac3b639a3', 'Y', null, 'N', 'N', null, null, 'N', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:39:53.795000', '2019-03-20 15:39:53.795000', 100, 100, 'Active', 'The record is active in the system', 'There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.', 1, 'U', 'IsActive', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_DbrdBtnGrp_Btn_Trl'), 20, null, null, 1, 'Y', 'N', 'N', 'Y', 'Y', null, 'N', null, 'N', 'N', null, null, null, null, 'N', 348, null, 'Y', 'N', null, null, null, 'N', 'Y', null, '7b7449a2-adb3-41fd-875c-000f52c79cfe', 'N', null, 'N', 'N', null, null, 'N', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:39:53.930000', '2019-03-20 15:39:53.930000', 100, 100, 'Translated', 'This column is translated', 'The Translated checkbox indicates if this column is translated.', 1, 'U', 'IsTranslated', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_DbrdBtnGrp_Btn_Trl'), 20, null, null, 1, null, 'N', 'N', 'Y', 'Y', null, 'N', null, 'N', 'N', null, null, null, null, 'N', 420, null, 'Y', 'N', null, null, null, 'N', 'Y', null, 'fb43ef2e-9662-4080-b544-11835bc6a2d8', 'Y', null, 'N', 'N', null, null, 'N', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:39:54.055000', '2019-03-20 15:39:54.055000', 100, 100, 'Name', 'Alphanumeric identifier of the entity', 'The name of an entity (record) is used as an default search option in addition to the search key. The name is up to 60 characters in length.', 1, 'U', 'Name', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_DbrdBtnGrp_Btn_Trl'), 10, null, null, 60, null, 'N', 'N', 'Y', 'Y', null, 'Y', 0, 'N', 'N', null, null, null, null, 'Y', 469, null, 'Y', 'N', null, null, null, 'N', 'Y', null, '7e816ba4-17c9-4018-b279-a57464b77028', 'Y', null, 'N', 'N', null, null, 'N', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:39:54.142000', '2019-03-20 15:39:54.142000', 100, 100, 'Updated', 'Date this record was updated', 'The Updated field indicates the date that this record was updated.', 1, 'U', 'Updated', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_DbrdBtnGrp_Btn_Trl'), 16, null, null, 7, 'SYSDATE', 'N', 'N', 'Y', 'N', null, 'N', null, 'N', 'N', null, null, null, null, 'N', 607, null, 'Y', 'N', null, null, null, 'N', 'Y', null, 'f9a81d2a-8276-4c51-9e4c-8bbeefc4c6a3', 'N', null, 'N', 'N', null, null, 'N', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:39:54.220000', '2019-03-20 15:39:54.220000', 100, 100, 'Updated By', 'User who updated this records', 'The Updated By field indicates the user who updated this record.', 1, 'U', 'UpdatedBy', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_DbrdBtnGrp_Btn_Trl'), 18, 110, null, 22, null, 'N', 'N', 'Y', 'N', null, 'N', null, 'N', 'N', null, null, null, null, 'N', 608, null, 'Y', 'N', null, null, null, 'N', 'Y', null, 'dafd310e-1baf-4adc-afe4-6e6d18aab2dd', 'N', null, 'N', 'N', null, null, 'D', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:39:54.296000', '2019-03-20 15:39:54.296000', 100, 100, 'Button Help Text', 'The text displayed when a user hovers over the button', null, 0, 'U', 'ButtonHelpText', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_DbrdBtnGrp_Btn_Trl'), 10, null, null, 100, null, 'N', 'N', 'N', 'Y', null, 'N', 0, 'N', 'N', null, null, null, null, 'N', (SELECT ad_element_id FROM ad_element WHERE columnname = 'ButtonHelpText'), null, 'Y', 'N', null, null, null, 'N', 'Y', null, 'b2ad4af2-8030-4da8-991e-2450b911f73f', 'Y', 0, 'N', 'N', null, null, 'N', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:39:54.368000', '2019-03-20 15:39:54.368000', 100, 100, 'Button Text', 'The text displayed in the button', null, 0, 'U', 'ButtonText', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_DbrdBtnGrp_Btn_Trl'), 10, null, null, 100, null, 'N', 'N', 'N', 'Y', null, 'N', 0, 'N', 'N', null, null, null, null, 'N', (SELECT ad_element_id FROM ad_element WHERE columnname = 'ButtonText'), null, 'Y', 'N', null, null, null, 'N', 'Y', null, 'e6b3fbf3-e0dc-41f2-bb5b-4d95413a5c6a', 'Y', 0, 'N', 'N', null, null, 'N', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:40:24.566000', '2019-03-20 15:40:24.566000', 100, 100, 'Updated', 'Date this record was updated', 'The Updated field indicates the date that this record was updated.', 1, 'U', 'Updated', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_TabNavBtn_Trl'), 16, null, null, 7, 'SYSDATE', 'N', 'N', 'Y', 'N', null, 'N', null, 'N', 'N', null, null, null, null, 'N', 607, null, 'Y', 'N', null, null, null, 'N', 'Y', null, 'bb74486d-b3c3-414b-b203-c9d56380a8dc', 'N', null, 'N', 'N', null, null, 'N', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:40:24.622000', '2019-03-20 15:40:24.622000', 100, 100, 'Updated By', 'User who updated this records', 'The Updated By field indicates the user who updated this record.', 1, 'U', 'UpdatedBy', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_TabNavBtn_Trl'), 18, 110, null, 22, null, 'N', 'N', 'Y', 'N', null, 'N', null, 'N', 'N', null, null, null, null, 'N', 608, null, 'Y', 'N', null, null, null, 'N', 'Y', null, '6bddaace-5de7-4c9a-a7cc-35a8828f2c40', 'N', null, 'N', 'N', null, null, 'D', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:40:23.565000', '2019-03-20 15:40:23.565000', 100, 100, 'Client', 'Client/Tenant for this installation.', 'A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.', 1, 'U', 'AD_Client_ID', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_TabNavBtn_Trl'), 19, null, 129, 22, '@AD_Client_ID@', 'N', 'N', 'Y', 'N', null, 'N', null, 'N', 'N', null, null, null, null, 'N', 102, null, 'Y', 'N', null, null, null, 'N', 'Y', null, 'fcf1b786-e684-4ba9-83d2-80f2aaa6cb1b', 'N', null, 'N', 'N', null, null, 'D', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:40:23.634000', '2019-03-20 15:40:23.634000', 100, 100, 'Tab Navigation Button', null, null, 1, 'U', 'BH_TabNavBtn_ID', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_TabNavBtn_Trl'), 19, null, null, 22, null, 'N', 'Y', 'Y', 'N', null, 'N', null, 'N', 'N', null, null, null, null, 'N', (SELECT ad_element_id FROM ad_element WHERE columnname = 'BH_TabNavBtn_ID'), null, 'Y', 'N', null, null, null, 'N', 'Y', null, '29d0fd45-8bfa-4cd3-82a5-c2203f8c84dd', 'Y', null, 'N', 'N', null, 'BHTabNavBtn_BHTabNavBtnTrl', 'N', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:40:23.725000', '2019-03-20 15:40:23.725000', 100, 100, 'BH_TabNavBtn_Trl_UU', null, null, 1, 'U', 'BH_TabNavBtn_Trl_UU', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_TabNavBtn_Trl'), 10, null, null, 36, null, 'N', 'N', 'N', 'Y', null, 'N', null, 'N', 'N', null, null, null, null, 'N', (SELECT ad_element_id FROM ad_element WHERE columnname = 'BH_TabNavBtn_Trl_UU'), null, 'Y', 'N', null, null, null, 'N', 'Y', null, '5945b85d-578c-46e8-8fa9-05a7411410f3', 'N', null, 'N', 'N', null, null, 'N', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:40:23.791000', '2019-03-20 15:40:23.791000', 100, 100, 'Language', 'Language for this entity', 'The Language identifies the language to use for display and formatting', 1, 'U', 'AD_Language', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_TabNavBtn_Trl'), 18, 106, null, 6, null, 'N', 'Y', 'Y', 'N', null, 'N', null, 'N', 'N', null, null, null, null, 'N', 109, null, 'Y', 'N', null, null, null, 'N', 'Y', null, 'cc6ebb21-3aa1-4336-84e8-490f8f752351', 'Y', null, 'N', 'N', null, 'ADLanguage_BHTabNavBtnTrl', 'N', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:40:23.922000', '2019-03-20 15:40:23.922000', 100, 100, 'Organization', 'Organizational entity within client', 'An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.', 1, 'U', 'AD_Org_ID', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_TabNavBtn_Trl'), 19, null, 104, 22, '@AD_Org_ID@', 'N', 'N', 'Y', 'N', null, 'N', null, 'N', 'N', null, null, null, null, 'N', 113, null, 'Y', 'N', null, null, null, 'N', 'Y', null, '84849e89-3153-40db-bd51-733076869e27', 'N', null, 'N', 'N', null, null, 'D', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:40:23.994000', '2019-03-20 15:40:23.994000', 100, 100, 'Created', 'Date this record was created', 'The Created field indicates the date that this record was created.', 1, 'U', 'Created', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_TabNavBtn_Trl'), 16, null, null, 7, 'SYSDATE', 'N', 'N', 'Y', 'N', null, 'N', null, 'N', 'N', null, null, null, null, 'N', 245, null, 'Y', 'N', null, null, null, 'N', 'Y', null, '97ea89fc-c3bd-4b1d-8e18-127309c6090d', 'N', null, 'N', 'N', null, null, 'N', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:40:24.072000', '2019-03-20 15:40:24.072000', 100, 100, 'Created By', 'User who created this records', 'The Created By field indicates the user who created this record.', 1, 'U', 'CreatedBy', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_TabNavBtn_Trl'), 18, 110, null, 22, null, 'N', 'N', 'Y', 'N', null, 'N', null, 'N', 'N', null, null, null, null, 'N', 246, null, 'Y', 'N', null, null, null, 'N', 'Y', null, 'c90909af-f922-4d6a-a053-917df6483c00', 'N', null, 'N', 'N', null, null, 'D', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:40:24.139000', '2019-03-20 15:40:24.139000', 100, 100, 'Description', 'Optional short description of the record', 'A description is limited to 255 characters.', 1, 'U', 'Description', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_TabNavBtn_Trl'), 10, null, null, 255, null, 'N', 'N', 'N', 'Y', null, 'N', null, 'N', 'N', null, null, null, null, 'Y', 275, null, 'Y', 'N', null, null, null, 'N', 'Y', null, '99a60fc5-7be7-400c-8f03-eb3397029e8b', 'Y', null, 'N', 'N', null, null, 'N', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:40:24.206000', '2019-03-20 15:40:24.206000', 100, 100, 'Comment/Help', 'Comment or Hint', 'The Help field contains a hint, comment or help about the use of this item.', 1, 'U', 'Help', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_TabNavBtn_Trl'), 14, null, null, 2000, null, 'N', 'N', 'N', 'Y', null, 'N', null, 'N', 'N', null, null, null, null, 'N', 326, null, 'Y', 'N', null, null, null, 'N', 'Y', null, '6b75e8e8-2766-45fd-baf9-1276609ce320', 'Y', null, 'N', 'N', null, null, 'N', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:40:24.268000', '2019-03-20 15:40:24.268000', 100, 100, 'Active', 'The record is active in the system', 'There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.', 1, 'U', 'IsActive', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_TabNavBtn_Trl'), 20, null, null, 1, 'Y', 'N', 'N', 'Y', 'Y', null, 'N', null, 'N', 'N', null, null, null, null, 'N', 348, null, 'Y', 'N', null, null, null, 'N', 'Y', null, '17806429-ea45-4ca8-b368-956929715372', 'N', null, 'N', 'N', null, null, 'N', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:40:24.391000', '2019-03-20 15:40:24.391000', 100, 100, 'Translated', 'This column is translated', 'The Translated checkbox indicates if this column is translated.', 1, 'U', 'IsTranslated', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_TabNavBtn_Trl'), 20, null, null, 1, null, 'N', 'N', 'Y', 'Y', null, 'N', null, 'N', 'N', null, null, null, null, 'N', 420, null, 'Y', 'N', null, null, null, 'N', 'Y', null, 'f3b1f40a-c93c-45b5-983c-652caeb8d86d', 'Y', null, 'N', 'N', null, null, 'N', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:40:24.496000', '2019-03-20 15:40:24.496000', 100, 100, 'Name', 'Alphanumeric identifier of the entity', 'The name of an entity (record) is used as an default search option in addition to the search key. The name is up to 60 characters in length.', 1, 'U', 'Name', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_TabNavBtn_Trl'), 10, null, null, 60, null, 'N', 'N', 'Y', 'Y', null, 'Y', 0, 'N', 'N', null, null, null, null, 'Y', 469, null, 'Y', 'N', null, null, null, 'N', 'Y', null, 'c3fb4736-1a71-45a8-84f9-7f032268e7cd', 'Y', null, 'N', 'N', null, null, 'N', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:40:25.531000', '2019-03-20 15:40:25.531000', 100, 100, 'Client', 'Client/Tenant for this installation.', 'A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.', 1, 'U', 'AD_Client_ID', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_TabNavBtn_Tab_Trl'), 19, null, 129, 22, '@AD_Client_ID@', 'N', 'N', 'Y', 'N', null, 'N', null, 'N', 'N', null, null, null, null, 'N', 102, null, 'Y', 'N', null, null, null, 'N', 'Y', null, '18c4db9c-569f-4ed1-9f6b-7b9f11403603', 'N', null, 'N', 'N', null, null, 'D', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:40:25.744000', '2019-03-20 15:40:25.744000', 100, 100, 'Language', 'Language for this entity', 'The Language identifies the language to use for display and formatting', 1, 'U', 'AD_Language', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_TabNavBtn_Tab_Trl'), 18, 106, null, 6, null, 'N', 'Y', 'Y', 'N', null, 'N', null, 'N', 'N', null, null, null, null, 'N', 109, null, 'Y', 'N', null, null, null, 'N', 'Y', null, '563772ed-382b-4052-b5c0-22e2a2c48bb1', 'Y', null, 'N', 'N', null, 'ADLanguage_BHTabNavBtnTabTrl', 'N', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:40:25.816000', '2019-03-20 15:40:25.816000', 100, 100, 'Organization', 'Organizational entity within client', 'An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.', 1, 'U', 'AD_Org_ID', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_TabNavBtn_Tab_Trl'), 19, null, 104, 22, '@AD_Org_ID@', 'N', 'N', 'Y', 'N', null, 'N', null, 'N', 'N', null, null, null, null, 'N', 113, null, 'Y', 'N', null, null, null, 'N', 'Y', null, '3c4f4c9e-f710-4fed-b73b-3e5d71d8908c', 'N', null, 'N', 'N', null, null, 'D', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:40:25.883000', '2019-03-20 15:40:25.883000', 100, 100, 'Created', 'Date this record was created', 'The Created field indicates the date that this record was created.', 1, 'U', 'Created', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_TabNavBtn_Tab_Trl'), 16, null, null, 7, 'SYSDATE', 'N', 'N', 'Y', 'N', null, 'N', null, 'N', 'N', null, null, null, null, 'N', 245, null, 'Y', 'N', null, null, null, 'N', 'Y', null, 'da1fed38-bf1d-4dd2-a97d-a647613239ef', 'N', null, 'N', 'N', null, null, 'N', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:40:25.950000', '2019-03-20 15:40:25.950000', 100, 100, 'Created By', 'User who created this records', 'The Created By field indicates the user who created this record.', 1, 'U', 'CreatedBy', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_TabNavBtn_Tab_Trl'), 18, 110, null, 22, null, 'N', 'N', 'Y', 'N', null, 'N', null, 'N', 'N', null, null, null, null, 'N', 246, null, 'Y', 'N', null, null, null, 'N', 'Y', null, '5a8e20db-9ebf-47b7-ad56-a8d19d4d1a3e', 'N', null, 'N', 'N', null, null, 'D', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:40:26.014000', '2019-03-20 15:40:26.014000', 100, 100, 'Description', 'Optional short description of the record', 'A description is limited to 255 characters.', 1, 'U', 'Description', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_TabNavBtn_Tab_Trl'), 10, null, null, 255, null, 'N', 'N', 'N', 'Y', null, 'N', null, 'N', 'N', null, null, null, null, 'Y', 275, null, 'Y', 'N', null, null, null, 'N', 'Y', null, 'f7489542-f275-4583-b4be-9e6466f20952', 'Y', null, 'N', 'N', null, null, 'N', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:40:26.077000', '2019-03-20 15:40:26.077000', 100, 100, 'Comment/Help', 'Comment or Hint', 'The Help field contains a hint, comment or help about the use of this item.', 1, 'U', 'Help', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_TabNavBtn_Tab_Trl'), 14, null, null, 2000, null, 'N', 'N', 'N', 'Y', null, 'N', null, 'N', 'N', null, null, null, null, 'N', 326, null, 'Y', 'N', null, null, null, 'N', 'Y', null, 'c04df129-7493-4e9a-b4c6-41ae108d6816', 'Y', null, 'N', 'N', null, null, 'N', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:40:26.165000', '2019-03-20 15:40:26.165000', 100, 100, 'Active', 'The record is active in the system', 'There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.', 1, 'U', 'IsActive', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_TabNavBtn_Tab_Trl'), 20, null, null, 1, 'Y', 'N', 'N', 'Y', 'Y', null, 'N', null, 'N', 'N', null, null, null, null, 'N', 348, null, 'Y', 'N', null, null, null, 'N', 'Y', null, '1b316cfc-a0b4-4629-9a7c-4f450f0a346f', 'N', null, 'N', 'N', null, null, 'N', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:40:26.308000', '2019-03-20 15:40:26.308000', 100, 100, 'Translated', 'This column is translated', 'The Translated checkbox indicates if this column is translated.', 1, 'U', 'IsTranslated', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_TabNavBtn_Tab_Trl'), 20, null, null, 1, null, 'N', 'N', 'Y', 'Y', null, 'N', null, 'N', 'N', null, null, null, null, 'N', 420, null, 'Y', 'N', null, null, null, 'N', 'Y', null, '2ea28583-4dbc-4b31-ad44-6e11d64fdcdc', 'Y', null, 'N', 'N', null, null, 'N', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:40:26.422000', '2019-03-20 15:40:26.422000', 100, 100, 'Name', 'Alphanumeric identifier of the entity', 'The name of an entity (record) is used as an default search option in addition to the search key. The name is up to 60 characters in length.', 1, 'U', 'Name', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_TabNavBtn_Tab_Trl'), 10, null, null, 60, null, 'N', 'N', 'Y', 'Y', null, 'Y', 0, 'N', 'N', null, null, null, null, 'Y', 469, null, 'Y', 'N', null, null, null, 'N', 'Y', null, 'ee1c898b-8e4c-4ab5-b697-302ec9805d72', 'Y', null, 'N', 'N', null, null, 'N', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:40:26.482000', '2019-03-20 15:40:26.482000', 100, 100, 'Updated', 'Date this record was updated', 'The Updated field indicates the date that this record was updated.', 1, 'U', 'Updated', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_TabNavBtn_Tab_Trl'), 16, null, null, 7, 'SYSDATE', 'N', 'N', 'Y', 'N', null, 'N', null, 'N', 'N', null, null, null, null, 'N', 607, null, 'Y', 'N', null, null, null, 'N', 'Y', null, '0e2d724b-245c-4aee-b833-4c7a5325dac6', 'N', null, 'N', 'N', null, null, 'N', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:40:26.538000', '2019-03-20 15:40:26.538000', 100, 100, 'Updated By', 'User who updated this records', 'The Updated By field indicates the user who updated this record.', 1, 'U', 'UpdatedBy', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_TabNavBtn_Tab_Trl'), 18, 110, null, 22, null, 'N', 'N', 'Y', 'N', null, 'N', null, 'N', 'N', null, null, null, null, 'N', 608, null, 'Y', 'N', null, null, null, 'N', 'Y', null, 'a4c46ca7-0f6d-4958-8a1c-677ce1f0e277', 'N', null, 'N', 'N', null, null, 'D', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:40:26.601000', '2019-03-20 15:40:26.601000', 100, 100, 'Button Help Text', 'The text displayed when a user hovers over the button', null, 0, 'U', 'ButtonHelpText', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_TabNavBtn_Tab_Trl'), 10, null, null, 100, null, 'N', 'N', 'N', 'Y', null, 'N', 0, 'N', 'N', null, null, null, null, 'N', (SELECT ad_element_id FROM ad_element WHERE columnname = 'ButtonHelpText'), null, 'Y', 'N', null, null, null, 'N', 'Y', null, '2c18ad46-c03e-4bfd-9cb9-b80a0eed09c1', 'Y', 0, 'N', 'N', null, null, 'N', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2019-03-20 15:40:26.657000', '2019-03-20 15:40:26.657000', 100, 100, 'Button Text', 'The text displayed in the button', null, 0, 'U', 'ButtonText', (SELECT ad_table_id FROM ad_table WHERE tablename = 'BH_TabNavBtn_Tab_Trl'), 10, null, null, 100, null, 'N', 'N', 'N', 'Y', null, 'N', 0, 'N', 'N', null, null, null, null, 'N', (SELECT ad_element_id FROM ad_element WHERE columnname = 'ButtonText'), null, 'Y', 'N', null, null, null, 'N', 'Y', null, 'ab191331-5c1f-40db-8e16-243b4a01ab3f', 'Y', 0, 'N', 'N', null, null, 'N', null, null, 'N') ON CONFLICT DO NOTHING;

/**********************************************************************************************************/
-- Update ad_sequence
/**********************************************************************************************************/
UPDATE ad_sequence
SET currentnext = (SELECT MAX(ad_sequence_id) + 1 FROM ad_sequence)
WHERE name = 'AD_Sequence';
UPDATE ad_sequence
SET currentnext = (SELECT MAX(ad_element_id) + 1 FROM ad_element)
WHERE name = 'AD_Table';
UPDATE ad_sequence
SET currentnext = (SELECT MAX(ad_element_id) + 1 FROM ad_element)
WHERE name = 'AD_Element';
UPDATE ad_sequence
SET currentnext = (SELECT MAX(ad_element_id) + 1 FROM ad_element)
WHERE name = 'AD_Column';

/**********************************************************************************************************/
-- Update the right translation columns
/**********************************************************************************************************/
UPDATE ad_column c
SET istranslated = 'Y'
FROM ad_table t
WHERE t.ad_table_id = c.ad_table_id
	AND t.tablename = 'BH_DbrdBtnGrp_Btn'
	AND c.columnname IN ('ButtonHelpText','ButtonText','Name');
UPDATE ad_column c
SET istranslated = 'Y'
FROM ad_table t
WHERE t.ad_table_id = c.ad_table_id
	AND t.tablename = 'BH_DbrdBtnGrp'
	AND c.columnname IN ('Name');
UPDATE ad_column c
SET istranslated = 'Y'
FROM ad_table t
WHERE t.ad_table_id = c.ad_table_id
	AND t.tablename like 'BH_TabNavBtn%'
	AND c.columnname IN ('ButtonHelpText','ButtonText','Name');

/**********************************************************************************************************/
-- Ensure the new dashboard is used
/**********************************************************************************************************/
UPDATE pa_dashboardcontent
SET zulfilepath = '/zul/DashboardSideMenu.zul'
WHERE zulfilepath = '/zul/DashboardMenu.zul';

/**********************************************************************************************************/
-- Add the BandaGO Admin role and include it in the Admin roles
/**********************************************************************************************************/
UPDATE ad_role
SET name = 'BandaGo Admin', description = 'Give access to functionality provided in all the other sub roles  **(Has access to ALL menu items)**'
WHERE ad_role_uu = '0520b255-2e55-41b7-b95c-4f6660e77625';

INSERT INTO ad_role_included (ad_client_id, ad_org_id, ad_role_id, createdby, included_role_id, isactive, seqno, updatedby, ad_role_included_uu)
SELECT r.ad_client_id, 0, r.ad_role_id, 100, admn.ad_role_id, 'Y', 10, 100, uuid_generate_v4()
FROM ad_role r
CROSS JOIN (SELECT ad_role_id FROM ad_role WHERE name = 'BandaGo Admin') admn
WHERE r.ad_role_uu IN ('66cad621-be54-415b-9b2c-f3d0ca25db7e','11e24143-fb13-4fa9-b059-3d9ded76c24f','76fb16e6-a8ce-4d43-afbf-c4923569861a','ca79b28c-a637-42a3-92c3-1a7f4888a253','b4f7e813-6c92-4c56-89b8-16546fbab8d6','f09d551c-36de-4789-96b9-08f55ae1f9fe')
ON CONFLICT DO NOTHING;

/**********************************************************************************************************/
-- For iDempiere 7.1, update the toolbar buttons
/**********************************************************************************************************/
UPDATE ad_toolbarbutton
SET isshowmore = 'N'
WHERE ad_toolbarbutton_uu IN ('e4f1785e-db0e-48de-a4af-ac21c647b7f9','85a6a115-51c2-4164-a96d-09bb6d5792da');

/**********************************************************************************************************/
-- Update the schema of the DB (to match what the 2-pack will create) so scripts needing specific DB values
-- can be run before 2-packs
/**********************************************************************************************************/

-- 
-- Below script was generated by Devart dbForge Schema Compare for PostgreSQL, Version 1.1.1.0
-- Product Home Page: http://www.devart.com/dbforge/postgresql/schemacompare
-- Script date 11/26/2020 11:37:51 AM
-- 

--
-- Create procedure "adempiere"."pg_stat_statements_reset"
--
CREATE OR REPLACE PROCEDURE pg_stat_statements_reset ()
LANGUAGE c
SECURITY INVOKER
AS $c$pg_stat_statements_reset$c$;

--
-- Create function "adempiere"."pg_stat_statements"
--
CREATE OR REPLACE FUNCTION pg_stat_statements ()
RETURNS record
LANGUAGE c
VOLATILE
AS $c$pg_stat_statements_1_3$c$;

--
-- Create view "adempiere"."pg_stat_statements"
--
CREATE OR REPLACE VIEW IF NOT EXISTS pg_stat_statements
AS
	SELECT pg_stat_statements.userid,
    pg_stat_statements.dbid,
    pg_stat_statements.queryid,
    pg_stat_statements.query,
    pg_stat_statements.calls,
    pg_stat_statements.total_time,
    pg_stat_statements.min_time,
    pg_stat_statements.max_time,
    pg_stat_statements.mean_time,
    pg_stat_statements.stddev_time,
    pg_stat_statements.rows,
    pg_stat_statements.shared_blks_hit,
    pg_stat_statements.shared_blks_read,
    pg_stat_statements.shared_blks_dirtied,
    pg_stat_statements.shared_blks_written,
    pg_stat_statements.local_blks_hit,
    pg_stat_statements.local_blks_read,
    pg_stat_statements.local_blks_dirtied,
    pg_stat_statements.local_blks_written,
    pg_stat_statements.temp_blks_read,
    pg_stat_statements.temp_blks_written,
    pg_stat_statements.blk_read_time,
    pg_stat_statements.blk_write_time
   FROM adempiere.pg_stat_statements(true) pg_stat_statements(userid, dbid, queryid, query, calls, total_time, min_time, max_time, mean_time, stddev_time, rows, shared_blks_hit, shared_blks_read, shared_blks_dirtied, shared_blks_written, local_blks_hit, local_blks_read, local_blks_dirtied, local_blks_written, temp_blks_read, temp_blks_written, blk_read_time, blk_write_time);

--
-- Create table "adempiere"."bh_stockrevenue_view"
--
CREATE TABLE IF NOT EXISTS bh_stockrevenue_view(
  name character varying(255) DEFAULT NULL::character varying,
  quantity numeric(10, 0) DEFAULT NULL::numeric,
  amount numeric(147455, 16383),
  ad_client_id numeric(10, 0) DEFAULT NULL::numeric,
  ad_org_id numeric(10, 0) DEFAULT NULL::numeric)
;

--
-- Create table "adempiere"."bh_stock_mvt_v"
--
CREATE TABLE IF NOT EXISTS bh_stock_mvt_v(
  name character varying(255) DEFAULT NULL::character varying,
  beginning numeric(147455, 16383),
  outgoing numeric(147455, 16383),
  ending numeric(147455, 16383),
  ad_client_id numeric(10, 0) DEFAULT NULL::numeric,
  ad_org_id numeric(10, 0) DEFAULT NULL::numeric)
;

--
-- Create table "adempiere"."bh_product_categorydefault"
--
CREATE TABLE IF NOT EXISTS bh_product_categorydefault(
  bh_product_categorydefault_id numeric(10, 0) NOT NULL,
  ad_client_id numeric(10, 0) NOT NULL,
  ad_org_id numeric(10, 0) NOT NULL,
  bh_product_categorydefault_uu character varying(36) DEFAULT NULL::character varying,
  created timestamp without time zone NOT NULL DEFAULT statement_timestamp(),
  createdby numeric(10, 0) NOT NULL,
  description character varying(255) DEFAULT NULL::character varying,
  isactive character(1) NOT NULL DEFAULT 'Y'::bpchar,
  name character varying(60) NOT NULL,
  updated timestamp without time zone NOT NULL DEFAULT statement_timestamp(),
  updatedby numeric(10, 0) NOT NULL,
  value character varying(40) NOT NULL,
  bh_product_category_type character(1) NOT NULL,
  PRIMARY KEY (bh_product_categorydefault_id),
  CONSTRAINT bh_product_categorydefault_isactive_check CHECK (CHECK (isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))),
  CONSTRAINT bh_product_categorydefauluuidx UNIQUE(bh_product_categorydefault_uu),
  CONSTRAINT adclient_bhproductcategorydefa FOREIGN KEY (ad_client_id)
    REFERENCES ad_client(ad_client_id) ON DELETE NO ACTION ON UPDATE NO ACTION DEFERRABLE,
  CONSTRAINT adorg_bhproductcategorydefault FOREIGN KEY (ad_org_id)
    REFERENCES ad_org(ad_org_id) ON DELETE NO ACTION ON UPDATE NO ACTION DEFERRABLE
);

--
-- Create table "adempiere"."bh_chargedefault"
--
CREATE TABLE IF NOT EXISTS bh_chargedefault(
  bh_chargedefault_id numeric(10, 0) NOT NULL,
  ad_client_id numeric(10, 0) NOT NULL,
  ad_org_id numeric(10, 0) NOT NULL,
  bh_chargedefault_uu character varying(36) DEFAULT NULL::character varying,
  created timestamp without time zone NOT NULL DEFAULT statement_timestamp(),
  createdby numeric(10, 0) NOT NULL,
  description character varying(255) DEFAULT NULL::character varying,
  isactive character(1) NOT NULL DEFAULT 'Y'::bpchar,
  name character varying(60) NOT NULL,
  updated timestamp without time zone NOT NULL DEFAULT statement_timestamp(),
  updatedby numeric(10, 0) NOT NULL,
  value character varying(40) NOT NULL,
  PRIMARY KEY (bh_chargedefault_id),
  CONSTRAINT bh_chargedefault_isactive_check CHECK (CHECK (isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))),
  CONSTRAINT bh_chargedefault_uu_idx UNIQUE(bh_chargedefault_uu),
  CONSTRAINT adclient_bhchargedefault FOREIGN KEY (ad_client_id)
    REFERENCES ad_client(ad_client_id) ON DELETE NO ACTION ON UPDATE NO ACTION DEFERRABLE,
  CONSTRAINT adorg_bhchargedefault FOREIGN KEY (ad_org_id)
    REFERENCES ad_org(ad_org_id) ON DELETE NO ACTION ON UPDATE NO ACTION DEFERRABLE
);

--
-- Create column "isnewpatient" on table "adempiere"."c_bpartner"
--
ALTER TABLE c_bpartner 
  ADD isnewpatient IF NOT EXISTS character(1) DEFAULT 'Y'::bpchar;

--
-- Create column "bh_nhif_type" on table "adempiere"."c_bpartner"
--
ALTER TABLE c_bpartner 
  ADD bh_nhif_type IF NOT EXISTS character varying(100) DEFAULT NULL::character varying;

--
-- Create column "bh_lastpatientid" on table "adempiere"."c_bpartner"
--
ALTER TABLE c_bpartner 
  ADD bh_lastpatientid IF NOT EXISTS character varying(100) DEFAULT NULL::character varying;

--
-- Create column "bh_local_patientid" on table "adempiere"."c_bpartner"
--
ALTER TABLE c_bpartner 
  ADD bh_local_patientid IF NOT EXISTS character varying(100);

--
-- Create view "adempiere"."bh_patient_id_generator_v"
--
CREATE OR REPLACE VIEW bh_patient_id_generator_v
AS
	WITH clientids AS (
         SELECT ad_client.ad_client_id
           FROM adempiere.ad_client
          WHERE (ad_client.isactive = 'Y'::bpchar)
        ), patientids AS (
         SELECT ci.ad_client_id,
            COALESCE(max((c.bh_patientid)::text)) AS lastpatientid
           FROM (adempiere.c_bpartner c
             JOIN clientids ci ON ((c.ad_client_id = ci.ad_client_id)))
          WHERE (c.bh_patientid IS NOT NULL)
          GROUP BY ci.ad_client_id
        )
 SELECT l.ad_client_id,
    l.lastpatientid,
    (to_number(l.lastpatientid, '99999999'::text) + (1)::numeric) AS newpatientid
   FROM patientids l;

--
-- Create view "adempiere"."bh_number_of_patients_v"
--
CREATE OR REPLACE VIEW bh_number_of_patients_v
AS
	SELECT count(c_bpartner.c_bpartner_id) AS number_of_patients,
    c_bpartner.ad_client_id,
    c_bpartner.ad_org_id
   FROM adempiere.c_bpartner
  WHERE ((c_bpartner.bh_ispatient = 'Y'::bpchar) AND (c_bpartner.isactive = 'Y'::bpchar))
  GROUP BY c_bpartner.ad_client_id, c_bpartner.ad_org_id;

--
-- Create column "c_elementvalue_id" on table "adempiere"."c_charge"
--
ALTER TABLE c_charge 
  ADD c_elementvalue_id IF NOT EXISTS numeric(10, 0) DEFAULT NULL::numeric;

--
-- Create column "bh_locked" on table "adempiere"."c_charge"
--
ALTER TABLE c_charge 
  ADD bh_locked IF NOT EXISTS character(1) DEFAULT 'N'::bpchar;

--
-- Create table "adempiere"."bh_paymentref"
--
CREATE TABLE IF NOT EXISTS bh_paymentref(
  bh_paymentref_id numeric(10, 0) NOT NULL,
  ad_client_id numeric(10, 0) NOT NULL,
  ad_org_id numeric(10, 0) NOT NULL,
  bh_paymentref_uu character varying(36) DEFAULT NULL::character varying,
  created timestamp without time zone NOT NULL DEFAULT statement_timestamp(),
  createdby numeric(10, 0) NOT NULL,
  description character varying(255) DEFAULT NULL::character varying,
  isactive character(1) NOT NULL DEFAULT 'Y'::bpchar,
  name character varying(60) NOT NULL,
  updated timestamp without time zone NOT NULL DEFAULT statement_timestamp(),
  updatedby numeric(10, 0) NOT NULL,
  ad_reference_id numeric(10, 0) NOT NULL,
  bh_paymentref_action character(1) DEFAULT NULL::bpchar,
  PRIMARY KEY (bh_paymentref_id),
  UNIQUE(bh_paymentref_uu),
  CONSTRAINT bh_paymentref_isactive_check CHECK (CHECK (isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))),
  FOREIGN KEY (ad_client_id)
    REFERENCES ad_client(ad_client_id) ON DELETE NO ACTION ON UPDATE NO ACTION DEFERRABLE,
  FOREIGN KEY (ad_org_id)
    REFERENCES ad_org(ad_org_id) ON DELETE NO ACTION ON UPDATE NO ACTION DEFERRABLE,
  FOREIGN KEY (ad_reference_id)
    REFERENCES ad_reference(ad_reference_id) ON DELETE NO ACTION ON UPDATE NO ACTION DEFERRABLE
);

--
-- Create table "adempiere"."bh_paymentref_bankacct"
--
CREATE TABLE IF NOT EXISTS bh_paymentref_bankacct(
  bh_paymentref_bankacct_id numeric(10, 0) NOT NULL,
  ad_client_id numeric(10, 0) NOT NULL,
  ad_org_id numeric(10, 0) NOT NULL,
  bh_paymentref_bankacct_uu character varying(36) DEFAULT NULL::character varying,
  created timestamp without time zone NOT NULL DEFAULT statement_timestamp(),
  createdby numeric(10, 0) NOT NULL,
  description character varying(255) DEFAULT NULL::character varying,
  isactive character(1) NOT NULL DEFAULT 'Y'::bpchar,
  name character varying(60) NOT NULL,
  updated timestamp without time zone NOT NULL DEFAULT statement_timestamp(),
  updatedby numeric(10, 0) NOT NULL,
  ad_ref_list_id numeric(10, 0) DEFAULT NULL::numeric,
  c_bankaccount_id numeric(10, 0) DEFAULT NULL::numeric,
  bh_paymentref_id numeric(10, 0) NOT NULL,
  bh_paymentreflist_value character varying(1) DEFAULT NULL::character varying,
  PRIMARY KEY (bh_paymentref_bankacct_id),
  UNIQUE(bh_paymentref_bankacct_uu),
  CONSTRAINT bh_paymentref_bankacct_isactive_check CHECK (CHECK (isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))),
  FOREIGN KEY (ad_client_id)
    REFERENCES ad_client(ad_client_id) ON DELETE NO ACTION ON UPDATE NO ACTION DEFERRABLE,
  FOREIGN KEY (ad_org_id)
    REFERENCES ad_org(ad_org_id) ON DELETE NO ACTION ON UPDATE NO ACTION DEFERRABLE,
  FOREIGN KEY (bh_paymentref_id)
    REFERENCES bh_paymentref(bh_paymentref_id) ON DELETE NO ACTION ON UPDATE NO ACTION DEFERRABLE,
  FOREIGN KEY (c_bankaccount_id)
    REFERENCES c_bankaccount(c_bankaccount_id) ON DELETE NO ACTION ON UPDATE NO ACTION DEFERRABLE
);

--
-- Create view "adempiere"."bh_user_activity_v"
--
CREATE OR REPLACE VIEW bh_user_activity_v
AS
	SELECT c.ad_table_id,
    t.name AS window_name,
    client.name AS client_name,
    (to_timestamp((c.created)::text, 'YYYY-MM-DD'::text))::timestamp without time zone AS created,
    count(c.ad_changelog_id) AS count,
    c.ad_client_id,
    c.ad_org_id
   FROM ((adempiere.ad_changelog c
     JOIN adempiere.ad_table t ON ((c.ad_table_id = t.ad_table_id)))
     JOIN adempiere.ad_client client ON ((c.ad_client_id = client.ad_client_id)))
  WHERE ((c.ad_table_id = ANY (ARRAY[(208)::numeric, (291)::numeric, (259)::numeric])) AND (c.ad_org_id > (0)::numeric))
  GROUP BY c.ad_table_id, t.name, client.name, ((to_timestamp((c.created)::text, 'YYYY-MM-DD'::text))::timestamp without time zone), c.ad_client_id, c.ad_org_id
  ORDER BY ((to_timestamp((c.created)::text, 'YYYY-MM-DD'::text))::timestamp without time zone) DESC;

--
-- Create view "adempiere"."bh_system_usage_v"
--
CREATE OR REPLACE VIEW bh_system_usage_v
AS
	SELECT to_timestamp(to_char(ad_changelog.created, 'YYYY-MM-DD HH24:00:00'::text), 'YYYY-MM-DD HH24:00:00'::text) AS date,
    count(ad_changelog.ad_changelog_id) AS occurences
   FROM adempiere.ad_changelog
  GROUP BY (to_timestamp(to_char(ad_changelog.created, 'YYYY-MM-DD HH24:00:00'::text), 'YYYY-MM-DD HH24:00:00'::text))
  ORDER BY (to_timestamp(to_char(ad_changelog.created, 'YYYY-MM-DD HH24:00:00'::text), 'YYYY-MM-DD HH24:00:00'::text)) DESC;

--
-- Create view "adempiere"."bh_changelog_v"
--
CREATE OR REPLACE VIEW bh_changelog_v
AS
	SELECT ad_changelog.ad_table_id,
    (to_timestamp((ad_changelog.created)::text, 'YYYY-MM-DD'::text))::timestamp without time zone AS created,
    ad_changelog.eventchangelog,
    count(ad_changelog.ad_changelog_id) AS count,
    ad_changelog.createdby,
    ad_changelog.ad_client_id,
    ad_changelog.ad_org_id
   FROM adempiere.ad_changelog
  GROUP BY ad_changelog.ad_table_id, ad_changelog.eventchangelog, ((to_timestamp((ad_changelog.created)::text, 'YYYY-MM-DD'::text))::timestamp without time zone), ad_changelog.createdby, ad_changelog.ad_client_id, ad_changelog.ad_org_id;

--
-- Create view "adempiere"."bh_recent_windows_v"
--
CREATE OR REPLACE VIEW bh_recent_windows_v
AS
	SELECT r.created,
    r.ad_org_id,
    r.ad_client_id,
    r.ad_window_id,
    w.name AS window_name,
    c.name AS client_name,
    r.ad_recentitem_id
   FROM ((adempiere.ad_recentitem r
     JOIN adempiere.ad_window w ON ((r.ad_window_id = w.ad_window_id)))
     JOIN adempiere.ad_client c ON ((r.ad_client_id = c.ad_client_id)))
  WHERE (r.ad_org_id > (0)::numeric)
  ORDER BY r.created DESC;

--
-- Create column "bh_pricemargin" on table "adempiere"."m_product"
--
ALTER TABLE m_product 
  ADD bh_pricemargin IF NOT EXISTS numeric(147455, 16383);

--
-- Create column "bh_product_category_type" on table "adempiere"."m_product"
--
ALTER TABLE m_product 
  ADD bh_product_category_type IF NOT EXISTS character(1) DEFAULT NULL::bpchar;

--
-- Create view "adempiere"."bh_stock_reorder_levels_v"
--
CREATE OR REPLACE VIEW bh_stock_reorder_levels_v
AS
	WITH quantitysums AS (
         SELECT s_1.m_product_id,
            sum(s_1.qtyonhand) AS quantity,
            s_1.ad_client_id,
            s_1.ad_org_id,
            s_1.m_locator_id
           FROM adempiere.m_storage s_1
          GROUP BY s_1.m_product_id, s_1.ad_client_id, s_1.ad_org_id, s_1.m_locator_id
        )
 SELECT s.ad_org_id,
    s.ad_client_id,
    w.name AS store,
    p.name AS product,
    s.quantity AS existingquantity,
    COALESCE(p.bh_reorder_level, (0)::numeric) AS reorderlevel,
        CASE
            WHEN ((s.quantity - COALESCE(p.bh_reorder_level, (0)::numeric)) > (0)::numeric) THEN false
            ELSE true
        END AS reorder,
    p.bh_reorder_quantity AS reorderquantity
   FROM (((quantitysums s
     JOIN adempiere.m_locator l ON ((s.m_locator_id = l.m_locator_id)))
     JOIN adempiere.m_product p ON ((s.m_product_id = p.m_product_id)))
     JOIN adempiere.m_warehouse w ON ((l.m_warehouse_id = w.m_warehouse_id)))
  ORDER BY s.quantity;

--
-- Create view "adempiere"."bh_reorder_inventory_v"
--
CREATE OR REPLACE VIEW bh_reorder_inventory_v
AS
	WITH quantitysums AS (
         SELECT s_1.m_product_id,
            sum(s_1.qtyonhand) AS quantity,
            s_1.ad_client_id,
            s_1.ad_org_id,
            s_1.m_locator_id
           FROM adempiere.m_storage s_1
          GROUP BY s_1.m_product_id, s_1.ad_client_id, s_1.ad_org_id, s_1.m_locator_id
        )
 SELECT s.ad_org_id,
    s.ad_client_id,
    w.name AS store,
    p.name AS product,
    s.quantity AS existingquantity,
    COALESCE(p.bh_reorder_level, (0)::numeric) AS reorderlevel,
        CASE
            WHEN ((s.quantity - COALESCE(p.bh_reorder_level, (0)::numeric)) > (0)::numeric) THEN false
            ELSE true
        END AS reorder
   FROM (((quantitysums s
     JOIN adempiere.m_locator l ON ((s.m_locator_id = l.m_locator_id)))
     JOIN adempiere.m_product p ON ((s.m_product_id = p.m_product_id)))
     JOIN adempiere.m_warehouse w ON ((l.m_warehouse_id = w.m_warehouse_id)))
  ORDER BY s.quantity;

--
-- Create view "adempiere"."bh_current_inventory_v"
--
CREATE OR REPLACE VIEW bh_current_inventory_v
AS
	WITH inventory AS (
         SELECT p.ad_org_id,
            p.ad_client_id,
            p.name,
            sum(s.qtyonhand) AS qtyonhand,
            i_1.guaranteedate
           FROM ((adempiere.m_product p
             JOIN adempiere.m_storage s ON ((p.m_product_id = s.m_product_id)))
             JOIN adempiere.m_attributesetinstance i_1 ON ((s.m_attributesetinstance_id = i_1.m_attributesetinstance_id)))
          GROUP BY p.m_product_id, i_1.guaranteedate
          ORDER BY p.name, i_1.guaranteedate
        )
 SELECT i.ad_org_id,
    i.ad_client_id,
    i.name,
    i.qtyonhand,
    i.guaranteedate
   FROM inventory i
  ORDER BY i.qtyonhand DESC;

--
-- Create view "adempiere"."bh_stocktake_v"
--
CREATE OR REPLACE VIEW bh_stocktake_v
AS
	WITH quantitysums AS (
         SELECT s_1.m_product_id,
            sum(s_1.qtyonhand) AS quantity,
            s_1.ad_client_id,
            s_1.ad_org_id,
            s_1.m_locator_id,
            s_1.m_attributesetinstance_id,
            asi_1.guaranteedate
           FROM (adempiere.m_storage s_1
             LEFT JOIN adempiere.m_attributesetinstance asi_1 ON ((s_1.m_attributesetinstance_id = asi_1.m_attributesetinstance_id)))
          GROUP BY s_1.m_product_id, s_1.ad_client_id, s_1.ad_org_id, s_1.m_locator_id, asi_1.guaranteedate, s_1.m_attributesetinstance_id
        )
 SELECT s.m_product_id,
    l.m_warehouse_id,
    p.name AS product,
    asi.description,
    asi.guaranteedate AS expirationdate,
    l.value AS location,
    s.quantity,
    adempiere.daysbetween((asi.guaranteedate)::timestamp with time zone, (('now'::text)::timestamp without time zone)::timestamp with time zone) AS shelflifedays,
    s.ad_client_id,
    s.ad_org_id,
    attset.isinstanceattribute,
    attset.created,
    attset.createdby,
    attset.updated,
    attset.updatedby,
    attset.isactive,
    concat(s.m_product_id, l.m_warehouse_id) AS id,
    st.bh_docaction,
    st.processed,
    asi.m_attributeset_id,
    asi.m_attributesetinstance_id
   FROM (((((quantitysums s
     JOIN adempiere.m_locator l ON ((s.m_locator_id = l.m_locator_id)))
     JOIN adempiere.m_product p ON ((s.m_product_id = p.m_product_id)))
     LEFT JOIN adempiere.m_attributesetinstance asi ON ((s.m_attributesetinstance_id = asi.m_attributesetinstance_id)))
     LEFT JOIN adempiere.m_attributeset attset ON ((asi.m_attributeset_id = attset.m_attributeset_id)))
     LEFT JOIN adempiere.bh_stocktake st ON ((asi.m_attributesetinstance_id = st.m_attributesetinstance_id)))
  WHERE ((attset.name)::text = 'BandaHealthProductAttributeSet'::text)
  ORDER BY p.name;

--
-- Create column "description" on table "adempiere"."m_discountschemaline"
--
ALTER TABLE m_discountschemaline 
  ADD description IF NOT EXISTS character varying(255) DEFAULT NULL::character varying;

--
-- Create column "bh_nhif_linda_mama" on table "adempiere"."c_payment"
--
ALTER TABLE c_payment 
  ADD bh_nhif_linda_mama IF NOT EXISTS character varying(100) DEFAULT NULL::character varying;

--
-- Create column "bh_nhif_type" on table "adempiere"."c_payment"
--
ALTER TABLE c_payment 
  ADD bh_nhif_type IF NOT EXISTS character varying(100) DEFAULT NULL::character varying;

--
-- Create column "bh_tender_amount" on table "adempiere"."c_payment"
--
ALTER TABLE c_payment 
  ADD bh_tender_amount IF NOT EXISTS numeric(147455, 16383);

--
-- Create column "bh_isservicedebt" on table "adempiere"."c_payment"
--
ALTER TABLE c_payment 
  ADD bh_isservicedebt IF NOT EXISTS character(1) DEFAULT NULL::bpchar;

--
-- Create column "bh_docaction" on table "adempiere"."c_invoice"
--
ALTER TABLE c_invoice 
  ADD bh_docaction IF NOT EXISTS character(2) DEFAULT NULL::bpchar;

--
-- Create column "bh_navbuttons" on table "adempiere"."c_invoice"
--
ALTER TABLE c_invoice 
  ADD bh_navbuttons IF NOT EXISTS character varying(36) DEFAULT NULL::character varying;

--
-- Create column "bh_isexpense" on table "adempiere"."c_invoice"
--
ALTER TABLE c_invoice 
  ADD bh_isexpense IF NOT EXISTS character(1) DEFAULT 'N'::bpchar;

--
-- Create column "bh_processing" on table "adempiere"."c_invoice"
--
ALTER TABLE c_invoice 
  ADD bh_processing IF NOT EXISTS character(1) DEFAULT 'N'::bpchar;

--
-- Create column "bh_docaction_2" on table "adempiere"."c_invoice"
--
ALTER TABLE c_invoice 
  ADD bh_docaction_2 IF NOT EXISTS character(2) DEFAULT NULL::bpchar;

--
-- Create column "bh_referral" on table "adempiere"."c_order"
--
ALTER TABLE c_order 
  ADD bh_referral IF NOT EXISTS character varying(100) DEFAULT NULL::character varying;

--
-- Create column "bh_newvisit" on table "adempiere"."c_order"
--
ALTER TABLE c_order 
  ADD bh_newvisit IF NOT EXISTS character(1) DEFAULT 'N'::bpchar;

--
-- Create column "bh_patienttype" on table "adempiere"."c_order"
--
ALTER TABLE c_order 
  ADD bh_patienttype IF NOT EXISTS character(1) DEFAULT 'O'::bpchar;

--
-- Create column "bh_lab_notes" on table "adempiere"."c_order"
--
ALTER TABLE c_order 
  ADD bh_lab_notes IF NOT EXISTS character varying(255) DEFAULT NULL::character varying;

--
-- Create column "bh_bloodpressure" on table "adempiere"."c_order"
--
ALTER TABLE c_order 
  ADD bh_bloodpressure IF NOT EXISTS character varying(100) DEFAULT NULL::character varying;

--
-- Create column "bh_chiefcomplaint" on table "adempiere"."c_order"
--
ALTER TABLE c_order 
  ADD bh_chiefcomplaint IF NOT EXISTS character varying(100) DEFAULT NULL::character varying;

--
-- Create column "bh_height" on table "adempiere"."c_order"
--
ALTER TABLE c_order 
  ADD bh_height IF NOT EXISTS character varying(100) DEFAULT NULL::character varying;

--
-- Create column "bh_pulse" on table "adempiere"."c_order"
--
ALTER TABLE c_order 
  ADD bh_pulse IF NOT EXISTS character varying(100) DEFAULT NULL::character varying;

--
-- Create column "bh_respiratoryrate" on table "adempiere"."c_order"
--
ALTER TABLE c_order 
  ADD bh_respiratoryrate IF NOT EXISTS character varying(100) DEFAULT NULL::character varying;

--
-- Create column "bh_temperature" on table "adempiere"."c_order"
--
ALTER TABLE c_order 
  ADD bh_temperature IF NOT EXISTS character varying(100) DEFAULT NULL::character varying;

--
-- Create column "bh_weight" on table "adempiere"."c_order"
--
ALTER TABLE c_order 
  ADD bh_weight IF NOT EXISTS character varying(100) DEFAULT NULL::character varying;

--
-- Create view "adempiere"."bh_patients_seen_by_month_v"
--
CREATE OR REPLACE VIEW bh_patients_seen_by_month_v
AS
	WITH grouppatients AS (
         SELECT c_bpartner.c_bpartner_id
           FROM adempiere.c_bpartner
          WHERE ((c_bpartner.isactive = 'Y'::bpchar) AND (c_bpartner.bh_ispatient = 'Y'::bpchar))
          GROUP BY c_bpartner.c_bpartner_id
        ), groupdates AS (
         SELECT corder.ad_client_id,
            corder.ad_org_id,
            to_char(corder.created, 'YYYY-MM'::text) AS month,
            count(grouppatients.c_bpartner_id) AS total_patients,
            count(
                CASE
                    WHEN (to_char(bpartner.created, 'YYYY-MM'::text) = to_char(corder.created, 'YYYY-MM'::text)) THEN grouppatients.c_bpartner_id
                    ELSE NULL::numeric
                END) AS new_patients
           FROM ((grouppatients
             JOIN adempiere.c_order corder ON ((corder.c_bpartner_id = grouppatients.c_bpartner_id)))
             JOIN adempiere.c_bpartner bpartner ON ((grouppatients.c_bpartner_id = bpartner.c_bpartner_id)))
          WHERE ((corder.isactive = 'Y'::bpchar) AND (corder.docstatus = 'CO'::bpchar) AND (corder.processed = 'Y'::bpchar) AND (corder.issotrx = 'Y'::bpchar))
          GROUP BY corder.ad_client_id, corder.ad_org_id, (to_char(corder.created, 'YYYY-MM'::text))
          ORDER BY corder.ad_client_id
        )
 SELECT ((date_trunc('MONTH'::text, to_timestamp(concat(gd.month, '-', '01'), 'YYYY-MM-DD'::text)) + '1 mon -1 days'::interval))::timestamp without time zone AS end_month,
    gd.ad_client_id,
    gd.ad_org_id,
    gd.total_patients,
    gd.new_patients,
    c.name AS client_name
   FROM (groupdates gd
     JOIN adempiere.ad_client c ON ((gd.ad_client_id = c.ad_client_id)));

--
-- Create view "adempiere"."bh_daily_orders_v"
--
CREATE OR REPLACE VIEW bh_daily_orders_v
AS
	SELECT c_order.dateordered,
    c_order.c_bpartner_id,
    c_order.docstatus,
    c_order.docaction,
    c_order.grandtotal,
    c_order.ad_client_id,
    c_order.ad_org_id,
    c_order.issotrx AS purchasetransaction
   FROM adempiere.c_order;

--
-- Create column "bh_instructions" on table "adempiere"."c_orderline"
--
ALTER TABLE c_orderline 
  ADD bh_instructions IF NOT EXISTS character varying(255) DEFAULT NULL::character varying;]

--
-- Create view "adempiere"."bhcorderv"
--
CREATE OR REPLACE VIEW bhcorderv
AS
	WITH ordergrandtotals AS (
         SELECT c_orderline.c_order_id,
            COALESCE(sum(c_orderline.linenetamt), (0)::numeric) AS grandtotal
           FROM adempiere.c_orderline
          GROUP BY c_orderline.c_order_id
        ), orderinvoicetotals AS (
         SELECT ogt_1.c_order_id,
            sum(pmt.payamt) AS paytotal
           FROM ((ordergrandtotals ogt_1
             LEFT JOIN adempiere.bh_c_order_payment_v opmt ON ((opmt.c_order_id = ogt_1.c_order_id)))
             LEFT JOIN adempiere.c_payment pmt ON ((opmt.c_payment_id = pmt.c_payment_id)))
          GROUP BY ogt_1.c_order_id
        )
 SELECT ogt.c_order_id,
    ordr.c_bpartner_id,
    ogt.grandtotal,
    COALESCE(oit.paytotal, (0)::numeric) AS paytotal,
    (ogt.grandtotal - COALESCE(oit.paytotal, (0)::numeric)) AS amtleft
   FROM ((ordergrandtotals ogt
     LEFT JOIN orderinvoicetotals oit ON ((ogt.c_order_id = oit.c_order_id)))
     LEFT JOIN adempiere.c_order ordr ON ((ogt.c_order_id = ordr.c_order_id)));

--
-- Create view "adempiere"."bh_incomestatement_v"
--
CREATE OR REPLACE VIEW bh_incomestatement_v
AS
	SELECT client.name,
    sum(
        CASE
            WHEN (corder.issotrx = 'Y'::bpchar) THEN corder.grandtotal
            ELSE (0)::numeric
        END) AS revenue,
    sum(
        CASE
            WHEN (corder.issotrx = 'N'::bpchar) THEN corder.grandtotal
            ELSE (0)::numeric
        END) AS cost,
    sum(bhcorderv.paytotal) AS payments,
    sum(bhcorderv.amtleft) AS balances_due,
    corder.created AS datecreated
   FROM ((adempiere.c_order corder
     JOIN adempiere.ad_client client ON ((corder.ad_client_id = client.ad_client_id)))
     JOIN adempiere.bhcorderv ON ((bhcorderv.c_order_id = corder.c_order_id)))
  WHERE (corder.docstatus = 'CO'::bpchar)
  GROUP BY client.name, corder.created
  ORDER BY corder.created DESC;

--
-- Create view "adempiere"."bh_patient_transactions_summary_v"
--
CREATE OR REPLACE VIEW bh_patient_transactions_summary_v
AS
	SELECT client.name AS clinicname,
    corder.dateordered,
    corder.c_order_id AS visitid,
    clocation.address1 AS visitlocation,
    bplocation.name AS patientlocation,
    corder.description AS diagnosis,
    p1.name AS drug,
    cline1.priceactual AS salesprice,
    s1.name AS service,
    cline1.qtyordered AS quantityordered,
    corder.grandtotal AS totalbilled,
    inv.paytotal AS totalpaid
   FROM ((((((((adempiere.c_order corder
     JOIN adempiere.c_orderline cline1 ON ((corder.c_order_id = cline1.c_order_id)))
     LEFT JOIN adempiere.m_product p1 ON (((cline1.m_product_id = p1.m_product_id) AND (p1.producttype = 'I'::bpchar))))
     LEFT JOIN adempiere.m_product s1 ON (((cline1.m_product_id = s1.m_product_id) AND (s1.producttype = 'S'::bpchar))))
     JOIN adempiere.c_bpartner_location bplocation ON ((corder.c_bpartner_location_id = bplocation.c_bpartner_location_id)))
     JOIN adempiere.ad_orginfo org ON ((corder.ad_org_id = org.ad_org_id)))
     JOIN adempiere.c_location clocation ON ((org.c_location_id = clocation.c_location_id)))
     JOIN adempiere.ad_client client ON ((corder.ad_client_id = client.ad_client_id)))
     JOIN adempiere.bh_c_order_v inv ON ((corder.c_order_id = inv.c_order_id)))
  WHERE ((corder.issotrx = 'Y'::bpchar) AND (corder.docstatus = 'CO'::bpchar))
  ORDER BY corder.dateordered DESC;

--
-- Create column "bh_navbuttons" on table "adempiere"."c_invoiceline"
--
ALTER TABLE c_invoiceline 
  ADD bh_navbuttons IF NOT EXISTS character varying(36) DEFAULT NULL::character varying;

--
-- Create view "adempiere"."bh_patient_transactions_v"
--
CREATE OR REPLACE VIEW bh_patient_transactions_v
AS
	WITH corderline AS (
         SELECT max(ol.c_orderline_id) AS c_orderline_id,
            c.c_order_id
           FROM (adempiere.c_order c
             JOIN adempiere.c_orderline ol ON ((c.c_order_id = ol.c_order_id)))
          GROUP BY c.c_order_id
        ), invoiceline AS (
         SELECT max(il.c_invoiceline_id) AS c_invoiceline_id,
            il.c_orderline_id,
            i.c_invoice_id
           FROM (adempiere.c_invoice i
             JOIN adempiere.c_invoiceline il ON ((i.c_invoice_id = il.c_invoice_id)))
          GROUP BY i.c_invoice_id, il.c_orderline_id
        ), payments AS (
         SELECT sum(p.payamt) AS totalpayments,
            p.c_invoice_id,
            max(p.c_payment_id) AS c_payment_id,
                CASE
                    WHEN (p.tendertype = 'B'::bpchar) THEN 'Bill Waiver'::text
                    WHEN (p.tendertype = 'M'::bpchar) THEN 'M-Pesa'::text
                    WHEN (p.tendertype = 'F'::bpchar) THEN 'Donor Payments'::text
                    WHEN (p.tendertype = 'i'::bpchar) THEN 'Linda Mama'::text
                    WHEN (p.tendertype = 'N'::bpchar) THEN 'NHIF'::text
                    ELSE 'Cash'::text
                END AS tendertype
           FROM (adempiere.c_payment p
             JOIN adempiere.c_invoice i ON (((p.c_invoice_id = i.c_invoice_id) AND (p.oprocessing <> 'NULL'::bpchar))))
          GROUP BY p.c_invoice_id, p.tendertype
        ), patientsummary AS (
         SELECT bp.name,
            o.created,
            o.grandtotal,
            bp.totalopenbalance,
            o.ad_client_id,
            o.ad_org_id,
            sum(p.totalpayments) AS totalpayments,
            ol.c_orderline_id,
            il.c_invoiceline_id,
            ci.c_invoice_id,
            p.c_payment_id,
            client.name AS client_name,
            p.tendertype
           FROM ((((((adempiere.c_order o
             JOIN adempiere.ad_client client ON ((o.ad_client_id = client.ad_client_id)))
             LEFT JOIN adempiere.c_bpartner bp ON ((o.c_bpartner_id = bp.c_bpartner_id)))
             LEFT JOIN corderline ol ON ((o.c_order_id = ol.c_order_id)))
             LEFT JOIN invoiceline il ON ((ol.c_orderline_id = il.c_orderline_id)))
             LEFT JOIN adempiere.c_invoice ci ON ((il.c_invoice_id = ci.c_invoice_id)))
             LEFT JOIN payments p ON ((ci.c_invoice_id = p.c_invoice_id)))
          WHERE ((o.issotrx = 'Y'::bpchar) AND (o.docstatus = 'CO'::bpchar))
          GROUP BY bp.name, o.created, o.grandtotal, bp.totalopenbalance, o.ad_client_id, o.ad_org_id, ol.c_orderline_id, il.c_invoiceline_id, ci.c_invoice_id, p.c_payment_id, client.name, p.tendertype
        )
 SELECT patientsummary.name,
    patientsummary.created,
    patientsummary.grandtotal,
    patientsummary.totalopenbalance,
    patientsummary.ad_client_id,
    patientsummary.ad_org_id,
    patientsummary.totalpayments,
    patientsummary.c_orderline_id,
    patientsummary.c_invoiceline_id,
    patientsummary.c_invoice_id,
    patientsummary.c_payment_id,
    patientsummary.client_name,
    patientsummary.tendertype
   FROM patientsummary
  ORDER BY patientsummary.created DESC;

--
-- Create view "adempiere"."bh_visit_rate_v"
--
CREATE OR REPLACE VIEW bh_visit_rate_v
AS
	WITH dailyrate AS (
         SELECT to_timestamp(to_char(bh_patient_transactions_v.created, 'YYYY-MM-DD'::text), 'YYYY-MM-DD'::text) AS created,
            count(bh_patient_transactions_v.c_orderline_id) AS dailyvisits
           FROM adempiere.bh_patient_transactions_v
          WHERE ((bh_patient_transactions_v.client_name)::text <> ALL (ARRAY[('Banda Health'::character varying)::text, ('Banda Health Management'::character varying)::text, ('GardenWorld'::character varying)::text]))
          GROUP BY (to_timestamp(to_char(bh_patient_transactions_v.created, 'YYYY-MM-DD'::text), 'YYYY-MM-DD'::text))
          ORDER BY (to_timestamp(to_char(bh_patient_transactions_v.created, 'YYYY-MM-DD'::text), 'YYYY-MM-DD'::text))
        ), monthlyrate AS (
         SELECT dailyrate.created,
            sum(dailyrate.dailyvisits) OVER (ORDER BY dailyrate.created ROWS BETWEEN 29 PRECEDING AND CURRENT ROW) AS monthlyvisits,
            sum(dailyrate.dailyvisits) OVER (ORDER BY dailyrate.created ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS sumdailyvisits
           FROM dailyrate
          GROUP BY dailyrate.created, dailyrate.dailyvisits
          ORDER BY dailyrate.created
        ), annualrate AS (
         SELECT monthlyrate.created,
            ceil((monthlyrate.monthlyvisits * 12.017)) AS annualrate
           FROM monthlyrate
          GROUP BY monthlyrate.created, monthlyrate.monthlyvisits
          ORDER BY monthlyrate.created
        )
 SELECT d.created AS transactiondate,
    d.dailyvisits,
    m.sumdailyvisits,
    m.monthlyvisits,
    a.annualrate
   FROM ((dailyrate d
     JOIN monthlyrate m ON ((d.created = m.created)))
     JOIN annualrate a ON ((m.created = a.created)))
  ORDER BY d.created;

--
-- Create view "adempiere"."bh_drug_profit_loss_v"
--
CREATE OR REPLACE VIEW bh_drug_profit_loss_v
AS
	WITH rg AS (
         SELECT c_1.ad_client_id,
            c_1.ad_org_id,
            ln_1.m_product_id,
            sum(ln_1.qtyordered) AS quantityreceived,
            ln_1.priceactual AS pricebought,
            ln_1.m_warehouse_id,
            t_1.m_attributesetinstance_id
           FROM (((adempiere.c_order c_1
             JOIN adempiere.c_orderline ln_1 ON ((c_1.c_order_id = ln_1.c_order_id)))
             JOIN adempiere.m_inoutline min_1 ON ((ln_1.c_orderline_id = min_1.c_orderline_id)))
             JOIN adempiere.m_transaction t_1 ON (((min_1.m_inoutline_id = t_1.m_inoutline_id) AND (t_1.movementtype = 'V+'::bpchar))))
          WHERE (c_1.issotrx = 'N'::bpchar)
          GROUP BY ln_1.m_product_id, ln_1.priceactual, ln_1.m_warehouse_id, c_1.ad_client_id, c_1.ad_org_id, t_1.m_attributesetinstance_id
        )
 SELECT c.ad_client_id,
    c.ad_org_id,
    c.dateordered,
    p.name,
    ln.qtyordered,
    rg.quantityreceived,
    ln.priceactual AS pricesold,
    rg.pricebought,
    client.name AS client_name,
    m.guaranteedate
   FROM (((((((adempiere.c_order c
     JOIN adempiere.c_orderline ln ON (((c.c_order_id = ln.c_order_id) AND (c.ad_client_id = ln.ad_client_id) AND (c.ad_org_id = ln.ad_org_id))))
     JOIN adempiere.m_inoutline min ON ((ln.c_orderline_id = min.c_orderline_id)))
     JOIN adempiere.m_transaction t ON (((min.m_inoutline_id = t.m_inoutline_id) AND (t.movementtype = 'C-'::bpchar))))
     JOIN rg ON (((t.m_attributesetinstance_id = rg.m_attributesetinstance_id) AND (ln.m_product_id = rg.m_product_id) AND (rg.m_warehouse_id = ln.m_warehouse_id))))
     JOIN adempiere.m_attributesetinstance m ON ((t.m_attributesetinstance_id = m.m_attributesetinstance_id)))
     JOIN adempiere.m_product p ON ((ln.m_product_id = p.m_product_id)))
     JOIN adempiere.ad_client client ON ((c.ad_client_id = client.ad_client_id)))
  WHERE (c.issotrx = 'Y'::bpchar)
  ORDER BY c.dateordered DESC;

--
-- Create view "adempiere"."bh_daily_sold_inventory_v"
--
CREATE OR REPLACE VIEW bh_daily_sold_inventory_v
AS
	WITH quantitysold AS (
         SELECT t.ad_org_id,
            t.ad_client_id,
            (sum(t.movementqty) * ('-1'::integer)::numeric) AS qtyordered,
            t.m_product_id,
            t.m_locator_id,
            to_char(t.updated, 'YYYY-MM-DD'::text) AS dateordered,
            max(t.m_attributesetinstance_id) AS m_attributesetinstance_id
           FROM adempiere.m_transaction t
          WHERE ((t.movementtype = 'C-'::bpchar) AND (t.isactive = 'Y'::bpchar))
          GROUP BY t.ad_org_id, t.ad_client_id, t.m_product_id, t.m_locator_id, (to_char(t.updated, 'YYYY-MM-DD'::text))
          ORDER BY (sum(t.movementqty) * ('-1'::integer)::numeric) DESC
        )
 SELECT s.ad_org_id,
    s.ad_client_id,
    ms.updated AS dateordered,
    p.name,
    s.qtyordered,
    ms.qtyonhand,
    m.m_warehouse_id,
    s.m_attributesetinstance_id
   FROM ((((quantitysold s
     JOIN adempiere.m_product p ON ((s.m_product_id = p.m_product_id)))
     JOIN adempiere.m_storage ms ON (((s.dateordered = to_char(ms.updated, 'YYYY-MM-DD'::text)) AND (s.m_product_id = ms.m_product_id) AND (s.m_locator_id = ms.m_locator_id) AND (s.ad_org_id = ms.ad_org_id) AND (s.ad_client_id = ms.ad_client_id) AND (s.m_attributesetinstance_id = ms.m_attributesetinstance_id))))
     JOIN adempiere.m_locator l ON ((ms.m_locator_id = l.m_locator_id)))
     JOIN adempiere.m_warehouse m ON ((l.m_warehouse_id = m.m_warehouse_id)));

/**********************************************************************************************************/
-- Updates to get 2-packs to work
/**********************************************************************************************************/
UPDATE ad_element
SET ad_element_uu = '96647eda-8470-4b0b-a798-2e9b881888ea'
WHERE ad_element_uu = '4e740dec-ba2b-4a31-8cba-b3c3518b4718';

UPDATE ad_column
SET ad_column_uu = '6c46f8d0-d406-4b56-bd49-ede41cca0de6'
WHERE ad_column_uu = 'a8827c9e-5232-4be3-9f40-c90eafcd1fbf';

UPDATE ad_element
SET columnname = 'NationalID'
WHERE ad_element_uu = 'beb0c8dd-181b-4c79-b79a-b7847bf87e7b';
UPDATE ad_column
SET columnname = 'NationalID'
WHERE ad_column_uu = 'ede93a0b-4901-4d49-8ef3-d315adfd031d';

-- Handle a new reference that was added
INSERT INTO ad_reference (ad_reference_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, validationtype, vformat, entitytype, isorderbyvalue, ad_reference_uu, ad_element_id) VALUES ((SELECT MAX(ad_reference_id) + 1 FROM ad_reference), 0, 0, 'Y', '2018-07-19 14:47:46.579000', 100, '2018-07-19 14:47:46.579000', 100, 'BH_Table_Name', null, null, 'T', null, 'U', 'N', 'd2872478-6a24-4261-8178-bd71bce3f177', null)
ON CONFLICT DO NOTHING;

INSERT INTO ad_ref_table (ad_reference_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, ad_table_id, ad_key, ad_display, isvaluedisplayed, whereclause, orderbyclause, entitytype, ad_window_id, ad_ref_table_uu, ad_infowindow_id) VALUES ((SELECT ad_reference_id FROM ad_reference WHERE ad_reference_uu = 'd2872478-6a24-4261-8178-bd71bce3f177'), 0, 0, 'Y', '2018-07-19 14:47:46.593000', 100, '2018-07-19 14:47:46.593000', 100, 100, 100, 102, 'N', null, null, 'U', null, 'cc157355-30d5-4c0f-b5e9-5008e523ad31', null)
ON CONFLICT DO NOTHING;

INSERT INTO ad_table (ad_table_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, tablename, isview, accesslevel, entitytype, ad_window_id, ad_val_rule_id, loadseq, issecurityenabled, isdeleteable, ishighvolume, importtable, ischangelog, replicationtype, po_window_id, copycolumnsfromtable, iscentrallymaintained, ad_table_uu, processing, databaseviewdrop, copycomponentsfromview, createwindowfromtable) VALUES ((SELECT MAX(ad_table_id) + 1 FROM ad_table), 0, 0, 'Y', '2018-07-05 11:47:43.615000', 100, '2018-07-19 15:32:15.127000', 100, 'bh_changelog_v', null, null, 'bh_changelog_v', 'Y', '3', 'U', null, null, 0, 'N', 'N', 'N', 'N', 'Y', 'L', null, 'N', 'Y', 'c1a566ff-922b-4214-8908-7f1a2897dedc', 'N', 'N', 'N', null)
ON CONFLICT DO NOTHING;

INSERT INTO ad_element (ad_element_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, columnname, entitytype, name, printname, description, help, po_name, po_printname, po_description, po_help, ad_element_uu, placeholder) VALUES ((SELECT MAX(ad_element_id) + 1 FROM ad_element), 0, 0, 'Y', '2018-07-05 11:47:43.764000', 100, '2018-07-05 11:47:43.764000', 100, 'count', 'U', 'count', 'count', null, null, null, null, null, null, 'ff43b6fc-d986-4167-9d28-a6e96abe950d', null)
ON CONFLICT DO NOTHING;

INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2018-07-05 11:47:43.739000', '2018-07-05 11:47:43.739000', 100, 100, 'Event Change Log', 'Type of Event in Change Log', null, 0, 'U', 'EventChangeLog', (SELECT ad_table_id FROM ad_table WHERE ad_table_uu = 'c1a566ff-922b-4214-8908-7f1a2897dedc'), 17, 53238, null, 1, null, 'N', 'N', 'N', 'Y', null, 'N', 0, 'N', 'N', null, null, null, null, 'N', 53345, null, 'Y', 'N', null, null, null, 'N', 'Y', null, '52410848-1195-427b-80ec-1a06d5b6ce18', 'Y', 0, 'N', 'N', null, null, 'N', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2018-07-05 11:47:43.816000', '2018-07-05 11:47:43.816000', 100, 100, 'Created By', 'User who created this records', 'The Created By field indicates the user who created this record.', 0, 'U', 'CreatedBy', (SELECT ad_table_id FROM ad_table WHERE ad_table_uu = 'c1a566ff-922b-4214-8908-7f1a2897dedc'), 18, 110, null, 22, null, 'N', 'N', 'N', 'N', null, 'N', 0, 'N', 'N', null, null, null, null, 'N', 246, null, 'Y', 'N', null, null, null, 'N', 'Y', null, 'e8ac1556-b625-4b60-9cff-27d6c92e6676', 'N', 0, 'N', 'N', null, null, 'D', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2018-07-05 11:47:43.842000', '2018-07-05 11:47:43.842000', 100, 100, 'Client', 'Client/Tenant for this installation.', 'A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.', 0, 'U', 'AD_Client_ID', (SELECT ad_table_id FROM ad_table WHERE ad_table_uu = 'c1a566ff-922b-4214-8908-7f1a2897dedc'), 19, null, 129, 22, null, 'N', 'N', 'N', 'N', null, 'N', 0, 'N', 'N', null, null, null, null, 'N', 102, null, 'Y', 'N', null, null, null, 'N', 'Y', null, '56fd3d50-3756-4103-b844-c28d99e08025', 'N', 0, 'N', 'N', null, null, 'D', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2018-07-05 11:47:43.870000', '2018-07-05 11:47:43.870000', 100, 100, 'Organization', 'Organizational entity within client', 'An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.', 0, 'U', 'AD_Org_ID', (SELECT ad_table_id FROM ad_table WHERE ad_table_uu = 'c1a566ff-922b-4214-8908-7f1a2897dedc'), 19, null, 104, 22, null, 'N', 'N', 'N', 'N', null, 'N', 0, 'N', 'N', null, null, null, null, 'N', 113, null, 'Y', 'N', null, null, null, 'N', 'Y', null, 'b4b9e7f6-3c62-47ac-a811-3fae05527f8c', 'N', 0, 'N', 'N', null, null, 'D', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2018-07-05 11:47:43.670000', '2018-07-19 15:32:15.190000', 100, 100, 'Table', 'Database Table information', 'The Database Table provides the information of the table definition', 0, 'U', 'AD_Table_ID', (SELECT ad_table_id FROM ad_table WHERE ad_table_uu = 'c1a566ff-922b-4214-8908-7f1a2897dedc'), 18, (SELECT ad_reference_id FROM ad_reference WHERE ad_reference_uu = 'd2872478-6a24-4261-8178-bd71bce3f177'), null, 10, null, 'N', 'N', 'N', 'Y', null, 'N', 0, 'N', 'N', null, null, null, null, 'N', 126, null, 'Y', 'N', null, null, null, 'N', 'Y', null, 'd1e54149-6b7c-483a-83c2-716c2d10aab9', 'Y', 0, 'N', 'N', null, null, null, null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2018-07-05 11:47:43.788000', '2020-04-22 05:28:18.121177', 100, 100, 'count', null, null, 0, 'U', 'count', (SELECT ad_table_id FROM ad_table WHERE ad_table_uu = 'c1a566ff-922b-4214-8908-7f1a2897dedc'), 11, null, null, 14, null, 'N', 'N', 'N', 'Y', null, 'N', 0, 'N', 'N', null, null, null, null, 'N', (SELECT ad_element_id FROM ad_element WHERE ad_element_uu = 'ff43b6fc-d986-4167-9d28-a6e96abe950d'), null, 'Y', 'N', null, null, null, 'N', 'Y', null, '5858cb67-dda1-479d-b051-0bbda5ef9654', 'Y', 0, 'N', 'N', null, null, 'N', null, null, 'N') ON CONFLICT DO NOTHING;
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_id) + 1 FROM ad_column), 0, 0, 'Y', '2018-07-05 11:47:43.711000', '2018-07-05 11:47:43.711000', 100, 100, 'Created', 'Date this record was created', 'The Created field indicates the date that this record was created.', 0, 'U', 'Created', (SELECT ad_table_id FROM ad_table WHERE ad_table_uu = 'c1a566ff-922b-4214-8908-7f1a2897dedc'), 16, null, null, 7, null, 'N', 'N', 'N', 'N', null, 'N', 0, 'N', 'N', null, null, null, null, 'N', 245, null, 'Y', 'N', null, null, null, 'N', 'Y', 'MMM dd, yyyy', '0108921f-b3b3-4bbc-a1f6-9dbf64601235', 'N', 0, 'N', 'N', null, null, 'N', null, null, 'N') ON CONFLICT DO NOTHING;

INSERT INTO ad_reportview (ad_reportview_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, ad_table_id, whereclause, orderbyclause, entitytype, ad_reportview_uu) VALUES ((SELECT MAX(ad_reportview_id) + 1 FROM ad_reportview), 0, 0, 'Y', '2018-07-05 11:47:43.906000', 100, '2018-10-08 15:20:28.076000', 100, 'bh_changelogs_v', null, (SELECT ad_table_id FROM ad_table WHERE ad_table_uu = 'c1a566ff-922b-4214-8908-7f1a2897dedc'), null, null, 'U', '644323a3-340b-4af4-a53f-5965dc7b9fea')
ON CONFLICT DO NOTHING;

INSERT INTO ad_process (ad_process_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, name, description, help, accesslevel, entitytype, procedurename, isreport, isdirectprint, ad_reportview_id, classname, statistic_count, statistic_seconds, ad_printformat_id, workflowvalue, ad_workflow_id, isbetafunctionality, isserverprocess, showhelp, jasperreport, ad_form_id, copyfromprocess, ad_process_uu, ad_ctxhelp_id, executiontype, allowmultipleexecution) VALUES ((SELECT MAX(ad_process_id) + 1 FROM ad_process), 0, 0, 'Y', '2018-07-05 11:47:44.080000', 100, '2018-07-31 15:18:37.868000', 100, '10000005', 'BH Daily Activities', null, null, '3', 'U', null, 'Y', 'N', (SELECT ad_reportview_id FROM ad_reportview WHERE ad_reportview_uu = '644323a3-340b-4af4-a53f-5965dc7b9fea'), null, 0, 0, null, null, null, 'N', 'N', 'Y', null, null, 'N', '97256934-cced-48fa-9cc6-5170e2a772a7', null, null, 'P')
ON CONFLICT DO NOTHING;

INSERT INTO ad_menu (ad_menu_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, name, updatedby, description, issummary, issotrx, isreadonly, action, ad_window_id, ad_workflow_id, ad_task_id, ad_process_id, ad_form_id, ad_workbench_id, entitytype, iscentrallymaintained, ad_menu_uu, ad_infowindow_id) VALUES ((SELECT MAX(ad_menu_id) + 1 FROM ad_menu), 0, 0, 'Y', '2018-07-05 11:47:44.237000', 100, '2018-07-31 15:18:37.873000', 'BH Daily Activities', 100, null, 'N', 'N', 'N', 'R', null, null, null, (SELECT ad_process_id FROM ad_process WHERE ad_process_uu = '97256934-cced-48fa-9cc6-5170e2a772a7'), null, null, 'U', 'Y', '6491bbbc-8bb1-47d5-9019-622f38b51be7', null)
ON CONFLICT DO NOTHING;

INSERT INTO ad_process (ad_process_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, name, description, help, accesslevel, entitytype, procedurename, isreport, isdirectprint, ad_reportview_id, classname, statistic_count, statistic_seconds, ad_printformat_id, workflowvalue, ad_workflow_id, isbetafunctionality, isserverprocess, showhelp, jasperreport, ad_form_id, copyfromprocess, ad_process_uu, ad_ctxhelp_id, executiontype, allowmultipleexecution) VALUES ((SELECT MAX(ad_process_id) + 1 FROM ad_process), 0, 0, 'Y', '2019-08-16 16:26:15.164000', 100, '2019-08-22 10:50:24.509000', 100, 'BH Stock Re-order levels', 'Stock to be Ordered', 'Generate List of stock that need to be ordered', null, '3', 'U', null, 'Y', 'N', null, null, 0, 0, null, null, null, 'N', 'N', 'Y', 'reorderStock.jasper', null, 'N', 'd42deea6-c650-42b4-a21c-90b3ef0fa99f', null, null, 'P') ON CONFLICT DO NOTHING;
INSERT INTO ad_process (ad_process_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, name, description, help, accesslevel, entitytype, procedurename, isreport, isdirectprint, ad_reportview_id, classname, statistic_count, statistic_seconds, ad_printformat_id, workflowvalue, ad_workflow_id, isbetafunctionality, isserverprocess, showhelp, jasperreport, ad_form_id, copyfromprocess, ad_process_uu, ad_ctxhelp_id, executiontype, allowmultipleexecution) VALUES ((SELECT MAX(ad_process_id) + 1 FROM ad_process), 0, 0, 'Y', '2018-06-27 12:56:49.484000', 100, '2018-06-27 12:56:49.484000', 100, '10000002', 'Revenue Breakdown', null, null, '3', 'U', null, 'Y', 'N', null, null, 0, 0, null, null, null, 'N', 'N', 'Y', 'DepartmentCollections.jasper', null, 'N', '27dbc237-256c-4b96-a164-dc9bcd4ad3a7', null, null, 'P') ON CONFLICT DO NOTHING;
INSERT INTO ad_process (ad_process_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, name, description, help, accesslevel, entitytype, procedurename, isreport, isdirectprint, ad_reportview_id, classname, statistic_count, statistic_seconds, ad_printformat_id, workflowvalue, ad_workflow_id, isbetafunctionality, isserverprocess, showhelp, jasperreport, ad_form_id, copyfromprocess, ad_process_uu, ad_ctxhelp_id, executiontype, allowmultipleexecution) VALUES ((SELECT MAX(ad_process_id) + 1 FROM ad_process), 0, 0, 'Y', '2018-06-27 13:08:07.312000', 100, '2018-06-27 13:08:07.312000', 100, '10000003', 'Revenue Detailed', null, null, '3', 'U', null, 'Y', 'N', null, null, 0, 0, null, null, null, 'N', 'N', 'Y', 'DepartmentCollections.jasper', null, 'N', 'db969c7f-36f8-4f35-b9cb-d26528d95034', null, null, 'P') ON CONFLICT DO NOTHING;
INSERT INTO ad_process (ad_process_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, name, description, help, accesslevel, entitytype, procedurename, isreport, isdirectprint, ad_reportview_id, classname, statistic_count, statistic_seconds, ad_printformat_id, workflowvalue, ad_workflow_id, isbetafunctionality, isserverprocess, showhelp, jasperreport, ad_form_id, copyfromprocess, ad_process_uu, ad_ctxhelp_id, executiontype, allowmultipleexecution) VALUES ((SELECT MAX(ad_process_id) + 1 FROM ad_process), 0, 0, 'Y', '2018-06-25 09:16:26.229000', 100, '2018-06-27 09:44:34.670000', 100, '10000001', 'Department Revenue', 'Report shows the breakdown of how much the departments contributed to the total revenue', null, '3', 'U', null, 'Y', 'N', null, null, 1, 6, null, null, null, 'N', 'N', 'Y', 'Department Revenue.jasper', null, 'N', 'd48c66ff-c448-40fd-ab26-8fceb64f250c', null, null, 'P') ON CONFLICT DO NOTHING;
INSERT INTO ad_process (ad_process_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, name, description, help, accesslevel, entitytype, procedurename, isreport, isdirectprint, ad_reportview_id, classname, statistic_count, statistic_seconds, ad_printformat_id, workflowvalue, ad_workflow_id, isbetafunctionality, isserverprocess, showhelp, jasperreport, ad_form_id, copyfromprocess, ad_process_uu, ad_ctxhelp_id, executiontype, allowmultipleexecution) VALUES ((SELECT MAX(ad_process_id) + 1 FROM ad_process), 0, 0, 'Y', '2018-09-20 12:20:13.747000', 100, '2018-09-20 12:32:40.402000', 100, '10000004', 'Income & Expenses', 'Summary report on income and expenses for a specified period', null, '3', 'U', null, 'Y', 'N', null, null, 6, 12, null, null, null, 'N', 'N', 'Y', 'IncomeStatement.jasper', null, 'N', 'f777f042-3907-4293-94c4-49fe6eb58780', null, null, 'P') ON CONFLICT DO NOTHING;
INSERT INTO ad_process (ad_process_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, name, description, help, accesslevel, entitytype, procedurename, isreport, isdirectprint, ad_reportview_id, classname, statistic_count, statistic_seconds, ad_printformat_id, workflowvalue, ad_workflow_id, isbetafunctionality, isserverprocess, showhelp, jasperreport, ad_form_id, copyfromprocess, ad_process_uu, ad_ctxhelp_id, executiontype, allowmultipleexecution) VALUES ((SELECT MAX(ad_process_id) + 1 FROM ad_process), 0, 0, 'Y', '2018-09-20 13:39:38.591000', 100, '2018-09-20 13:40:31.929000', 100, '10000005', 'Pending Patient Bills', 'Patient bills not yet completed', null, '3', 'U', null, 'Y', 'N', null, null, 6, 31, null, null, null, 'N', 'N', 'Y', 'BillsInDraftState.jasper', null, 'N', 'b2e3cbd1-1f23-449c-beb1-ed898fa77097', null, null, 'P') ON CONFLICT DO NOTHING;
INSERT INTO ad_process (ad_process_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, name, description, help, accesslevel, entitytype, procedurename, isreport, isdirectprint, ad_reportview_id, classname, statistic_count, statistic_seconds, ad_printformat_id, workflowvalue, ad_workflow_id, isbetafunctionality, isserverprocess, showhelp, jasperreport, ad_form_id, copyfromprocess, ad_process_uu, ad_ctxhelp_id, executiontype, allowmultipleexecution) VALUES ((SELECT MAX(ad_process_id) + 1 FROM ad_process), 0, 0, 'Y', '2019-05-13 15:56:10.685000', 100, '2019-05-13 15:56:10.685000', 100, '10000006', 'Products and Prices', 'Your Products and their Prices', 'Generate a list of your products and their prices', '3', 'U', null, 'Y', 'N', null, null, 7, 7, null, null, null, 'N', 'N', 'Y', 'productsAndPrices.jasper', null, 'N', '3edf67b9-ee3d-4b73-a02e-deb1c1811db5', null, null, 'P') ON CONFLICT DO NOTHING;

INSERT INTO ad_window (ad_window_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, windowtype, issotrx, entitytype, processing, ad_image_id, ad_color_id, isdefault, winheight, winwidth, isbetafunctionality, ad_window_uu, titlelogic) VALUES ((SELECT MAX(ad_window_id) + 1 FROM ad_window), 0, 0, 'Y', '2018-07-12 11:30:25.932000', 100, '2018-07-12 11:30:25.932000', 100, 'BH Metrics', 'BH Metrics', null, 'Q', 'N', 'U', 'N', null, null, 'N', 1000, 2000, 'N', 'e1814cba-b1d8-42f4-96dd-ffb4ec6da44f', null)
ON CONFLICT DO NOTHING;

UPDATE ad_field
SET ad_field_uu = 'b867d85a-c7e8-40e5-b3d9-08f8ac42b981'
WHERE ad_field_uu = '56de4716-17f3-43a2-9984-7f62c9cf9d4e';

UPDATE bh_dbrdbtngrp
SET bh_dbrdbtngrp_uu = '9b44ce0e-3113-4690-ad0b-92b95b34c741'
WHERE bh_dbrdbtngrp_uu = 'e7db1391-816c-499a-8634-32b6d7298d0a';

/**********************************************************************************************************/
-- Finish
/**********************************************************************************************************/
SELECT register_migration_script('202011191559_GO-1446.sql') FROM dual;
