-- Create ProductCategories table
CREATE TABLE i213_ProductCategories (
    prct_id SERIAL PRIMARY KEY,
    prct_title VARCHAR(100),
    prct_desc VARCHAR(255)
);

-- Create HSNCodes table
CREATE TABLE i213_HSNCodes (
    hsnc_id SERIAL PRIMARY KEY,
    hsnc_hsncode VARCHAR(20),
    hsnc_gstc_percentage NUMERIC
);

-- Create Products table
CREATE TABLE i213_Productsdata (
    prod_id SERIAL PRIMARY KEY,
    prod_title VARCHAR(100),
    prod_prct_id INT,
    prod_hsnc_id INT,
    prod_brand VARCHAR(100),
    prod_image VARCHAR(255),
    FOREIGN KEY (prod_prct_id) REFERENCES i213_ProductCategories(prct_id),
    FOREIGN KEY (prod_hsnc_id) REFERENCES i213_HSNCodes(hsnc_id)
);

-- Create ProductStock table
CREATE TABLE i213_ProductStock (
    prod_id INT,
    prod_batchno VARCHAR(20),
    prod_price NUMERIC,
    prod_stock INT,
    prod_mrp NUMERIC,
    FOREIGN KEY (prod_id) REFERENCES i213_Productsdata(prod_id)
);

-- Create OrderValueWiseShippingCharges table
CREATE TABLE i213_OrderValueWiseShippingCharges (
    orvl_id SERIAL PRIMARY KEY,
    orvl_from NUMERIC,
    orvl_to NUMERIC,
    orvl_shippingamount NUMERIC
);

-- Create ServiceableRegions table
CREATE TABLE i213_ServiceableRegions (
    srrg_id SERIAL PRIMARY KEY,
    srrg_name VARCHAR(100),
    srrg_pinfrom INT,
    srrg_pinto INT
);

-- Create ProductCategoryWiseServiceableRegions table
CREATE TABLE i213_ProductCategoryWiseServiceableRegions (
    prct_id INT,
    srrg_id INT,
    PRIMARY KEY (prct_id, srrg_id),
    FOREIGN KEY (prct_id) REFERENCES i213_ProductCategories(prct_id),
    FOREIGN KEY (srrg_id) REFERENCES i213_ServiceableRegions(srrg_id)
);

-- Insert sample data into ProductCategories table
INSERT INTO i213_ProductCategories (prct_title, prct_desc) VALUES
    ('Electronics', 'Electronic gadgets and devices'),
    ('Clothing', 'Clothes and apparels'),
    ('Books', 'Books of various genres');

-- Insert sample data into HSNCodes table
INSERT INTO i213_HSNCodes (hsnc_hsncode, hsnc_gstc_percentage) VALUES
    ('123456', 18.0),
    ('789012', 12.0),
    ('345678', 5.0);

-- Insert sample data into Products table using Lorem Picsum for placeholder images
INSERT INTO i213_Productsdata (prod_title, prod_prct_id, prod_hsnc_id, prod_brand, prod_image) VALUES
    ('Smartphone', 1, 1, 'Samsung', 'https://picsum.photos/320/240?random=1'),
    ('T-Shirt', 2, 2, 'Nike', 'https://picsum.photos/320/240?random=2'),
    ('Harry Potter and the Philosopher''s Stone', 3, 3, 'Bloomsbury', 'https://picsum.photos/320/240?random=3'),
    ('Laptop', 1, 1, 'Dell', 'https://picsum.photos/320/240?random=4'),
    ('Jeans', 2, 2, 'Levi''s', 'https://picsum.photos/320/240?random=5'),
    ('Lord of the Rings: The Fellowship of the Ring', 3, 3, 'HarperCollins', 'https://picsum.photos/320/240?random=6'),
    ('Headphones', 1, 1, 'Sony', 'https://picsum.photos/320/240?random=7'),
    ('Dress Shirt', 2, 2, 'Calvin Klein', 'https://picsum.photos/320/240?random=8'),
    ('To Kill a Mockingbird', 3, 3, 'Harper Lee', 'https://picsum.photos/320/240?random=9');

-- Insert more sample data into ProductStock table
INSERT INTO i213_ProductStock (prod_id, prod_batchno, prod_price, prod_stock, prod_mrp) VALUES
    (1, 'SN123', 799.99, 100, 899.99),
    (2, 'TS456', 29.99, 500, 39.99),
    (3, 'HP001', 12.99, 300, 14.99),
    (4, 'LT789', 1299.99, 50, 1499.99),
    (5, 'JN012', 49.99, 200, 59.99),
    (6, 'LOTR001', 19.99, 400, 24.99),
    (7, 'HD345', 149.99, 150, 169.99),
    (8, 'DS789', 69.99, 300, 79.99),
    (9, 'TKAM007', 9.99, 250, 12.99);

-- Insert sample data into ServiceableRegions table
INSERT INTO i213_ServiceableRegions (srrg_name, srrg_pinfrom, srrg_pinto) VALUES
    ('North Region', 100000, 199999),
    ('South Region', 200000, 299999),
    ('East Region', 300000, 399999);

-- Insert sample data into ProductCategoryWiseServiceableRegions table
INSERT INTO i213_ProductCategoryWiseServiceableRegions (prct_id, srrg_id) VALUES
    (1, 1),
    (2, 2),
    (3, 3);

-- Insert sample data into OrderValueWiseShippingCharges table
INSERT INTO i213_OrderValueWiseShippingCharges (orvl_from, orvl_to, orvl_shippingamount) VALUES
    (0, 2000, 100),
    (2001, 5000, 150),
    (5001, 10000, 200);
