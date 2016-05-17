Drop Table shoos;

CREATE TABLE shoos (
  id SERIAL8 primary key,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  style VARCHAR(255),
  size INT2,
  quantity INT2
);
