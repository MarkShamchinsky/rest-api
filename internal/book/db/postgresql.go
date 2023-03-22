package db

import (
	"context"
	"rest-api/internal/author"
	"rest-api/internal/book"
	"rest-api/pkg/logging"
	"rest-api/pkg/postresql"
)

type repository struct {
	client postresql.Client
	logger *logging.Logger
}

func (r *repository) FindAll(ctx context.Context) (b []book.Book, err error) {
	q := `
	SELECT id, name FROM public.book;
	`
	rows, err := r.client.Query(ctx, q)
	if err != nil {
		return nil, err
	}

	books := make([]book.Book, 0)
	for rows.Next() {
		var bk book.Book

		err = rows.Scan(&bk.ID, &bk.Name)
		if err != nil {
			return nil, err
		}

		sq := `
SELECT
	a.id, a.name
FROM book_authors
JOIN public.author a on a.id = book_authors.author_id
WHERE book_id = $1;	
    `
		authorsRows, err := r.client.Query(ctx, sq, bk.ID)

		if err != nil {
			return nil, err
		}

		authors := make([]author.Author, 0)
		for authorsRows.Next() {
			var ath author.Author

			err = authorsRows.Scan(&ath.ID, &ath.Name)
			if err != nil {
				return nil, err
			}
			authors = append(authors, ath)
		}
		bk.Authors = authors

		books = append(books, bk)
	}
	err = rows.Err()
	if err != nil {
		return nil, err
	}
	return books, nil
}

func NewRepository(client postresql.Client, logger *logging.Logger) book.Repository {
	return &repository{
		client: client,
		logger: logger,
	}

}
