CREATE TABLE public.author (
                               id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                               name VARCHAR(100) NOT NULL
);


CREATE TABLE public.book (
     id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
     name VARCHAR(100) NOT NULL
);

CREATE TABLE public.book_authors (
     id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
     book_id UUID NOT NULL,
     author_id UUID NOT NULL,

     CONSTRAINT book_fk FOREIGN KEY (book_id) REFERENCES public.book(id),
     CONSTRAINT author_fk FOREIGN KEY (author_id) REFERENCES public.author(id),
     CONSTRAINT book_author_unique UNIQUE (book_id, author_id)
);

INSERT INTO author (id, name) VALUES ('f1865e30-b625-42ca-917d-6311945d9765','Народ');
INSERT INTO author (id, name) VALUES ('d00e8448-6406-4256-9d09-ab7bb50a441d','Джоан Роулинг');
INSERT INTO author (id, name) VALUES ('2c444995-4330-4f47-b064-499c25c9577f','Джек Лондон');

INSERT INTO book (id, name) VALUES ('6f7dcd9b-4a55-4a6e-92d4-85d83830719c','Колобок');
INSERT INTO book (id, name) VALUES ('3a254ff3-9e7c-4554-a5d9-58f50602b29a','Гарри Поттер');
INSERT INTO book (id, name) VALUES ('07a2da3b-9862-4543-9715-cb97beff378d','Брилианты');


--Kolobok
INSERT INTO book_authors (book_id, author_id) VALUES ('6f7dcd9b-4a55-4a6e-92d4-85d83830719c','f1865e30-b625-42ca-917d-6311945d9765');
INSERT INTO book_authors (book_id, author_id) VALUES ('6f7dcd9b-4a55-4a6e-92d4-85d83830719c','d00e8448-6406-4256-9d09-ab7bb50a441d');
--HP
INSERT INTO book_authors (book_id, author_id) VALUES ('3a254ff3-9e7c-4554-a5d9-58f50602b29a','f1865e30-b625-42ca-917d-6311945d9765');
INSERT INTO book_authors (book_id, author_id) VALUES ('3a254ff3-9e7c-4554-a5d9-58f50602b29a','d00e8448-6406-4256-9d09-ab7bb50a441d');
INSERT INTO book_authors (book_id, author_id) VALUES ('3a254ff3-9e7c-4554-a5d9-58f50602b29a','2c444995-4330-4f47-b064-499c25c9577f');


SELECT
    b.id, b.name,
    array((SELECT ba.author_id FROM book_authors ba WHERE ba.book_id = b.id)) AS authors
FROM book b;


SELECT
    a.id, a.name
FROM book_authors
JOIN public.author a on a.id = book_authors.author_id
WHERE book_id = '6f7dcd9b-4a55-4a6e-92d4-85d83830719c';


SELECT
    *, (SELECT count(*) FROM book_authors WHERE book_id = b.id) as authors_count
FROM book b





