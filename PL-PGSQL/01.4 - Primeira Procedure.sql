CREATE OR REPLACE PROCEDURE clean() AS '
    DELETE FROM a WHERE nome = ''Patricia'';
' LANGUAGE SQL;

SELECT * FROM a;

CALL clean();



