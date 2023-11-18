CREATE OR REPLACE PROCEDURE add_transaction(
    customer_id INT,
    staff_id INT,
    transaction_date DATE,
    products_data INTEGER[],
    quantities_data INTEGER[]
)
AS $$
DECLARE
    invoice_id INT;
    i INT;
    total DECIMAL(10, 2) := 0;  -- Inisialisasi total transaksi
BEGIN
    -- Menambahkan data transaksi ke tabel Invoice
    INSERT INTO "Invoice" ("CustomerId", "StaffId", "InvoiceDate", "InvoiceTotal")
    VALUES (customer_id, staff_id, transaction_date, 0)
    RETURNING "InvoiceId" INTO invoice_id;

    -- Menambahkan detail transaksi ke tabel InvoiceLine dan menghitung total
    FOR i IN 1..array_length(products_data, 1)
    LOOP
        INSERT INTO "InvoiceLine" ("InvoiceId", "ProductId", "InvoiceQuantity", "InvoiceSubtotal")
        VALUES (invoice_id, products_data[i], quantities_data[i], quantities_data[i] * (SELECT "Price" FROM "Product" WHERE "ProductId" = products_data[i]));

        -- Mengakumulasi total
        total := total + quantities_data[i] * (SELECT "Price" FROM "Product" WHERE "ProductId" = products_data[i]);
    END LOOP;

    -- Mengupdate total transaksi
    UPDATE "Invoice"
    SET "InvoiceTotal" = total
    WHERE "InvoiceId" = invoice_id;
END;
$$ LANGUAGE plpgsql;


CALL add_transaction(
  2,-- Customer ID
  1 , -- Staff ID
	'2023-11-07', --Transaction_Date	
  ARRAY[1, 2, 3],  -- ProductId 
	ARRAY[5, 2, 1]   -- QuantityProduct
);
