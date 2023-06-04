CREATE USER link;

SELECT * FROM pg_user;

DROP ROLE sem_login;
CREATE ROLE sem_login LOGIN;

DROP ROLE link;
CREATE USER link PASSWORD '!MP4R4V3L$';

SELECT * from pg_roles;

REVOKE ALL ON DATABASE link FROM link;

GRANT SELECT ON TABLE public.instrutor TO link;

SELECT
    grantee,
    table_schema,
    table_name,
    privilege_type
FROM
    information_schema.role_table_grants
WHERE
    grantee = 'link';


