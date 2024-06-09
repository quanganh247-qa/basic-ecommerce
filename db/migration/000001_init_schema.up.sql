CREATE TABLE "users" (
  "id" bigserial PRIMARY KEY,
  "username" varchar(50) UNIQUE NOT NULL,
  "email" varchar(100) UNIQUE NOT NULL,
  "password_hash" varchar(255) NOT NULL,
  "first_name" varchar(50),
  "last_name" varchar(50),
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE INDEX ON "users" ("username");
CREATE INDEX ON "users" ("email");

CREATE TABLE "categories" (
  "id" bigserial PRIMARY KEY,
  "name" varchar(100) NOT NULL,
  "description" text,
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE INDEX ON "categories" ("name");
CREATE TABLE "products" (
  "id" bigserial PRIMARY KEY,
  "name" varchar(100) NOT NULL,
  "description" text,
  "price" numeric(10, 2) NOT NULL,
  "category_id" bigint REFERENCES "categories" ("id"),
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE INDEX ON "products" ("name");
CREATE INDEX ON "products" ("category_id");
CREATE TABLE "orders" (
  "id" bigserial PRIMARY KEY,
  "user_id" bigint REFERENCES "users" ("id"),
  "total" numeric(10, 2) NOT NULL,
  "status" varchar(50) DEFAULT 'pending',
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE INDEX ON "orders" ("user_id");
CREATE INDEX ON "orders" ("status");
CREATE TABLE "order_items" (
  "id" bigserial PRIMARY KEY,
  "order_id" bigint REFERENCES "orders" ("id"),
  "product_id" bigint REFERENCES "products" ("id"),
  "quantity" integer NOT NULL,
  "price" numeric(10, 2) NOT NULL
);

CREATE INDEX ON "order_items" ("order_id");
CREATE INDEX ON "order_items" ("product_id");
CREATE TABLE "addresses" (
  "id" bigserial PRIMARY KEY,
  "user_id" bigint REFERENCES "users" ("id"),
  "address_line1" varchar(255) NOT NULL,
  "address_line2" varchar(255),
  "city" varchar(100) NOT NULL,
  "state" varchar(100),
  "postal_code" varchar(20) NOT NULL,
  "country" varchar(100) NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE INDEX ON "addresses" ("user_id");
CREATE INDEX ON "addresses" ("city");
CREATE TABLE "reviews" (
  "id" bigserial PRIMARY KEY,
  "user_id" bigint REFERENCES "users" ("id"),
  "product_id" bigint REFERENCES "products" ("id"),
  "rating" integer NOT NULL CHECK (rating >= 1 AND rating <= 5),
  "comment" text,
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE INDEX ON "reviews" ("user_id");
CREATE INDEX ON "reviews" ("product_id");
CREATE INDEX ON "reviews" ("rating");
