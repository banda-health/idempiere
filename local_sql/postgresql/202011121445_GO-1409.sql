-- Update the appropriate users and set their roles to the normal user, not the Advanced
-- These users were previously given Advanced access
UPDATE aur
SET aur.ad_role_id = ar2.ad_role_id
FROM ad_user au
JOIN ad_client ac
    ON au.ad_client_id = ac.ad_client_id
JOIN ad_user_roles aur
    ON au.ad_user_id = aur.ad_user_id
JOIN ad_role ar
    ON aur.ad_role_id = ar.ad_role_id
JOIN ad_role ar2
    ON ar.ad_client_id = ar2.ad_client_id
        AND ar2.name = ac.name || ' User'
WHERE au.ad_user_id IN (1018279,1018232,1008480,1008475,1001825,1023180,1023178,1023177,1004993,1004989,1010081,1001936,1017596,1045898,1001431,1009481,1003619,1002834,1001855,1036196,1036195,1043898,1043891,1002424,1001290,1031734,1019961,1019945,1043225,1006126,1002290,1002893,1000601,1000598,1012865,1010736,1013756,1030496,1012237,1045922,1006122,1006121,1014487,1014467,1000726,1000017,1045452,1003710);

SELECT register_migration_script('202011121445_GO-1409.sql') FROM dual;
