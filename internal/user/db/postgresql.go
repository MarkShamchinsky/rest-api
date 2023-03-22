package db

import (
	"context"
	"rest-api/internal/user"
	"rest-api/pkg/logging"
	"rest-api/pkg/postresql"
)

type repository struct {
	client postresql.Client
	logger *logging.Logger
}

func (r repository) Create(ctx context.Context, user user.User) (string, error) {
	//TODO implement me
	panic("implement me")
}

func (r repository) FindOne(ctx context.Context, id string) (user.User, error) {
	//TODO implement me
	panic("implement me")
}

func (r repository) FindAll(ctx context.Context) (u []user.User, err error) {
	//TODO implement me
	panic("implement me")
}

func (r repository) Update(ctx context.Context, user user.User) error {
	//TODO implement me
	panic("implement me")
}

func (r repository) Delete(ctx context.Context, id string) error {
	//TODO implement me
	panic("implement me")
}

func NewRepository(client postresql.Client, logger *logging.Logger) user.Storage {
	return &repository{
		client: client,
		logger: logger,
	}

}
