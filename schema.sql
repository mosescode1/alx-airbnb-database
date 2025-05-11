CREATE TABLE "Booking"(
    "booking_id" UUID NOT NULL,
    "property_id" BIGINT NOT NULL,
    "user_id" BIGINT NOT NULL,
    "start_date" DATE NOT NULL,
    "end_date" DATE NOT NULL,
    "total_price" DECIMAL(8, 2) NOT NULL,
    "status" VARCHAR(255) CHECK
        (
            "status" IN('pending', 'confirmed', 'canceled')
        ) NOT NULL DEFAULT 'pending',
        "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    "Booking" ADD PRIMARY KEY("booking_id");
CREATE INDEX "booking_property_id_index" ON
    "Booking"("property_id");
CREATE INDEX "booking_user_id_index" ON
    "Booking"("user_id");

-- Creating Property table
CREATE TABLE "Property"(
    "property_id" UUID NOT NULL,
    "host_id" BIGINT NOT NULL,
    "name" BIGINT NOT NULL,
    "description" BIGINT NOT NULL,
    "location" BIGINT NOT NULL,
    "pricepernight" DECIMAL(8, 2) NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    "Property" ADD PRIMARY KEY("property_id");
CREATE INDEX "property_host_id_index" ON
    "Property"("host_id");
CREATE TABLE "User"(
    "user_id" UUID NOT NULL,
    "first_name" VARCHAR(255) NOT NULL,
    "lastt_name" VARCHAR(255) NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "password_hash" VARCHAR(255) NOT NULL,
    "phone_number" VARCHAR(255) NULL,
    "role" VARCHAR(255) CHECK
        ("role" IN('guest', 'host', 'admin')) NOT NULL DEFAULT 'guest',
        "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    "User" ADD PRIMARY KEY("user_id");
CREATE INDEX "user_email_index" ON
    "User"("email");
CREATE TABLE "Payment"(
    "payment_id" UUID NOT NULL,
    "booking_id" BIGINT NOT NULL,
    "amount" DECIMAL(8, 2) NOT NULL,
    "payment_date" DATE NOT NULL,
    "payment_method" VARCHAR(255) CHECK
        (
            "payment_method" IN('paypal', 'credit_card', 'stripe')
        ) NOT NULL DEFAULT 'credit_card'
);
ALTER TABLE
    "Payment" ADD PRIMARY KEY("payment_id");
CREATE TABLE "review"(
    "review_id" UUID NOT NULL,
    "property_id" BIGINT NOT NULL,
    "user_id" BIGINT NOT NULL,
    "rating" BIGINT NOT NULL,
    "comment" BIGINT NOT NULL,
    "created_at" BIGINT NOT NULL
);
ALTER TABLE
    "review" ADD PRIMARY KEY("review_id");
ALTER TABLE
    "Payment" ADD CONSTRAINT "payment_payment_id_foreign" FOREIGN KEY("payment_id") REFERENCES "Booking"("booking_id");
ALTER TABLE
    "Booking" ADD CONSTRAINT "booking_booking_id_foreign" FOREIGN KEY("booking_id") REFERENCES "User"("user_id");
ALTER TABLE
    "review" ADD CONSTRAINT "review_user_id_foreign" FOREIGN KEY("user_id") REFERENCES "User"("user_id");
ALTER TABLE
    "User" ADD CONSTRAINT "user_user_id_foreign" FOREIGN KEY("user_id") REFERENCES "Property"("property_id");
ALTER TABLE
    "review" ADD CONSTRAINT "review_property_id_foreign" FOREIGN KEY("property_id") REFERENCES "Property"("property_id");
ALTER TABLE
    "Booking" ADD CONSTRAINT "booking_property_id_foreign" FOREIGN KEY("property_id") REFERENCES "Property"("property_id");