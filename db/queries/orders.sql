-- name: CreateOrder :one
INSERT INTO orders (
  user_id, total, status
) VALUES (
  $1, $2, $3
)
RETURNING *;

-- name: GetOrder :one
SELECT * FROM orders
WHERE id = $1 LIMIT 1;

-- name: ListOrders :many
SELECT * FROM orders
ORDER BY id
LIMIT $1
OFFSET $2;

-- name: UpdateOrder :one
UPDATE orders
SET total = $2, status = $3
WHERE id = $1
RETURNING *;

-- name: DeleteOrder :exec
DELETE FROM orders
WHERE id = $1;
