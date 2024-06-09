-- Xóa chỉ mục
DROP INDEX IF EXISTS "reviews_rating";
DROP INDEX IF EXISTS "reviews_product_id";
DROP INDEX IF EXISTS "reviews_user_id";
DROP INDEX IF EXISTS "addresses_city";
DROP INDEX IF EXISTS "addresses_user_id";
DROP INDEX IF EXISTS "order_items_product_id";
DROP INDEX IF EXISTS "order_items_order_id";
DROP INDEX IF EXISTS "orders_status";
DROP INDEX IF EXISTS "orders_user_id";
DROP INDEX IF EXISTS "products_category_id";
DROP INDEX IF EXISTS "products_name";
DROP INDEX IF EXISTS "categories_name";
DROP INDEX IF EXISTS "users_email";
DROP INDEX IF EXISTS "users_username";

-- Xóa bảng
DROP TABLE IF EXISTS "reviews";
DROP TABLE IF EXISTS "addresses";
DROP TABLE IF EXISTS "order_items";
DROP TABLE IF EXISTS "orders";
DROP TABLE IF EXISTS "products";
DROP TABLE IF EXISTS "categories";
DROP TABLE IF EXISTS "users";
