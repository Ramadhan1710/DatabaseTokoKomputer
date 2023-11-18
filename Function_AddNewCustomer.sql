CREATE OR REPLACE FUNCTION add_customer(
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    address VARCHAR(100),
    city VARCHAR(50),
    phone VARCHAR(15),
    email VARCHAR(50)
)
RETURNS INTEGER AS $$
DECLARE
    customer_id INTEGER;
BEGIN
    -- Menambahkan pelanggan baru ke tabel Customer
    INSERT INTO "Customer" ("FirstName", "LastName", "Address", "City", "Phone", "Email")
    VALUES (first_name, last_name, address, city, phone, email)
    RETURNING "CustomerId" INTO customer_id;

    -- Mengembalikan ID pelanggan yang baru ditambahkan
    RETURN customer_id;
END;
$$ LANGUAGE plpgsql;

SELECT add_customer('John', 'Doe', '123 Main St', 'Cityville', '555-1234', 'john.doe@example.com');
