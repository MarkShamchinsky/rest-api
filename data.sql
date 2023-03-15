CREATE TABLE public.author (
                               id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                               name VARCHAR(100) NOT NULL
);


CREATE TABLE public.book (
                             id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                             name VARCHAR(100) NOT NULL,
                             author_id UUID NOT NULL,
                             CONSTRAINT author_fk FOREIGN KEY (author_id) REFERENCES public.author(id)
);

INSERT INTO author (name) VALUES ('Народ');
INSERT INTO author (name) VALUES ('Джоан Роулинг');
INSERT INTO author (name) VALUES ('Джек Лондон');

INSERT INTO book (name, author_id) VALUES ('Колобок', 'f1865e30-b625-42ca-917d-6311945d9765');
INSERT INTO book (name, author_id) VALUES ('Гарри Поттер', 'd00e8448-6406-4256-9d09-ab7bb50a441d');
INSERT INTO book (name, author_id) VALUES ('Брилианты', '2c444995-4330-4f47-b064-499c25c9577f')