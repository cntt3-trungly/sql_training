CREATE TABLE Category
(
    id INT IDENTITY
        CONSTRAINT Category_pk
            PRIMARY KEY nonclustered,
    name_category NCHAR(30)
)
GO
 
CREATE TABLE Product
(
    id NCHAR(10) NOT NULL
        CONSTRAINT Product_pk
            PRIMARY KEY nonclustered,
    name NCHAR(10),
    YEAR NCHAR(10),
    DATE DATE,
    price NCHAR(10),
    category_id INT
)