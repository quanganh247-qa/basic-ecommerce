// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.26.0
// source: products.sql

package db

import (
	"context"

	"github.com/jackc/pgx/v5/pgtype"
)

const createProduct = `-- name: CreateProduct :one
INSERT INTO products (
  name, description, price, category_id
) VALUES (
  $1, $2, $3, $4
)
RETURNING id, name, description, price, category_id, created_at
`

type CreateProductParams struct {
	Name        string         `json:"name"`
	Description pgtype.Text    `json:"description"`
	Price       pgtype.Numeric `json:"price"`
	CategoryID  pgtype.Int8    `json:"category_id"`
}

func (q *Queries) CreateProduct(ctx context.Context, arg CreateProductParams) (Product, error) {
	row := q.db.QueryRow(ctx, createProduct,
		arg.Name,
		arg.Description,
		arg.Price,
		arg.CategoryID,
	)
	var i Product
	err := row.Scan(
		&i.ID,
		&i.Name,
		&i.Description,
		&i.Price,
		&i.CategoryID,
		&i.CreatedAt,
	)
	return i, err
}

const deleteProduct = `-- name: DeleteProduct :exec
DELETE FROM products
WHERE id = $1
`

func (q *Queries) DeleteProduct(ctx context.Context, id int64) error {
	_, err := q.db.Exec(ctx, deleteProduct, id)
	return err
}

const getProduct = `-- name: GetProduct :one
SELECT id, name, description, price, category_id, created_at FROM products
WHERE id = $1 LIMIT 1
`

func (q *Queries) GetProduct(ctx context.Context, id int64) (Product, error) {
	row := q.db.QueryRow(ctx, getProduct, id)
	var i Product
	err := row.Scan(
		&i.ID,
		&i.Name,
		&i.Description,
		&i.Price,
		&i.CategoryID,
		&i.CreatedAt,
	)
	return i, err
}

const listProducts = `-- name: ListProducts :many
SELECT id, name, description, price, category_id, created_at FROM products
ORDER BY id
LIMIT $1
OFFSET $2
`

type ListProductsParams struct {
	Limit  int32 `json:"limit"`
	Offset int32 `json:"offset"`
}

func (q *Queries) ListProducts(ctx context.Context, arg ListProductsParams) ([]Product, error) {
	rows, err := q.db.Query(ctx, listProducts, arg.Limit, arg.Offset)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	items := []Product{}
	for rows.Next() {
		var i Product
		if err := rows.Scan(
			&i.ID,
			&i.Name,
			&i.Description,
			&i.Price,
			&i.CategoryID,
			&i.CreatedAt,
		); err != nil {
			return nil, err
		}
		items = append(items, i)
	}
	if err := rows.Err(); err != nil {
		return nil, err
	}
	return items, nil
}

const updateProduct = `-- name: UpdateProduct :one
UPDATE products
SET name = $2, description = $3, price = $4, category_id = $5
WHERE id = $1
RETURNING id, name, description, price, category_id, created_at
`

type UpdateProductParams struct {
	ID          int64          `json:"id"`
	Name        string         `json:"name"`
	Description pgtype.Text    `json:"description"`
	Price       pgtype.Numeric `json:"price"`
	CategoryID  pgtype.Int8    `json:"category_id"`
}

func (q *Queries) UpdateProduct(ctx context.Context, arg UpdateProductParams) (Product, error) {
	row := q.db.QueryRow(ctx, updateProduct,
		arg.ID,
		arg.Name,
		arg.Description,
		arg.Price,
		arg.CategoryID,
	)
	var i Product
	err := row.Scan(
		&i.ID,
		&i.Name,
		&i.Description,
		&i.Price,
		&i.CategoryID,
		&i.CreatedAt,
	)
	return i, err
}
