CREATE OR REPLACE FUNCTION instrutores_internos(id_instrutor INTEGER) RETURNS ?? AS $$
    DECLARE
        cursor_salario refcursor;
    BEGIN
        OPEN cursor_salario NO SCROLL FOR SELECT instrutor.salario 
                                    FROM instrutor 
                                 WHERE id <> id_instrutor 
                                    AND salario > 0;
        
    END;
$$ LANGUAGE plpgsql;