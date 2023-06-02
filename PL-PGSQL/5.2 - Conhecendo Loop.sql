CREATE OR REPLACE FUNCTION tabuada (numero INTEGER) RETURNS SETOF INTEGER AS $$ 
    DECLARE
        multiplicador INTEGER DEFAULT 1;
    BEGIN
    LOOP
        RETURN NEXT numero * multiplicador;
        multiplicador := multiplicador + 1;
        EXIT WHEN multiplicador = 10;
    END LOOP;
    END;
$$ LANGUAGE plpgsql;

DROP FUNCTION tabuada;
CREATE OR REPLACE FUNCTION tabuada (numero INTEGER) RETURNS SETOF VARCHAR AS $$ 
    DECLARE
        multiplicador INTEGER DEFAULT 1;
    BEGIN  
    LOOP
        RETURN NEXT numero || ' x ' || multiplicador || ' = ' || numero * multiplicador;
        multiplicador := multiplicador + 1;
        EXIT WHEN multiplicador = 10;
    END LOOP;
    END;
$$ LANGUAGE plpgsql;

SELECT tabuada(2);