CREATE FUNCTION primeira_pl () RETURNS INTEGER AS $$ 
    SELECT 1;
$$ LANGUAGE plpgsql;

DROP FUNCTION primeira_pl;

CREATE FUNCTION primeira_pl () RETURNS INTEGER AS $$ 
    BEGIN
        SELECT 1;
    END  
$$ LANGUAGE plpgsql;

SELECT primeira_pl();

CREATE OR REPLACE FUNCTION primeira_pl () RETURNS INTEGER AS $$ 
    BEGIN
        -- Vários comandos em SQL
        RETURN 1;
    END  
$$ LANGUAGE plpgsql;

SELECT primeira_pl();