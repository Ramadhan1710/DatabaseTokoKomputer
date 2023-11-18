-- Tabel Customer
CREATE TABLE "Customer" (
    "CustomerId" SERIAL PRIMARY KEY,
    "FirstName" VARCHAR(50),
    "LastName" VARCHAR(50),
    "Address" VARCHAR(100),
    "City" VARCHAR(50),
    "Phone" VARCHAR(15),
    "Email" VARCHAR(50)
);

-- Tabel StaffPosition
CREATE TABLE "Position" (
    "PositionId" SERIAL PRIMARY KEY,
    "PositionName" VARCHAR(50)
);

-- Tabel Staff
CREATE TABLE "Staff" (
    "StaffId" SERIAL PRIMARY KEY,
    "FirstName" VARCHAR(50),
    "LastName" VARCHAR(50),
    "Address" VARCHAR(100),
    "City" VARCHAR(50),
    "Phone" VARCHAR(15),
    "Email" VARCHAR(50),
	"PositionId" INT,
	FOREIGN KEY ("PositionId") REFERENCES "Position"("PositionId")
);
 
-- Tabel Product
CREATE TABLE "Product" (
    "ProductId" SERIAL PRIMARY KEY,
    "ProductName" VARCHAR(100),
    "Category" VARCHAR(50),
    "ProductDescription" TEXT,
    "Price" DECIMAL(10, 2)
);
 
 
-- Tabel Stock
CREATE TABLE "Stock" (
    "StockId" SERIAL PRIMARY KEY,
    "ProductId" INT,
    "StockQuantity" INT,
    FOREIGN KEY ("ProductId") REFERENCES "Product"("ProductId")
);
 
 
-- Tabel Invoice
CREATE TABLE "Invoice" (
    "InvoiceId" SERIAL PRIMARY KEY,
    "CustomerId" INT,
    "InvoiceDate" DATE,
    "InvoiceTotal" DECIMAL(10, 2),
    "StaffId" INT,
    FOREIGN KEY ("CustomerId") REFERENCES "Customer"("CustomerId"),
    FOREIGN KEY ("StaffId") REFERENCES "Staff"("StaffId")
);
 
 
-- Tabel InvoiceLine
CREATE TABLE "InvoiceLine" (
    "InvoiceLineId" SERIAL PRIMARY KEY,
    "InvoiceId" INT,
    "ProductId" INT,
    "InvoiceQuantity" INT,
    "InvoiceSubtotal" DECIMAL(10, 2),
    FOREIGN KEY ("InvoiceId") REFERENCES "Invoice"("InvoiceId"),
    FOREIGN KEY ("ProductId") REFERENCES "Product"("ProductId")
);
 
 
-- Tabel Purchase
CREATE TABLE "Purchase" (
    "PurchaseId" SERIAL PRIMARY KEY,
    "ProductId" INT,
    "PurchaseDate" DATE,
    "PurchaseQuantity" INT,
    "PurchasePrice" DECIMAL(10, 2),
    "SupplierName" VARCHAR (250),
    FOREIGN KEY ("ProductId") REFERENCES "Product"("ProductId")
);
 
 
-- Tabel StaffSalary
CREATE TABLE "StaffSalary" (
    "StaffSalaryId" SERIAL PRIMARY KEY,
    "StaffId" INT,
    "SalaryMonth" DATE,
    "Salary" DECIMAL(10, 2),
    FOREIGN KEY ("StaffId") REFERENCES "Staff"("StaffId")
);
 
 
CREATE TABLE "Discount" (
    "DiscountId" SERIAL PRIMARY KEY,
    "DiscountName" VARCHAR(100),
    "DiscountType" VARCHAR(10),
    "DiscountValue" DECIMAL(10, 2),
    "StartDate" DATE,
    "EndDate" DATE,
    "ProductId" INT,
    FOREIGN KEY ("ProductId") REFERENCES "Product"("ProductId")
);