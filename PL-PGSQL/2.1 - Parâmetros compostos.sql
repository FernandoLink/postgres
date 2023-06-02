CREATE TABLE instrutor (
    id SERIAL PRIMARY KEY,
        nome VARCHAR(255) NOT NULL,
        salario DECIMAL(10, 2)
);

INSERT INTO instrutor (nome, salario) VALUES ('Fernando Link', 100);
INSERT INTO instrutor (nome, salario) VALUES ('Valeria Link', 200);
INSERT INTO instrutor (nome, salario) VALUES ('Henrique Link', 300);
INSERT INTO instrutor (nome, salario) VALUES ('Luiza Link', 300);

CREATE FUNCTION dobro_do_salario(instrutor) RETURNS DECIMAL AS $$ 
    SELECT $1.salario * 2 AS dobro;
$$ LANGUAGE SQL;

SELECT nome, dobro_do_salario(instrutor.*) FROM instrutor;

SELECT nome, dobro_do_salario(instrutor) FROM instrutor;