CREATE FUNCTION salario_ok (instrutor instrutor) RETURNS VARCHAR AS $$
    BEGIN 
        -- se o salário do instrutor for maior do que 200, está ok. Senão pode aumentar
        IF instrutor.salario > 200 THEN
            RETURN 'Salário está ok.';
        ELSE 
            RETURN 'Salário pode aumentar';
        END IF;
    END;
$$ LANGUAGE plpgsql;

SELECT nome, salario_ok(instrutor) FROM instrutor;

DROP FUNCTION salario_ok;
CREATE FUNCTION salario_ok (id_instrutor INTEGER) RETURNS VARCHAR AS $$
    DECLARE
        instrutor instrutor;
    BEGIN 
        SELECT * FROM instrutor WHERE id = id_instrutor INTO instrutor;

        -- se o salário do instrutor for maior do que 200, está ok. Senão pode aumentar
        IF instrutor.salario > 200 THEN
            RETURN 'Salário está ok.';
        ELSE 
            RETURN 'Salário pode aumentar';
        END IF;
    END;
$$ LANGUAGE plpgsql;


SELECT nome, salario_ok(instrutor.id) FROM instrutor;