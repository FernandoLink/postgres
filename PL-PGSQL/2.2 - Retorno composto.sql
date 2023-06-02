CREATE FUNCTION cria_instrutor_falso() RETURNS instrutor AS $$ 
      SELECT 22, 'Nome falso', 200
$$ LANGUAGE SQL;


SELECT 22 AS id, 'Nome falso' AS nome, 200 AS salario;


CREATE OR REPLACE FUNCTION cria_instrutor_falso() RETURNS instrutor AS $$ 
      SELECT 22 AS id, 'Nome falso' AS nome, 200.0 AS salario; 
$$ LANGUAGE SQL;



CREATE OR REPLACE FUNCTION cria_instrutor_falso() RETURNS instrutor AS $$ 
      SELECT 22 AS id, 'Nome falso' AS nome, 200::DECIMAL AS salario; 
$$ LANGUAGE SQL;


CREATE OR REPLACE FUNCTION cria_instrutor_falso() RETURNS instrutor AS $$ 
      SELECT 22, 'Nome falso', 200::DECIMAL; 
$$ LANGUAGE SQL;


SELECT cria_instrutor_falso();


SELECT * FROM cria_instrutor_falso(); 

SELECT * FROM cria_instrutor_falso(); 
SELECT id, salario FROM cria_instrutor_falso(); 
