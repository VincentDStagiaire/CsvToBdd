CREATE SEQUENCE matable_id_seq;
ALTER SEQUENCE matable_id_seq OWNER TO postgres;

CREATE TABLE matable
(
    id INT PRIMARY KEY NOT NULL DEFAULT nextval('matable_id_seq'::regclass),
    col1 INT,
    col2 INT
);

ALTER TABLE matable OWNER TO postgres;




