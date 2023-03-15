package author

import "context"

type Repository interface {
	Create(ctx context.Context, author *Author) error
	FindOne(ctx context.Context, id string) (Author, error)
	FindAll(ctx context.Context) (a []Author, err error)
	Update(ctx context.Context, author Author) error
	Delete(ctx context.Context, id string) error
}
