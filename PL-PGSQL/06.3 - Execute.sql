CREATE OR REPLACE FUNCTION contador(id INTEGER) RETURNS INTEGER AS $$
	DECLARE
		cont INTEGER;
	BEGIN
		EXECUTE 'SELECT COUNT(*) FROM aluno WHERE id >= $1'
		INTO cont
		USING id;
		RETURN cont;
	END;
$$ LANGUAGE plpgsql;

select contador(3);

SELECT * FROM aluno;