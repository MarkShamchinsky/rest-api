package book

type CreateBookDTO struct {
	ID       string `json:"id"`
	Name     string `json:"name"`
	AuthorID string `json:"author_id"`
}
