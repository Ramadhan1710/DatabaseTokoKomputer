CREATE OR REPLACE PROCEDURE add_purchase(
    product_id INT,
    purchase_date DATE,
    purchase_quantity INT,
    purchase_price DECIMAL(10, 2),
    supplier_name VARCHAR(250)
)
AS $$
BEGIN
    INSERT INTO "Purchase" ("ProductId", "PurchaseDate", "PurchaseQuantity", "PurchasePrice", "SupplierName")
    VALUES (product_id, purchase_date, purchase_quantity, purchase_price, supplier_name);
END;
$$ LANGUAGE plpgsql;

-- Menggunakan CALL
CALL add_purchase(1, '2023-09-01', 6, 89.99, 'Supplier A');
