-- Table: public.editorials

-- DROP TABLE IF EXISTS public.editorials;

CREATE TABLE IF NOT EXISTS public.editorials
(
    id_editorial integer NOT NULL DEFAULT nextval('editorials_id_editorial_seq'::regclass),
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    deleted_at timestamp with time zone,
    CONSTRAINT "PK_03f6b1b4c5af695671577d116b8" PRIMARY KEY (id_editorial)
)

ALTER TABLE IF EXISTS public.editorials
    OWNER to postgres;
	
-- Table: public.genders

-- DROP TABLE IF EXISTS public.genders;

CREATE TABLE IF NOT EXISTS public.genders
(
    id_gender integer NOT NULL DEFAULT nextval('genders_id_gender_seq'::regclass),
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    deleted_at timestamp with time zone,
    CONSTRAINT "PK_c438676e8062218f1b431bb4274" PRIMARY KEY (id_gender)
)

ALTER TABLE IF EXISTS public.genders
    OWNER to postgres;
	
-- Table: public.authors

-- DROP TABLE IF EXISTS public.authors;

CREATE TABLE IF NOT EXISTS public.authors
(
    id_author integer NOT NULL DEFAULT nextval('authors_id_author_seq'::regclass),
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    deleted_at timestamp with time zone,
    CONSTRAINT "PK_409d379f22ff5535805aea2cb20" PRIMARY KEY (id_author)
)

ALTER TABLE IF EXISTS public.authors
    OWNER to postgres;
	
-- Table: public.books

-- DROP TABLE IF EXISTS public.books;

CREATE TABLE IF NOT EXISTS public.books
(
    id_book integer NOT NULL DEFAULT nextval('books_id_book_seq'::regclass),
    title character varying(255) COLLATE pg_catalog."default" NOT NULL,
    availability boolean NOT NULL DEFAULT true,
    price integer NOT NULL,
    id_gender integer NOT NULL,
    id_editorial integer NOT NULL,
    image_url character varying(500) COLLATE pg_catalog."default" NOT NULL,
    deleted_at timestamp with time zone,
    CONSTRAINT "PK_8065cbf94f3902bef4d65fcaf67" PRIMARY KEY (id_book),
    CONSTRAINT "FK_6f9d118a1dd1267695cf0576eab" FOREIGN KEY (id_gender)
        REFERENCES public.genders (id_gender) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "FK_d022b50c7664ae925eeec28358e" FOREIGN KEY (id_editorial)
        REFERENCES public.editorials (id_editorial) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

ALTER TABLE IF EXISTS public.books
    OWNER to postgres;
	
-- Table: public.books_authors

-- DROP TABLE IF EXISTS public.books_authors;

CREATE TABLE IF NOT EXISTS public.books_authors
(
    id_book_author integer NOT NULL,
    id_book integer NOT NULL,
    id_autor integer NOT NULL,
    deleted_at timestamp with time zone,
    CONSTRAINT "PK_275dc17a3bfb2f5b51d3af75496" PRIMARY KEY (id_book_author),
    CONSTRAINT "FK_59f8d45fbdd2f5f1012de2a3ef4" FOREIGN KEY (id_book)
        REFERENCES public.books (id_book) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "FK_c9b25961ef1139919bd99d1d9c1" FOREIGN KEY (id_autor)
        REFERENCES public.authors (id_author) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

ALTER TABLE IF EXISTS public.books_authors
    OWNER to postgres;