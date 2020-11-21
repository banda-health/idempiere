-- Ensure ad_sequence is correct for starters (I think it was missed in a previous script)
UPDATE ad_sequence
SET currentnext = (SELECT MAX(ad_sequence_id) + 1 FROM ad_sequence)
WHERE name = 'AD_Sequence';


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
INSERT INTO ad_sequence (ad_sequence_id, ad_client_id, ad_org_id, isactive, createdby, updatedby, name, description, vformat, isautosequence, incrementno, startno, currentnext, currentnextsys, isaudited, istableid, prefix, suffix, startnewyear, datecolumn, decimalpattern, ad_sequence_uu, startnewmonth, isorglevelsequence, orgcolumn) VALUES ((SELECT currentnext FROM ad_sequence WHERE name = 'AD_Sequence'), 0, 0, 'Y', 1001875, 1001875, 'BH_UIButton', 'Table BH_UIButton', null, 'Y', 1, 1000000, 1000014, 200000, 'N', 'Y', null, null, 'N', null, null, '96263e1e-b946-4eaa-b3f9-aab99db9f6b5', 'N', 'N', null)
ON CONFLICT DO NOTHING;
UPDATE ad_sequence
SET currentnext = (SELECT MAX(ad_sequence_id) + 1 FROM ad_sequence)
WHERE name = 'AD_Sequence';

/**********************************************************************************************************/
-- Insert the data into AD_Element and AD_Column so translations will work when the 2-pack is imported
/**********************************************************************************************************/
INSERT INTO ad_element (ad_element_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, columnname, entitytype, name, printname, description, help, po_name, po_printname, po_description, po_help, ad_element_uu, placeholder) VALUES ((SELECT MAX(ad_element_id) FROM ad_element), 0, 0, 'Y', '2019-03-20 15:39:54.534000', 100, '2019-03-20 15:39:54.534000', 100, 'BH_UIButton_ID', 'U', 'BH_UIButton', 'BH_UIButton', null, null, null, null, null, null, 'c215235a-a1f5-421d-8f5a-4e8b65bbff9d', null) ON CONFLICT DO NOTHING;
INSERT INTO ad_element (ad_element_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, columnname, entitytype, name, printname, description, help, po_name, po_printname, po_description, po_help, ad_element_uu, placeholder) VALUES ((SELECT MAX(ad_element_id) FROM ad_element), 0, 0, 'Y', '2019-03-20 15:39:54.836000', 100, '2019-03-20 15:39:54.836000', 100, 'BH_UIButton_UU', 'U', 'BH_UIButton_UU', 'BH_UIButton_UU', null, null, null, null, null, null, '38d32082-6fce-455c-b19b-6482ad7ae2b9', null) ON CONFLICT DO NOTHING;
INSERT INTO ad_element (ad_element_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, columnname, entitytype, name, printname, description, help, po_name, po_printname, po_description, po_help, ad_element_uu, placeholder) VALUES ((SELECT MAX(ad_element_id) FROM ad_element), 0, 0, 'Y', '2019-03-20 15:39:55.506000', 100, '2019-03-20 15:39:55.506000', 100, 'CssVariableName', 'U', 'CssVariableName', 'CSS Variable Name', null, null, null, null, null, null, '66645d55-e9e3-4efc-b604-cef21861edb6', null) ON CONFLICT DO NOTHING;
INSERT INTO ad_element (ad_element_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, columnname, entitytype, name, printname, description, help, po_name, po_printname, po_description, po_help, ad_element_uu, placeholder) VALUES ((SELECT MAX(ad_element_id) FROM ad_element), 0, 0, 'Y', '2019-03-20 15:41:18.737000', 100, '2019-03-20 15:41:18.737000', 100, 'BH_UIButton_Trl_UU', 'U', 'BH_UIButton_Trl_UU', 'BH_UIButton_Trl_UU', null, null, null, null, null, null, '87af70d6-9d8b-46ec-b8c9-956fef633b7c', null) ON CONFLICT DO NOTHING;
UPDATE ad_sequence
SET currentnext = (SELECT MAX(ad_element_id) + 1 FROM ad_element)
WHERE name = 'AD_Element';

INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_Id) FROM ad_column), 0, 0, 'Y', '2019-03-20 15:39:54.571000', '2019-03-20 15:39:54.571000', 100, 100, 'BH_UIButton', null, null, 1, 'U', 'BH_UIButton_ID', 1000034, 13, null, null, 22, null, 'Y', 'N', 'Y', 'N', null, 'N', null, 'N', 'N', null, null, null, null, 'N', (SELECT ad_element_id FROM ad_element WHERE columnname = 'BH_UIButton_ID'), null, 'Y', 'N', null, null, null, 'N', 'Y', null, 'e4dfedb4-48f7-47dc-b46e-4476fa029671', 'N', null, 'N', 'N', null, null, 'N', null, null, 'N');
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_Id) FROM ad_column), 0, 0, 'Y', '2019-03-20 15:39:54.642000', '2019-03-20 15:39:54.642000', 100, 100, 'Client', 'Client/Tenant for this installation.', 'A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.', 1, 'U', 'AD_Client_ID', 1000034, 19, null, 129, 22, '@#AD_Client_ID@', 'N', 'N', 'Y', 'N', null, 'N', null, 'N', 'N', null, null, null, null, 'N', 102, null, 'Y', 'N', null, null, null, 'N', 'Y', null, '0ec4f5b0-aa66-478b-b345-3dc377d2a171', 'N', null, 'N', 'N', null, 'ADClient_BHUIButton', 'N', null, null, 'N');
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_Id) FROM ad_column), 0, 0, 'Y', '2019-03-20 15:39:54.718000', '2019-03-20 15:39:54.718000', 100, 100, 'Organization', 'Organizational entity within client', 'An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.', 1, 'U', 'AD_Org_ID', 1000034, 19, null, 104, 22, '@#AD_Org_ID@', 'N', 'N', 'Y', 'N', null, 'N', null, 'N', 'N', null, null, null, null, 'N', 113, null, 'Y', 'N', null, null, null, 'N', 'Y', null, 'f39e08bf-abb5-4a48-84f7-fda9319e86b2', 'N', null, 'N', 'N', null, 'ADOrg_BHUIButton', 'N', null, null, 'N');
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_Id) FROM ad_column), 0, 0, 'Y', '2019-03-20 15:39:54.872000', '2019-03-20 15:39:54.872000', 100, 100, 'BH_UIButton_UU', null, null, 1, 'U', 'BH_UIButton_UU', 1000034, 10, null, null, 36, null, 'N', 'N', 'N', 'Y', null, 'N', null, 'N', 'N', null, null, null, null, 'N', (SELECT ad_element_id FROM ad_element WHERE columnname = 'BH_UIButton_UU'), null, 'Y', 'N', null, null, null, 'N', 'Y', null, '10efb8c9-b1bc-418f-bde2-03e65d2dd4ae', 'N', null, 'N', 'N', null, null, 'N', null, null, 'N');
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_Id) FROM ad_column), 0, 0, 'Y', '2019-03-20 15:39:54.942000', '2019-03-20 15:39:54.942000', 100, 100, 'Created', 'Date this record was created', 'The Created field indicates the date that this record was created.', 1, 'U', 'Created', 1000034, 16, null, null, 7, 'SYSDATE', 'N', 'N', 'Y', 'N', null, 'N', null, 'N', 'N', null, null, null, null, 'N', 245, null, 'Y', 'N', null, null, null, 'N', 'Y', null, 'f2921540-7ca9-46b1-b572-6ab4553c0ded', 'N', null, 'N', 'N', null, null, 'N', null, null, 'N');
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_Id) FROM ad_column), 0, 0, 'Y', '2019-03-20 15:39:55.014000', '2019-03-20 15:39:55.014000', 100, 100, 'Created By', 'User who created this records', 'The Created By field indicates the user who created this record.', 1, 'U', 'CreatedBy', 1000034, 18, 110, null, 22, null, 'N', 'N', 'Y', 'N', null, 'N', null, 'N', 'N', null, null, null, null, 'N', 246, null, 'Y', 'N', null, null, null, 'N', 'Y', null, '605fb5d1-f630-47c6-b3e9-2318f404706e', 'N', null, 'N', 'N', null, null, 'D', null, null, 'N');
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_Id) FROM ad_column), 0, 0, 'Y', '2019-03-20 15:39:55.104000', '2019-03-20 15:39:55.104000', 100, 100, 'Description', 'Optional short description of the record', 'A description is limited to 255 characters.', 1, 'U', 'Description', 1000034, 10, null, null, 255, null, 'N', 'N', 'N', 'Y', null, 'N', null, 'N', 'N', null, null, null, null, 'Y', 275, null, 'Y', 'N', null, null, null, 'N', 'Y', null, '88a977a3-064e-47a1-a606-f098413564d6', 'Y', null, 'N', 'N', null, null, 'N', null, null, 'N');
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_Id) FROM ad_column), 0, 0, 'Y', '2019-03-20 15:39:55.176000', '2019-03-20 15:39:55.176000', 100, 100, 'Active', 'The record is active in the system', 'There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.', 1, 'U', 'IsActive', 1000034, 20, null, null, 1, 'Y', 'N', 'N', 'Y', 'Y', null, 'N', null, 'N', 'N', null, null, null, null, 'N', 348, null, 'Y', 'N', null, null, null, 'N', 'Y', null, '57cba021-be81-4209-8ec1-7da0636e3c2d', 'N', null, 'N', 'N', null, null, 'N', null, null, 'N');
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_Id) FROM ad_column), 0, 0, 'Y', '2019-03-20 15:39:55.310000', '2019-03-20 15:39:55.310000', 100, 100, 'Name', 'Alphanumeric identifier of the entity', 'The name of an entity (record) is used as an default search option in addition to the search key. The name is up to 60 characters in length.', 1, 'U', 'Name', 1000034, 10, null, null, 60, null, 'N', 'N', 'Y', 'Y', null, 'Y', 1, 'Y', 'N', null, null, null, null, 'Y', 469, null, 'Y', 'N', null, null, null, 'N', 'Y', null, 'b727f21e-ba3e-4e9e-8c8a-b31407816973', 'Y', null, 'N', 'N', null, null, 'N', null, null, 'N');
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_Id) FROM ad_column), 0, 0, 'Y', '2019-03-20 15:39:55.376000', '2019-03-20 15:39:55.376000', 100, 100, 'Updated', 'Date this record was updated', 'The Updated field indicates the date that this record was updated.', 1, 'U', 'Updated', 1000034, 16, null, null, 7, 'SYSDATE', 'N', 'N', 'Y', 'N', null, 'N', null, 'N', 'N', null, null, null, null, 'N', 607, null, 'Y', 'N', null, null, null, 'N', 'Y', null, '473088cd-f059-4283-9899-ec4328474233', 'N', null, 'N', 'N', null, null, 'N', null, null, 'N');
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_Id) FROM ad_column), 0, 0, 'Y', '2019-03-20 15:39:55.443000', '2019-03-20 15:39:55.443000', 100, 100, 'Updated By', 'User who updated this records', 'The Updated By field indicates the user who updated this record.', 1, 'U', 'UpdatedBy', 1000034, 18, 110, null, 22, null, 'N', 'N', 'Y', 'N', null, 'N', null, 'N', 'N', null, null, null, null, 'N', 608, null, 'Y', 'N', null, null, null, 'N', 'Y', null, '49ffcbb0-600b-46a5-93ee-3352870d2a02', 'N', null, 'N', 'N', null, null, 'D', null, null, 'N');
INSERT INTO ad_column (ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern, ad_column_uu, isallowcopy, seqnoselection, istoolbarbutton, issecure, ad_chart_id, fkconstraintname, fkconstrainttype, pa_dashboardcontent_id, placeholder, ishtml) VALUES ((SELECT MAX(ad_column_Id) FROM ad_column), 0, 0, 'Y', '2019-03-20 15:39:55.553000', '2019-03-20 15:39:55.553000', 100, 100, 'CssVariableName', null, null, 0, 'U', 'CssVariableName', 1000034, 10, null, null, 100, null, 'N', 'N', 'Y', 'Y', null, 'N', 0, 'N', 'N', null, null, null, null, 'Y', (SELECT ad_element_id FROM ad_element WHERE columnname = 'CssVariableName'), null, 'Y', 'N', null, null, null, 'N', 'Y', null, 'eb353438-e2bd-40d9-86d3-81adc527337a', 'Y', 0, 'N', 'N', null, null, 'N', null, null, 'N');
UPDATE ad_sequence
SET currentnext = (SELECT MAX(ad_element_id) + 1 FROM ad_element)
WHERE name = 'AD_Column';

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
INSERT INTO ad_sequence (ad_sequence_id, ad_client_id, ad_org_id, isactive, createdby, updatedby, name, description, vformat, isautosequence, incrementno, startno, currentnext, currentnextsys, isaudited, istableid, prefix, suffix, startnewyear, datecolumn, decimalpattern, ad_sequence_uu, startnewmonth, isorglevelsequence, orgcolumn) VALUES ((SELECT currentnext FROM ad_sequence WHERE name = 'AD_Sequence'), 0, 0, 'Y', 1001875, 1001875, 'BH_UIButton_Trl', 'Table BH_UIButton_Trl', null, 'Y', 1, 1000000, 1000000, 200000, 'N', 'Y', null, null, 'N', null, null, 'd6bfb9f6-3cb3-4994-a8f1-193b2ac7d864', 'N', 'N', null)
ON CONFLICT DO NOTHING;
UPDATE ad_sequence
SET currentnext = (SELECT MAX(ad_sequence_id) + 1 FROM ad_sequence)
WHERE name = 'AD_Sequence';

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

INSERT INTO ad_sequence (ad_sequence_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, vformat, isautosequence, incrementno, startno, currentnext, currentnextsys, isaudited, istableid, prefix, suffix, startnewyear, datecolumn, decimalpattern, ad_sequence_uu, startnewmonth, isorglevelsequence, orgcolumn) VALUES (1000214, 0, 0, 'Y', '2019-03-20 15:39:51.091000', 100, '2019-03-20 15:39:51.091000', 100, 'BH_DbrdBtnGrp_Trl', 'Table BH_DbrdBtnGrp_Trl', null, 'Y', 1, 1000000, 1000000, 200000, 'N', 'Y', null, null, 'N', null, null, '955ed774-aa59-46f5-95ae-69cb9a039a0c', 'N', 'N', null)
ON CONFLICT DO NOTHING;
UPDATE ad_sequence
SET currentnext = (SELECT MAX(ad_sequence_id) + 1 FROM ad_sequence)
WHERE name = 'AD_Sequence';

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

INSERT INTO ad_sequence (ad_sequence_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, vformat, isautosequence, incrementno, startno, currentnext, currentnextsys, isaudited, istableid, prefix, suffix, startnewyear, datecolumn, decimalpattern, ad_sequence_uu, startnewmonth, isorglevelsequence, orgcolumn) VALUES (1000215, 0, 0, 'Y', '2019-03-20 15:39:52.570000', 100, '2019-03-20 15:39:52.570000', 100, 'BH_DbrdBtnGrp_Btn_Trl', 'Table BH_DbrdBtnGrp_Btn_Trl', null, 'Y', 1, 1000000, 1000000, 200000, 'N', 'Y', null, null, 'N', null, null, 'de74978e-0085-4f29-bd55-359902ce1e45', 'N', 'N', null)
ON CONFLICT DO NOTHING;
UPDATE ad_sequence
SET currentnext = (SELECT MAX(ad_sequence_id) + 1 FROM ad_sequence)
WHERE name = 'AD_Sequence';

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
-- Finish
/**********************************************************************************************************/
SELECT register_migration_script('202011191559_GO-1446.sql') FROM dual;
