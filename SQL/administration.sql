SELECT datname FROM pg_database;

SELECT schema_name FROM information_schema.schemata WHERE catalog_name = 'link';

SELECT table_name FROM information_schema.tables WHERE table_schema = 'public';

SELECT column_name FROM information_schema.columns WHERE table_name = 'funcionario';
