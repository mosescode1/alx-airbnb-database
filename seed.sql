-- Users
INSERT INTO "User" ("user_id", "first_name", "lastt_name", "email", "password_hash", "phone_number", "role", "created_at")
VALUES 
(gen_random_uuid(), 'Alice', 'Johnson', 'alice@example.com', 'hashed_pw1', '1234567890', 'guest', NOW()),
(gen_random_uuid(), 'Bob', 'Smith', 'bob@example.com', 'hashed_pw2', '0987654321', 'host', NOW()),
(gen_random_uuid(), 'Admin', 'Root', 'admin@example.com', 'hashed_pw3', NULL, 'admin', NOW());

-- Properties
INSERT INTO "Property" ("property_id", "host_id", "name", "description", "location", "pricepernight", "created_at", "updated_at")
VALUES 
(gen_random_uuid(), 2, 'Seaside Villa', 'Beautiful beachside villa', 'Miami, FL', 150.00, NOW(), NOW()),
(gen_random_uuid(), 2, 'Mountain Cabin', 'Cozy cabin in the mountains', 'Denver, CO', 100.00, NOW(), NOW());

-- Bookings
INSERT INTO "Booking" ("booking_id", "property_id", "user_id", "start_date", "end_date", "total_price", "status", "created_at")
VALUES 
(gen_random_uuid(), 1, 1, '2025-06-01', '2025-06-05', 600.00, 'confirmed', NOW()),
(gen_random_uuid(), 2, 1, '2025-07-10', '2025-07-15', 500.00, 'pending', NOW());

-- Payments
INSERT INTO "Payment" ("payment_id", "booking_id", "amount", "payment_date", "payment_method")
VALUES 
(gen_random_uuid(), 1, 600.00, '2025-05-01', 'credit_card'),
(gen_random_uuid(), 2, 500.00, '2025-05-10', 'paypal');

-- Reviews
INSERT INTO "review" ("review_id", "property_id", "user_id", "rating", "comment", "created_at")
VALUES 
(gen_random_uuid(), 1, 1, 5, 'Amazing place, loved it!', EXTRACT(EPOCH FROM NOW())::BIGINT),
(gen_random_uuid(), 2, 1, 4, 'Very cozy and clean', EXTRACT(EPOCH FROM NOW())::BIGINT);
