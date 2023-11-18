CREATE OR REPLACE FUNCTION get_invoices_by_customer_name(full_name VARCHAR)
RETURNS TABLE (
    "InvoiceId" INT,
    "InvoiceDate" DATE,
    "InvoiceTotal" DECIMAL(10, 2)
) AS $$
DECLARE
    first_name VARCHAR;
    last_name VARCHAR;
BEGIN
    first_name := SUBSTRING(full_name FROM '^[^ ]+');
    last_name := SUBSTRING(full_name FROM '[^ ]+$');

    RETURN QUERY
    SELECT
        i."InvoiceId",
        i."InvoiceDate",
        i."InvoiceTotal"
    FROM
        "Invoice" i
    JOIN
        "Customer" c ON i."CustomerId" = c."CustomerId"
    WHERE
        c."FirstName" = first_name AND c."LastName" = last_name;
END;
$$ LANGUAGE plpgsql;

--ganti nama customer yang diinginkan
SELECT * FROM get_invoices_by_customer_name('John Doe');

