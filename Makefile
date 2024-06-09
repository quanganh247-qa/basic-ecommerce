migrateup:
	migrate -path db/migration -database "postgres://postgres1:DNrWA41iJo0ekopUdNjpWMb8d05Ir5cK@dpg-cpin7vuct0pc73fts5b0-a.oregon-postgres.render.com/ecommerce_zyqc"  -verbose up

migratedown:
	migrate -path db/migration -database "postgres://postgres1:DNrWA41iJo0ekopUdNjpWMb8d05Ir5cK@dpg-cpin7vuct0pc73fts5b0-a.oregon-postgres.render.com/ecommerce_zyqc"  -verbose down

sqlc:
	sqlc generate
	
.PHONY: postgres createdb dropdb migrateup migratedown sqlc test 