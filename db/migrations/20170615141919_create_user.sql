-- +micrate Up
CREATE TABLE users (
  id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(200),
  username VARCHAR(200),
  password VARCHAR(200),
  phone int(100),
  address TEXT(400),
  email VARCHAR(255) NOT NULL,
  registered TIMESTAMP ,
  brith DATETIME
);

-- +micrate Down
DROP TABLE IF EXISTS users;
