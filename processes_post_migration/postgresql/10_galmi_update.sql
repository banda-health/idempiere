-- We only want to run this script if it's the Galmi hospital
DO $$
BEGIN
	IF EXISTS (SELECT * FROM ad_client WHERE name = 'Galmi Hospital') THEN
		/**********************************************************************************************************/
		-- Hide some fields that shouldn't be present
		/**********************************************************************************************************/
		-- PATIENT
		-- Update the patient page to remove NHIF fields
		UPDATE ad_field
		SET isdisplayedgrid = 'N', isdisplayed = 'N'
		WHERE ad_field_uu IN ('dba619c4-a12e-405e-bb64-131f93dd8a26','563bd266-c62a-468b-90c0-15a33ec0f66d','c3aecc75-93f4-4e6f-b48c-3d0534327687','5246f5a5-4de7-46e6-a6f7-7746a2424f39');

		-- VENDOR
		-- Hide the "Vendor Information" divider on the Supplier field by updating it's link on the Payment Rule
		UPDATE ad_field
		SET ad_fieldgroup_id = NULL, seqno = 100
		WHERE ad_field_uu = 'f3fa7c68-d2db-4ea3-b614-e3e79a9ca79d';

		-- PRODUCTS
		UPDATE ad_field
		SET name = 'Buying Price'
		WHERE ad_field_uu = 'a787d166-b3ef-4dcd-8fda-77bbbe7e3d9b';
		UPDATE ad_field
		SET name = 'Selling Price'
		WHERE ad_field_uu = '1b3da64b-69e0-41bc-9078-a5f6eaf4a9e9';

		-- SERVICES
		UPDATE ad_field
		SET name = 'Selling Price'
		WHERE ad_field_uu = '9f081fd6-94e7-4e49-810a-3a1793f04d3c';

		-- PATIENT BILL
		UPDATE ad_field
		SET name = 'Patient Name'
		WHERE ad_field_uu = '1c287ec6-0aef-4048-a47f-15e8a3bda44d';
		UPDATE ad_field
		SET name = 'Store'
		WHERE ad_field_uu = '268940f0-1fa6-48cd-8934-096d286d590e';
		UPDATE ad_field
		SET name = 'Expiry Date'
		WHERE ad_field_uu = '02735b89-a112-4922-b440-8f2e77a36f37';
		UPDATE ad_field
		SET name = 'Payment type'
		WHERE ad_field_uu = 'cda9cc23-d70f-4ccf-b57e-5ae0fd07daf3';

		-- SERVICE DEBT
		UPDATE ad_field
		SET name = 'Patient'
		WHERE ad_field_uu = 'f9d82295-6cba-429f-9162-6242b10586d6';
		UPDATE ad_field
		SET name = 'Payment type'
		WHERE ad_field_uu = '6e1beac7-19e1-4be3-8c05-790102fad3b6';

		-- TRACK EXPENSES
		UPDATE ad_field
		SET name = 'Provider'
		WHERE ad_field_uu = '74927d98-1b2e-4690-8ae0-85261441ef6f';
		UPDATE ad_field
		SET name = 'Transaction Status'
		WHERE ad_field_uu = 'e5ed889e-9e23-4ae2-b652-980945003830';
		UPDATE ad_field
		SET name = 'Expense Date'
		WHERE ad_field_uu = '786b6a82-32fe-4aa6-96a2-4e22736849a5';
		UPDATE ad_field
		SET name = 'Expense Category'
		WHERE ad_field_uu = 'c156a11a-8daa-4b0e-a3e6-b2a22aa6afe0';
		UPDATE ad_field
		SET name = 'Amount'
		WHERE ad_field_uu = '6ebe24e6-afc4-40bc-9ff6-d9a57b167d44';

		-- RECEIVE PRODUCTS
		UPDATE ad_field
		SET name = 'Product'
		WHERE ad_field_uu = '42874f5f-f9a4-4f6a-8b4c-d009dcb08733';

		/**********************************************************************************************************/
		-- Inactivate some payment types that aren't needed
		/**********************************************************************************************************/
		UPDATE ad_ref_list
		SET isactive = 'N'
		WHERE ad_reference_id = 214
			AND Value != 'X';
	END IF;

END $$ language plpgsql;