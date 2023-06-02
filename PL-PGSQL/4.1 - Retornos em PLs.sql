DROP FUNCTION cria_a;

CREATE OR REPLACE FUNCTION cria_a( nome VARCHAR) RETURNS void AS $$
    BEGIN
        INSERT INTO a(nome) VALUES('Patricia');
    END;
$$ LANGUAGE plpgsql;

SELECT cria_a('Vinicius Dias')

CREATE OR REPLACE FUNCTION cria_instrutor_falso() RETURNS instrutor AS $$ 
    BEGIN
        RETURN ROW(22, 'Nome falso', 200::DECIMAL)::instrutor; 
    END
$$ LANGUAGE plpgsql;

SELECT id, salario FROM cria_instrutor_falso(); 

CREATE OR REPLACE FUNCTION cria_instrutor_falso() RETURNS instrutor AS $$ 
    DECLARE
        retorno instrutor;
    BEGIN
       SELECT 22, 'Nome falso', 200::DECIMAL INTO retorno; 

       RETURN retorno;
    END
$$ LANGUAGE plpgsql;

SELECT id, salario FROM cria_instrutor_falso(); 

DROP FUNCTION instrutores_bem_pagos;

CREATE FUNCTION instrutores_bem_pagos(valor_salario DECIMAL) RETURNS SETOF instrutor AS $$
    BEGIN
        RETURN QUERY SELECT * FROM instrutor WHERE salario > valor_salario;
    END;
$$ LANGUAGE plpgsql;

SELECT * FROM instrutores_bem_pagos(300);