CREATE INDEX idx_salario ON instrutor (salario);
REINDEX TABLE instrutor;

EXPLAIN SELECT * FROM instrutor WHERE salario > 1500;
EXPLAIN VERBOSE SELECT * FROM instrutor WHERE salario > 1500;
EXPLAIN ANALYSE VERBOSE SELECT * FROM instrutor WHERE salario > 1500;
EXPLAIN SELECT * FROM instrutor;
EXPLAIN ANALYSE SELECT * FROM instrutor;

