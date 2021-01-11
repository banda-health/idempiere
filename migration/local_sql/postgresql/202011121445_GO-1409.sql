-- Update the appropriate users and set their roles to the normal user, not the Advanced
-- These users were previously given Advanced access
UPDATE ad_user_roles aur
SET ad_role_id = ar2.ad_role_id
FROM ad_user au
JOIN ad_client ac
	ON au.ad_client_id = ac.ad_client_id
JOIN ad_role ar
	ON 1=1
JOIN ad_role ar2
	ON ar.ad_client_id = ar2.ad_client_id
		AND ar2.name = ac.name || ' User'
WHERE au.ad_user_id IN (1018279,1018232,1008480,1008475,1001825,1023180,1023178,1023177,1004993,1004989,1010081,1001936,1017596,1045898,1001431,1009481,1003619,1002834,1001855,1036196,1036195,1043898,1043891,1002424,1001290,1031734,1019961,1019945,1043225,1006126,1002290,1002893,1000601,1000598,1012865,1010736,1013756,1030496,1012237,1045922,1006122,1006121,1014487,1014467,1000726,1000017,1045452,1003710)
	AND au.ad_user_id = aur.ad_user_id
	AND aur.ad_role_id = ar.ad_role_id;

-- Update one clinic where the names of roles is wrong
UPDATE ad_user_roles
SET ad_role_id = 1000015
WHERE ad_user_id = 1012237
	AND ad_role_id = 1000187;

UPDATE ad_user_roles
SET ad_role_id = 1000019
WHERE ad_user_id IN (1002424,1001290)
	AND ad_role_id = 1000176;

-- Remove all BandaGO Admin included roles from these roles
DELETE FROM ad_role_included ari
USING ad_role ar
JOIN ad_user_roles aur
	ON aur.ad_role_id = ar.ad_role_id
JOIN ad_user au
	ON au.ad_user_id = aur.ad_user_id
WHERE ari.included_role_id = 1000047
	AND ari.ad_role_id = ar.ad_role_id
	AND au.ad_user_id IN (1018279,1018232,1008480,1008475,1001825,1023180,1023178,1023177,1004993,1004989,1010081,1001936,1017596,1045898,1001431,1009481,1003619,1002834,1001855,1036196,1036195,1043898,1043891,1002424,1001290,1031734,1019961,1019945,1043225,1006126,1002290,1002893,1000601,1000598,1012865,1010736,1013756,1030496,1012237,1045922,1006122,1006121,1014487,1014467,1000726,1000017,1045452,1003710);

-- One role already has the "Manage Expenses" role assigned and it shouldn't be, so remove it
DELETE
FROM ad_role_included
WHERE ad_role_included_uu = 'e8ce82a6-05af-478d-9659-55ea4901999a';

-- Add all "normal" roles, aside from "Manage Expenses", to the regular user roles
INSERT INTO ad_role_included (
	ad_client_id,
	ad_org_id,
	ad_role_id,
	createdby,
	included_role_id,
	isactive,
	seqno,
	updatedby,
	ad_role_included_uu
)
SELECT
	ar.ad_client_id,
	0 as ad_org_id,
	ar.ad_role_id,
	100 as createdby,
	ri.ad_role_id as included_role_id,
	'Y' as isactive,
	ri.seqno * 10 as seqno,
	100 as updatedby,
	generate_uuid() as ad_role_included_uu
FROM (
	SELECT DISTINCT
		ad_role_id
	FROM ad_user_roles
	WHERE ad_user_id IN (1018279,1018232,1008480,1008475,1001825,1023180,1023178,1023177,1004993,1004989,1010081,1001936,1017596,1045898,1001431,1009481,1003619,1002834,1001855,1036196,1036195,1043898,1043891,1002424,1001290,1031734,1019961,1019945,1043225,1006126,1002290,1002893,1000601,1000598,1012865,1010736,1013756,1030496,1012237,1045922,1006122,1006121,1014487,1014467,1000726,1000017,1045452,1003710)
) aur
JOIN ad_role ar
	ON aur.ad_role_id = ar.ad_role_id
CROSS JOIN (
	SELECT
		ad_role_id,
		row_number() OVER (ORDER BY name) as seqno
	FROM ad_role
	WHERE ad_role_id IN (1000044,1000038,1000037,1000045,1000036,1000039,1000041,1000042,1000094,1000096,1000104,1000043)
) ri;

SELECT register_migration_script('202011121445_GO-1409.sql') FROM dual;
