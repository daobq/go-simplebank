-- name: CreateAccount :one
INSERT INTO accounts (
    owner,
    balance,
    currency
) VALUES (
             $1, $2, $3
         ) RETURNING *;

-- name: GetAccount :one
SELECT (owner, balance, currency) FROM accounts WHERE id = $1;

-- name: GetListAccount :many
SELECT * FROM accounts
         ORDER BY created_at
         LIMIT $1
         OFFSET $2;

-- name: UpdateAccounts :exec
UPDATE accounts
SET balance = $2
WHERE id = $1;

-- name: DeleteAccount :exec
DELETE FROM accounts WHERE id=$1;