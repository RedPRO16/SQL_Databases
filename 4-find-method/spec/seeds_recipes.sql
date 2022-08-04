TRUNCATE TABLE recipes RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO recipes (name, cook_time, rating) VALUES ('Donut', 10, 3);
INSERT INTO recipes (name, cook_time, rating) VALUES ('Fries', 20, 5);