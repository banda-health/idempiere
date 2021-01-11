UPDATE ad_column
SET columnname = 'NationalID'
WHERE columnname = 'National_ID';

UPDATE ad_element
SET columnname = 'NationalID'
WHERE columnname = 'National_ID';

SELECT register_migration_script('202012151158_GO-1490.sql') FROM dual;