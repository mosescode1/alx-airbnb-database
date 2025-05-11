-- Seed Users
INSERT INTO "User" ("user_id", "first_name", "lastt_name", "email", "password_hash", "phone_number", "role", "created_at") VALUES
(gen_random_uuid(), 'Alice', 'Smith', 'alice@example.com', 'hashedpassword1', '1234567890', 'guest', NOW()),
(gen_random_uuid(), 'Bob', 'Johnson', 'bob@example.com', 'hashedpassword2', '9876543210', 'host', NOW());

-- Seed Properties
INSERT INTO "Property" ("property_id", "host_id", "name", "description", "location", "pricepernight", "created_at", "updated_at") VALUES
(gen_random_uuid(), 2, 'Seaside Villa', 'A beautiful beach house.', 'California', 199.99, NOW(), NOW()),
(gen_random_uuid(), 2, 'Mountain Cabin', 'Cozy cabin in the mountains.', 'Colorado', 149.99, NOW(), NOW());

-- Seed Bookings
INSERT INTO "Booking" ("booking_id", "property_id", "user_id", "start_date", "end_date", "total_price", "status", "created_at") VALUES
(gen_random_uuid(), 1, 1, '2025-06-01', '2025-06-07', 1199.94, 'confirmed', NOW()),
(gen_random_uuid(), 2, 1, '2025-07-15', '2025-07-20', 749.95, 'pending', NOW());

-- Seed Payments
INSERT INTO "Payment" ("payment_id", "booking_id", "amount", "payment_date", "payment_method") VALUES
(gen_random_uuid(), 1, 1199.94, '2025-05-01', 'credit_card'),
(gen_random_uuid(), 2, 749.95, '2025-05-02', 'paypal');

-- Seed Reviews
INSERT INTO "review" ("review_id", "property_id", "user_id", "rating", "comment", "created_at") VALUES
(gen_random_uuid(), 1, 1, 5, 'Fantastic stay! Clean and comfortable.', EXTRACT(EPOCH FROM NOW())::BIGINT),
(gen_random_uuid(), 2, 1, 4, 'Lovely views, but a bit cold at night.', EXTRACT(EPOCH FROM NOW())::BIGINT);
