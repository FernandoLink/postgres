----------------------------------------------------------------------------------------
CREATE FUNCTION primeira_funcao() RETURNS INTEGER AS '
    SELECT (5 - 3) * 2
' LANGUAGE SQL;

SELECT primeira_funcao();
SELECT primeira_funcao() AS numero;
SELECT * from primeira_funcao() as numero;
----------------------------------------------------------------------------------------
CREATE FUNCTION soma_dois_numeros(numero_1 INTEGER, numero_2 INTEGER) RETURNS INTEGER AS 
'
	SELECT numero_1 + numero_2
' 
LANGUAGE SQL;

DROP FUNCTION soma_dois_numeros;
CREATE FUNCTION soma_dois_numeros(INTEGER, INTEGER) RETURNS INTEGER AS 
'
	SELECT $1 + $2
' 
LANGUAGE SQL;

SELECT soma_dois_numeros(2, 2);
SELECT soma_dois_numeros(3, 4) AS SOMA;
SELECT * from soma_dois_numeros(7, 8) as SOMA;
----------------------------------------------------------------------------------------







