-- IDEMPIERE-4199 Clean up org.adempiere.extend
CREATE OR REPLACE FUNCTION isnumeric(
	text)
    RETURNS boolean
    LANGUAGE 'plpgsql'

    COST 100
    IMMUTABLE STRICT
AS $BODY$
DECLARE x NUMERIC;
BEGIN
    x = $1::NUMERIC;
    RETURN TRUE;
EXCEPTION WHEN others THEN
    RETURN FALSE;
END;
$BODY$;

SELECT register_migration_script('202009101327-GO-1290.sql') FROM dual;
