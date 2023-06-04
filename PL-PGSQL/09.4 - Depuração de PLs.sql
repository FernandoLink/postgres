CREATE OR REPLACE FUNCTION cria_instrutor() RETURNS TRIGGER AS $$ 
    DECLARE
        media_salarial DECIMAL;
        instrutor_recebe_menos INTEGER DEFAULT 0;
        total_instrutores INTEGER DEFAULT 0;
        salario DECIMAL;
        percentual DECIMAL(5,2);
        Logs_inseridos INTEGER;
    BEGIN
        SELECT AVG(instrutor.salario) INTO media_salarial FROM instrutor WHERE id <> NEW.id;

        IF NEW.salario > media_salarial THEN
            INSERT INTO log_instrutores (informacao) VALUES (NEW.nome || ' recebe acima da média');
			GET DIAGNOSTICS logs_inseridos = ROW_COUNT;
			
			IF logs_inseridos > 1 THEN
				RAISE EXCEPTION 'Algo de errado não está certo';
			END IF;
        END IF;

        FOR salario IN SELECT instrutor.salario FROM instrutor WHERE id <> NEW.id LOOP
            total_instrutores := total_instrutores + 1;

            RAISE NOTICE 'Salário inserido: % Salário dos instrutor existente: %', NEW.salario, salario;
            IF NEW.salario > salario THEN
                instrutor_recebe_menos := instrutor_recebe_menos + 1;
            END IF;    
        END LOOP;

        percentual = instrutor_recebe_menos::DECIMAL / total_instrutores::DECIMAL * 100;
        ASSERT percentual < 100::DECIMAL, 'instrutores novos não podem receber mais do que todos os antigos';

        INSERT INTO log_instrutores (informacao, teste) 
            VALUES (NEW.nome || ' recebe mais do que ' || percentual || '% da grade de instrutores','');			

        RETURN NEW;
    END;
$$ LANGUAGE plpgsql;

INSERT INTO instrutor (nome, salario) VALUES ('João', 6000);