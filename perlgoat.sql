CREATE TABLE admin (
    id INTEGER primary key,
    username VARCHAR(255),
    password VARCHAR(255),
    name VARCHAR(255),
    admin INTEGER
);

INSERT INTO admin VALUES (1,'admin','admin','Administrative user', 1);
