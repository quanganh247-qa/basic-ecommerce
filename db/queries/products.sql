-- name: CreateProduct :one
INSERT INTO products (
  name, description, price, category_id
) VALUES (
  $1, $2, $3, $4
)
RETURNING *;

-- name: GetProduct :one
SELECT * FROM products
WHERE id = $1 LIMIT 1;

-- name: ListProducts :many
SELECT * FROM products
ORDER BY id
LIMIT $1
OFFSET $2;

-- name: UpdateProduct :one
UPDATE products
SET name = $2, description = $3, price = $4, category_id = $5
WHERE id = $1
RETURNING *;

-- name: DeleteProduct :exec
DELETE FROM products
WHERE id = $1;
