# Database Normalization – Airbnb Clone

## Goal

Ensure the schema adheres to the Third Normal Form (3NF) to eliminate redundancy and ensure data integrity.

## Step 1: First Normal Form (1NF)

- All tables have atomic values.
- No repeating or multivalued fields.

## Step 2: Second Normal Form (2NF)

- All non-key columns fully depend on the primary key (`place_id`).

## Step 3: Third Normal Form (3NF)

### Problem:

- `user_email` depends on `user_id`, not `place_id`.
- `state_name` depends on `city_name`, not `place_id`.

### Solution:

- Extract `User` into its own table.
- Extract `City` and `State` into separate tables and use foreign keys.

## Resulting Tables

- `Place(place_id, city_id, user_id)`
- `City(city_id, name, state_id)`
- `State(state_id, name)`
- `User(user_id, email)`

## Benefits

- Eliminated redundancy in city/state and user info.
- Easier updates and consistency.
