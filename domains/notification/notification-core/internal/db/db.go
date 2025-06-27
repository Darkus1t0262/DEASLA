package db

import (
    "context"
    "fmt"
    "os"
    "github.com/jackc/pgx/v5/pgxpool"
)

var PgPool *pgxpool.Pool

func InitPostgres() error {
    dsn := os.Getenv("DATABASE_URL")
    if dsn == "" {
        dsn = "postgres://postgres:postgres@postgres:5432/deasla"
    }

    var err error
    PgPool, err = pgxpool.New(context.Background(), dsn)
    if err != nil {
        return fmt.Errorf("unable to connect to database: %w", err)
    }
    return nil
}
